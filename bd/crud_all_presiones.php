<?php
include_once 'conexion.php';
include_once 'auth.php';
$conexion = Conexion::Conectar();

$auth = new Auth($conexion);
$usuario = $auth->verificarSesion();

$_POST = json_decode(file_get_contents("php://input"), true);
if (!is_array($_POST)) $_POST = [];

$accion     = isset($_POST['accion'])   ? $_POST['accion']   : '';
$obras      = json_decode((isset($_POST['obras'])) ? $_POST['obras'] : '', true);
$autorizado = isset($_POST['autorizado']) ? $_POST['autorizado'] : '';
$idHoja     = isset($_POST['idHoja'])   ? $_POST['idHoja']   : '';
$adeudo     = isset($_POST['parcial'])  ? $_POST['parcial']  : '';
$coments    = isset($_POST['coments'])  ? $_POST['coments']  : '';
$presion    = isset($_POST['presion'])  ? $_POST['presion']  : [];

$data = [];

switch ($accion) {
    case 1:
        $data = [$auth->getDatosParaFrontend()];
        break;

    case 2:
        $data = $auth->obtenerObrasPermitidas();
        break;

    case 3:
        // Listar presiones por obra — la lógica se mantiene igual
        $auth->requierePermiso('pagos', 'ver');
        $data = array();
        $primeraInt = 0;
        $colapseAtr = "";
        $colapseband = "true";
        $colapseShow = "show";
        foreach ($obras as $obra) {
            $consulta = "SELECT hojaRequisicion_id, requisicion_Clave, requisicion_Numero, 
                         hojaRequisicion_observaciones, hojaRequisicion_numero, requisicion_Nombre, 
                         proveedor_nombre, hojaRequisicion_total, hojaRequisicion_formaPago, 
                         hojaRequisicion_estatus, presiones_estatus, hojaRequisicion_fechaPago, 
                         hojasRequisicion_bancoPago, hojarequisicion_adeudo, presiones_id, hojarequisicion_conceptoUnico
                         FROM requisicionesligadas 
                         JOIN presiones ON presiones.presiones_id = requisicionesLigada_presionID
                         JOIN requisiciones ON requisiciones.requisicion_id = requisicionesLigadas_requisicionID 
                         JOIN hojasrequisicion ON hojasrequisicion.hojaRequisicion_id = requisicionesLigadas_hojaID 
                         JOIN provedores ON hojasrequisicion.hojaRequisicion_proveedor = provedores.proveedor_id 
                         WHERE presiones.presiones_nombre LIKE :nombre 
                         AND presiones.presiones_estatus = 'PENDIENTE'
                         ORDER BY requisicion_Clave DESC";
            $resultado = $conexion->prepare($consulta);
            $nombre = '%' . $obra['obras_nombre'] . '%';
            $resultado->bindParam(':nombre', $nombre);
            $resultado->execute();
            $dataBD = $resultado->fetchAll();
            if (count($dataBD) > 0) {
                $dataPresion = array();
                foreach ($dataBD as $hoja) {
                    $consulta = "SELECT `itemRequisicion_producto` FROM `itemrequisicion` WHERE itemRequisicion_idHoja = :idHoja";
                    $resultado = $conexion->prepare($consulta);
                    $resultado->bindParam(':idHoja', $hoja["hojaRequisicion_id"], PDO::PARAM_INT);
                    $resultado->execute();
                    $dataitms = $resultado->fetchAll();
                    array_push($dataPresion, array(
                        'id_hoja' => $hoja['hojaRequisicion_id'],
                        'id_presion' => $hoja['presiones_id'],
                        'formaPago' => obtenerAbreviatura($hoja['hojaRequisicion_formaPago']),
                        'NumReq' => obtenerNumeracionFinal($hoja['requisicion_Numero']) . " Hoja Numero: " . $hoja['hojaRequisicion_numero'],
                        'clave' => $hoja['requisicion_Clave'],
                        'concepto' => empty($hoja['hojarequisicion_conceptoUnico']) ? convertToString($dataitms) : $hoja['hojarequisicion_conceptoUnico'],
                        'proveedor' => $hoja['proveedor_nombre'],
                        'total' => $hoja['hojaRequisicion_total'],
                        'adeudo' => $hoja['hojarequisicion_adeudo'],
                        'Observaciones' => $hoja['hojaRequisicion_observaciones'],
                        "Banco" => $hoja['hojasRequisicion_bancoPago'],
                        "Fecha" => $hoja['hojaRequisicion_fechaPago'],
                        "HojaEstatus" => $hoja['hojaRequisicion_estatus'],
                        "PresionEstatus" => $hoja['presiones_estatus']
                    ));
                }
                if ($primeraInt > 0) { $colapseAtr = "collapsed"; $colapseband = "false"; $colapseShow = ""; }
                array_push($data, array(
                    'Nombre_Obra' => $obra['obras_nombre'],
                    'Presion_Obra' => $dataPresion,
                    'colapse_Atr' => $colapseAtr, 'colapse_band' => $colapseband, 'colapse_show' => $colapseShow,
                    'total_Glabal' => sumaTotal($conexion, $dataBD[0]['presiones_id'], "Propuesto"),
                    'total_Global_Aut' => sumaTotal($conexion, $dataBD[0]['presiones_id'], "Auturizado"),
                    'total_Efectivo' => sumaTotalEfectivo($conexion, $dataBD[0]['presiones_id'], "Propuesto"),
                    'total_Efectivo_Aut' => sumaTotalEfectivo($conexion, $dataBD[0]['presiones_id'], "Auturizado"),
                    'total_Transferencia' => sumaTotalTrans($conexion, $dataBD[0]['presiones_id'], "Propuesto"),
                    'total_Transferencia_Aut' => sumaTotalTrans($conexion, $dataBD[0]['presiones_id'], "Auturizado"),
                    'total_Global_Rechazado' => sumaTotal($conexion, $dataBD[0]['presiones_id'], "Rechazado"),
                    'total_Efectivo_Rechazado' => sumaTotalEfectivo($conexion, $dataBD[0]['presiones_id'], "Rechazado"),
                    'total_Transferencia_Rechazado' => sumaTotalTrans($conexion, $dataBD[0]['presiones_id'], "Rechazado")
                ));
                $primeraInt++;
            }
        }
        break;

    case 4:
        // Autorizar o Rechazar hoja — SOLO Validador, CEO, Developer
        $auth->requierePermiso('pagos', 'autorizar');
        if ($autorizado) {
            $consulta = "UPDATE `hojasrequisicion` SET `hojaRequisicion_estatus` = 'AUTORIZADA', `hojarequisicion_adeudo` = :adeudo, `hojaRequisicion_observaciones` = :observaciones WHERE `hojaRequisicion_id` = :idHoja";
            $resultado = $conexion->prepare($consulta);
            $resultado->bindValue(':adeudo', (float)$adeudo, PDO::PARAM_STR);
            $resultado->bindValue(':observaciones', $coments, PDO::PARAM_STR);
            $resultado->bindParam(':idHoja', $idHoja, PDO::PARAM_INT);
            $resultado->execute();
            $auth->registrarBitacora('AUTORIZAR', 'Hojas', $idHoja, ['adeudo' => $adeudo, 'comentarios' => $coments]);
        } else {
            $consulta = "UPDATE `hojasrequisicion` SET `hojaRequisicion_estatus` = 'LIGADA', `hojarequisicion_adeudo` = 0, `hojaRequisicion_observaciones` = :observaciones WHERE `hojaRequisicion_id` = :idHoja";
            $resultado = $conexion->prepare($consulta);
            $resultado->bindValue(':observaciones', $coments, PDO::PARAM_STR);
            $resultado->bindParam(':idHoja', $idHoja, PDO::PARAM_INT);
            $resultado->execute();
            $auth->registrarBitacora('RECHAZAR', 'Hojas', $idHoja, ['comentarios' => $coments]);
        }
        $data = ["success" => true];
        break;

    case 5:
        // Revertir a LIGADA
        $auth->requierePermiso('pagos', 'autorizar');
        $consulta = "UPDATE `hojasrequisicion` SET `hojaRequisicion_estatus` = 'LIGADA' WHERE `hojaRequisicion_id` = :id_hoja";
        $resultado = $conexion->prepare($consulta);
        $resultado->bindParam(':id_hoja', $idHoja, PDO::PARAM_INT);
        $resultado->execute();
        $auth->registrarBitacora('REVERTIR', 'Hojas', $idHoja);
        $data = 0;
        break;

    case 6:
        // Editar adeudo
        $auth->requierePermiso('pagos', 'autorizar');
        $consulta = "UPDATE `hojasrequisicion` SET `hojarequisicion_adeudo` = :adeudo, `hojaRequisicion_observaciones` = :observaciones WHERE `hojaRequisicion_id` = :id_hoja";
        $resultado = $conexion->prepare($consulta);
        $resultado->bindValue(':adeudo', (float)$adeudo, PDO::PARAM_STR);
        $resultado->bindValue(':observaciones', $coments, PDO::PARAM_STR);
        $resultado->bindParam(':id_hoja', $idHoja, PDO::PARAM_INT);
        $resultado->execute();
        $auth->registrarBitacora('EDITAR_ADEUDO', 'Hojas', $idHoja, ['adeudo' => $adeudo]);
        $data = 0;
        break;

    case 7:
        // Autorización masiva
        $auth->requierePermiso('pagos', 'autorizar');
        try {
            $registrosProcesados = 0;
            $registrosFallidos = [];
            foreach ($presion as $registro) {
                $status = ($registro['adeudo'] == 0) ? "RECHAZADA" : "AUTORIZADA";
                $consulta = "UPDATE hojasrequisicion SET hojarequisicion_adeudo = :adeudo, hojaRequisicion_observaciones = :observaciones, hojaRequisicion_estatus = :estatus WHERE hojaRequisicion_id = :id_hoja";
                $resultado = $conexion->prepare($consulta);
                $resultado->bindValue(':adeudo', (float)($registro['adeudo'] ?? 0), PDO::PARAM_STR);
                $resultado->bindValue(':observaciones', $registro['Observaciones'] ?? '', PDO::PARAM_STR);
                $resultado->bindValue(':id_hoja', $registro['id_hoja'], PDO::PARAM_INT);
                $resultado->bindValue(':estatus', $status, PDO::PARAM_STR);
                if ($resultado->execute()) { $registrosProcesados++; } else { $registrosFallidos[] = $registro['id_hoja']; }
            }
            $auth->registrarBitacora('AUTORIZAR_MASIVO', 'Hojas', null, ['procesados' => $registrosProcesados]);
            $data = count($registrosFallidos) > 0
                ? ['status' => 'error', 'mensaje' => 'Algunos registros no pudieron guardarse', 'fallos' => $registrosFallidos, 'procesados' => $registrosProcesados]
                : ['status' => 'success', 'mensaje' => 'Todos los registros fueron guardados correctamente', 'procesados' => $registrosProcesados];
        } catch (Exception $e) {
            $data = ['status' => 'error', 'mensaje' => 'Error inesperado', 'error' => $e->getMessage()];
        }
        break;
}

print json_encode($data, JSON_UNESCAPED_UNICODE);
Conexion::Desconectar();

function convertToString($Arr) { $r = ""; $i = 0; foreach ($Arr as $c) { $r .= $c['itemRequisicion_producto']; if ($i < count($Arr) - 1) $r .= " /// "; $i++; } return $r; }
function formatearMoneda($c) { if (!is_numeric($c)) return "Entrada no válida"; return "$" . number_format($c, 2, '.', ''); }
function obtenerNumeracionFinal($s) { $p = explode('-', $s); if (count($p) > 0) { $n = end($p); if (is_numeric($n)) return $n; } return null; }
function obtenerAbreviatura($m) { $map = ["Efectivo"=>"Efec","Transferencia"=>"Trans"]; return $map[$m] ?? ""; }
function sumaTotal($c, $id, $t) { $w = ['Propuesto'=>'hojaRequisicion_total','Auturizado'=>'hojarequisicion_adeudo','Rechazado'=>'hojaRequisicion_total - hojarequisicion_adeudo']; $f = $w[$t] ?? 'hojaRequisicion_total'; $extra = $t === 'Rechazado' ? " AND hojasrequisicion.hojaRequisicion_estatus != 'LIGADA'" : ''; $q = "SELECT SUM($f) AS total_sumatoria FROM requisicionesligadas INNER JOIN hojasrequisicion ON requisicionesLigadas_hojaID = hojaRequisicion_id WHERE requisicionesLigada_presionID = :id$extra"; $s = $c->prepare($q); $s->bindParam(':id', $id, PDO::PARAM_INT); $s->execute(); $r = $s->fetch(PDO::FETCH_ASSOC); return $r['total_sumatoria'] ?? 0; }
function sumaTotalEfectivo($c, $id, $t) { $w = ['Propuesto'=>'hojaRequisicion_total','Auturizado'=>'hojarequisicion_adeudo','Rechazado'=>'hojaRequisicion_total - hojarequisicion_adeudo']; $f = $w[$t] ?? 'hojaRequisicion_total'; $extra = $t === 'Rechazado' ? " AND hojasrequisicion.hojaRequisicion_estatus != 'LIGADA'" : ''; $q = "SELECT SUM($f) AS total_sumatoria FROM requisicionesligadas INNER JOIN hojasrequisicion ON requisicionesLigadas_hojaID = hojaRequisicion_id WHERE requisicionesLigada_presionID = :id AND hojaRequisicion_formaPago = 'Efectivo'$extra"; $s = $c->prepare($q); $s->bindParam(':id', $id, PDO::PARAM_INT); $s->execute(); $r = $s->fetch(PDO::FETCH_ASSOC); return $r['total_sumatoria'] ?? 0; }
function sumaTotalTrans($c, $id, $t) { $w = ['Propuesto'=>'hojaRequisicion_total','Auturizado'=>'hojarequisicion_adeudo','Rechazado'=>'hojaRequisicion_total - hojarequisicion_adeudo']; $f = $w[$t] ?? 'hojaRequisicion_total'; $extra = $t === 'Rechazado' ? " AND hojasrequisicion.hojaRequisicion_estatus != 'LIGADA'" : ''; $q = "SELECT SUM($f) AS total_sumatoria FROM requisicionesligadas INNER JOIN hojasrequisicion ON requisicionesLigadas_hojaID = hojaRequisicion_id WHERE requisicionesLigada_presionID = :id AND hojaRequisicion_formaPago = 'Transferencia'$extra"; $s = $c->prepare($q); $s->bindParam(':id', $id, PDO::PARAM_INT); $s->execute(); $r = $s->fetch(PDO::FETCH_ASSOC); return $r['total_sumatoria'] ?? 0; }
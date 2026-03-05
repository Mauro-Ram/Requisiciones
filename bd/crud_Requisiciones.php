<?php
include_once 'conexion.php';
include_once 'auth.php';
$conexion = Conexion::Conectar();

$auth = new Auth($conexion);
$usuario = $auth->verificarSesion();

$_POST = json_decode(file_get_contents("php://input"), true);
if (!is_array($_POST)) $_POST = [];

$accion    = isset($_POST['accion'])    ? $_POST['accion']    : '';
$obra      = isset($_POST['obra'])      ? $_POST['obra']      : '';
$nombreReq = isset($_POST['nombreReq']) ? $_POST['nombreReq'] : '';
$fechaReq  = isset($_POST['fechaReq'])  ? $_POST['fechaReq']  : '';
$clave     = isset($_POST['clave'])     ? $_POST['clave']     : '';
$folioReq  = isset($_POST['folio'])     ? $_POST['folio']     : '';
$Hoja      = isset($_POST['hoja'])      ? $_POST['hoja']      : '';
$idReq     = isset($_POST['idReq'])     ? $_POST['idReq']     : '';
$numReq    = isset($_POST['numeroReq']) ? $_POST['numeroReq'] : '';

$data = [];

switch ($accion) {
    case 1:
        // Listar requisiciones de una obra
        $auth->requierePermiso('requisiciones', 'ver');
        $consulta = "SELECT `requisicion_id`, `requisicion_Numero`, `requisicion_Clave`, 
                     `requisicion_Nombre`, `requisicion_estatus` 
                     FROM `requisiciones` 
                     WHERE `requisicion_Obra` = :obra 
                     ORDER BY `requisicion_Clave`, `requisicion_Numero` DESC";
        $resultado = $conexion->prepare($consulta);
        $resultado->bindParam(':obra', $obra, PDO::PARAM_INT);
        $resultado->execute();
        $dataArray = $resultado->fetchAll();
        if (count($dataArray) > 0) {
            foreach ($dataArray as $row) {
                array_push($data, array(
                    'requisicion_id' => $row['requisicion_id'],
                    'requisicion_Numero' => $row['requisicion_Numero'],
                    'requisicion_Clave' => $row['requisicion_Clave'],
                    'requisicion_Nombre' => $row['requisicion_Nombre'],
                    'requisicion_estatus' => $row['requisicion_estatus'],
                    'requisicion_EditShow' => false
                ));
            }
        }
        break;

    case 2:
        $data = [$auth->getDatosParaFrontend()];
        break;

    case 3:
        // Info de obra
        $consulta = "SELECT `obras_nombre`, `obra_automatico` FROM `obras` WHERE `obras_id` = :obra";
        $resultado = $conexion->prepare($consulta);
        $resultado->bindParam(':obra', $obra, PDO::PARAM_INT);
        $resultado->execute();
        $data = $resultado->fetchAll();
        break;

    case 4:
        $consulta = "SELECT SUM(`requisicion_total`) AS `totalPresion` FROM `requisiciones` WHERE `requisicion_Obra` = :obra";
        $resultado = $conexion->prepare($consulta);
        $resultado->bindParam(':obra', $obra, PDO::PARAM_INT);
        $resultado->execute();
        $data = $resultado->fetchAll();
        break;

    case 5:
        $data = $auth->obtenerObrasPermitidas();
        break;

    case 6:
        // Crear requisición (sin folio previo)
        $auth->requierePermiso('requisiciones', 'crear');
        $consulta = "SELECT `obras_nombre`,`ciudadesObras_codigo` FROM `obras` 
                     JOIN estadosobra ON estadosobra.ciudadesObras_id = obras.obras_cuidad 
                     WHERE `obras_id` = :obra";
        $resultado = $conexion->prepare($consulta);
        $resultado->bindParam(':obra', $obra, PDO::PARAM_INT);
        $resultado->execute();
        $data = $resultado->fetchAll();
        $numero_requesicion = $data[0]['ciudadesObras_codigo'] . "-" . $data[0]['obras_nombre'];

        $consulta = "SELECT * FROM `requisiciones` WHERE `requisicion_Clave` = :clave AND `requisicion_Obra` = :obra";
        $resultado = $conexion->prepare($consulta);
        $resultado->bindParam(':clave', $clave, PDO::PARAM_STR);
        $resultado->bindParam(':obra', $obra, PDO::PARAM_INT);
        $resultado->execute();
        $data = $resultado->fetchAll();

        $userId = $auth->getUserId();

        if (count($data) == 0) {
            $numero_requesicion = $numero_requesicion . "-" . $clave . "-000";
            $consulta = "INSERT INTO `requisiciones` (`requisicion_id`, `requisicion_Clave`, `requisicion_Numero`, 
                         `requisicion_Nombre`, `requisicion_Obra`, `requisicion_fechaSolicitud`, 
                         `requisicion_Folio`, `requisicion_Hojas`, `requisicion_total`, `requisicion_estatus`,
                         `requisicion_creadoPor`, `requisicion_created_at`) 
                         VALUES (NULL, :clave, :numero, :nombre, :obra, :fecha, '0', '0', '0', 'ABIERTO', :creadoPor, NOW())";
            $resultado = $conexion->prepare($consulta);
            $resultado->bindParam(':clave', $clave);
            $resultado->bindParam(':nombre', $nombreReq);
            $resultado->bindParam(':fecha', $fechaReq);
            $resultado->bindParam(':obra', $obra);
            $resultado->bindParam(':numero', $numero_requesicion);
            $resultado->bindParam(':creadoPor', $userId, PDO::PARAM_INT);
            $resultado->execute();
        } else {
            $consulta = "SELECT `requisicion_Folio` FROM `requisiciones` WHERE `requisicion_Clave` = :clave AND `requisicion_Obra` = :obra";
            $resultado = $conexion->prepare($consulta);
            $resultado->bindParam(':clave', $clave, PDO::PARAM_STR);
            $resultado->bindParam(':obra', $obra, PDO::PARAM_INT);
            $resultado->execute();
            $data = $resultado->fetchAll();
            $folio = $data[count($data) - 1]['requisicion_Folio'] + 1;
            $numero_requesicion = $numero_requesicion . "-" . $clave . "-" . convertFolio($folio);

            $consulta = "INSERT INTO `requisiciones` (`requisicion_id`, `requisicion_Clave`, `requisicion_Numero`, 
                         `requisicion_Nombre`, `requisicion_Obra`, `requisicion_fechaSolicitud`, 
                         `requisicion_Folio`, `requisicion_Hojas`, `requisicion_total`, `requisicion_estatus`,
                         `requisicion_creadoPor`, `requisicion_created_at`) 
                         VALUES (NULL, :clave, :numero, :nombre, :obra, :fecha, :folio, '0', '0', 'ABIERTO', :creadoPor, NOW())";
            $resultado = $conexion->prepare($consulta);
            $resultado->bindParam(':clave', $clave);
            $resultado->bindParam(':nombre', $nombreReq);
            $resultado->bindParam(':fecha', $fechaReq);
            $resultado->bindParam(':obra', $obra);
            $resultado->bindParam(':numero', $numero_requesicion);
            $resultado->bindParam(':folio', $folio);
            $resultado->bindParam(':creadoPor', $userId, PDO::PARAM_INT);
            $resultado->execute();
        }
        $nuevoId = $conexion->lastInsertId();
        $auth->registrarBitacora('CREAR', 'Requisiciones', $nuevoId, [
            'nombre' => $nombreReq, 'clave' => $clave, 'obra' => $obra
        ]);
        break;

    case 7:
        // Crear requisición (con folio manual)
        $auth->requierePermiso('requisiciones', 'crear');
        $consulta = "SELECT `obras_nombre`,`ciudadesObras_codigo` FROM `obras` 
                     JOIN estadosobra ON estadosobra.ciudadesObras_id = obras.obras_cuidad 
                     WHERE `obras_id` = :obra";
        $resultado = $conexion->prepare($consulta);
        $resultado->bindParam(':obra', $obra, PDO::PARAM_INT);
        $resultado->execute();
        $data = $resultado->fetchAll();
        $numero_requesicion = $data[0]['ciudadesObras_codigo'] . "-" . $data[0]['obras_nombre'];
        $numero_requesicion = $numero_requesicion . "-" . $clave . "-" . convertFolio($folioReq);

        $userId = $auth->getUserId();
        $consulta = "INSERT INTO `requisiciones` (`requisicion_id`, `requisicion_Clave`, `requisicion_Numero`, 
                     `requisicion_Nombre`, `requisicion_Obra`, `requisicion_fechaSolicitud`, 
                     `requisicion_Folio`, `requisicion_Hojas`, `requisicion_total`, `requisicion_estatus`,
                     `requisicion_creadoPor`, `requisicion_created_at`) 
                     VALUES (NULL, :clave, :numero, :nombre, :obra, :fecha, :folio, :hojas, '0', 'ABIERTO', :creadoPor, NOW())";
        $resultado = $conexion->prepare($consulta);
        $resultado->bindParam(':clave', $clave);
        $resultado->bindParam(':nombre', $nombreReq);
        $resultado->bindParam(':fecha', $fechaReq);
        $resultado->bindParam(':obra', $obra);
        $resultado->bindParam(':numero', $numero_requesicion);
        $resultado->bindParam(':folio', $folioReq);
        $resultado->bindParam(':hojas', $Hoja);
        $resultado->bindParam(':creadoPor', $userId, PDO::PARAM_INT);
        $resultado->execute();
        $nuevoId = $conexion->lastInsertId();
        $auth->registrarBitacora('CREAR', 'Requisiciones', $nuevoId, [
            'nombre' => $nombreReq, 'clave' => $clave, 'folio' => $folioReq
        ]);
        break;

    case 8:
        // Editar requisición — Capturista solo las suyas
        if (!$auth->puedeEditarRequisicion((int)$idReq)) {
            http_response_code(403);
            $data = ['error' => true, 'mensaje' => 'No tiene permisos para editar esta requisición.'];
            break;
        }
        try {
            $conexion->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
            $sqlGet = "SELECT `requisicion_Numero` FROM `requisiciones` WHERE `requisicion_id` = :idReq";
            $stmtGet = $conexion->prepare($sqlGet);
            $stmtGet->bindValue(':idReq', (int)$idReq, PDO::PARAM_INT);
            $stmtGet->execute();
            $numeroActual = $stmtGet->fetchColumn();

            if ($numeroActual === false) {
                $data = ['success' => false, 'message' => 'Requisición no encontrada', 'idReq' => (int)$idReq];
            } else {
                $nuevoNumero = reemplazarUltimosDigitos($numeroActual, $numReq);
                $sqlUpd = "UPDATE `requisiciones` SET `requisicion_Numero` = :newNumero, `requisicion_Nombre` = :newNombre WHERE `requisicion_id` = :idReq";
                $stmtUpd = $conexion->prepare($sqlUpd);
                $stmtUpd->bindValue(':newNumero', $nuevoNumero, PDO::PARAM_STR);
                $stmtUpd->bindValue(':newNombre', $nombreReq, PDO::PARAM_STR);
                $stmtUpd->bindValue(':idReq', (int)$idReq, PDO::PARAM_INT);
                $stmtUpd->execute();

                $stmtGet->execute();
                $numeroFinal = $stmtGet->fetchColumn();

                $auth->registrarBitacora('EDITAR', 'Requisiciones', $idReq, [
                    'numero_anterior' => $numeroActual, 'numero_nuevo' => $numeroFinal
                ]);

                $data = [
                    'success' => true, 'idReq' => (int)$idReq,
                    'numero_anterior' => $numeroActual, 'numero_nuevo' => $numeroFinal,
                    'nombre_nuevo' => $nombreReq, 'rows_affected' => $stmtUpd->rowCount()
                ];
            }
        } catch (PDOException $e) {
            $data = ['success' => false, 'message' => 'Error de BD: ' . $e->getMessage(), 'idReq' => (int)$idReq];
        }
        break;

    case 9:
        // Eliminar requisición — SOLO Validador y Developer
        $auth->requierePermiso('requisiciones', 'eliminar');
        $auth->registrarBitacora('ELIMINAR', 'Requisiciones', $idReq);

        $consulta = "SELECT `hojaRequisicion_id` FROM `hojasrequisicion` WHERE `hojaRequisicion_idReq` = :idReq";
        $resultado = $conexion->prepare($consulta);
        $resultado->bindParam(':idReq', $idReq, PDO::PARAM_INT);
        $resultado->execute();
        $idsHojas = $resultado->fetchAll();
        foreach ($idsHojas as $idHoja) {
            $consulta = "DELETE FROM `itemrequisicion` WHERE `itemrequisicion_idHoja` = :idHoja";
            $resultado = $conexion->prepare($consulta);
            $resultado->bindParam(':idHoja', $idHoja['hojaRequisicion_id'], PDO::PARAM_INT);
            $resultado->execute();
        }
        $consulta = "DELETE FROM `hojasrequisicion` WHERE `hojaRequisicion_idReq` = :idReq";
        $resultado = $conexion->prepare($consulta);
        $resultado->bindParam(':idReq', $idReq, PDO::PARAM_INT);
        $resultado->execute();
        $consulta = "DELETE FROM `requisiciones` WHERE `requisicion_id` = :idReq";
        $resultado = $conexion->prepare($consulta);
        $resultado->bindParam(':idReq', $idReq, PDO::PARAM_INT);
        $resultado->execute();
        $data = 0;
        break;
}

print json_encode($data, JSON_UNESCAPED_UNICODE);
Conexion::Desconectar();

function convertFolio($folioInt)
{
    if ($folioInt < 10) return "00" . $folioInt;
    else if ($folioInt < 100) return "0" . $folioInt;
    else return $folioInt;
}

function reemplazarUltimosDigitos($cadenaOriginal, $nuevoNumero)
{
    $nuevoNumero = (string)$nuevoNumero;
    return preg_replace('/\d+$/', $nuevoNumero, $cadenaOriginal);
}
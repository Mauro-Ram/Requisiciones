<?php
include_once 'conexion.php';
include_once 'auth.php';
$conexion = Conexion::Conectar();

$auth = new Auth($conexion);
$usuario = $auth->verificarSesion();

$_POST = json_decode(file_get_contents("php://input"), true);
if (!is_array($_POST)) $_POST = [];

$accion     = isset($_POST['accion'])     ? $_POST['accion']     : '';
$id_prov    = isset($_POST['id_prov'])    ? $_POST['id_prov']    : '';
$formValues = isset($_POST['formValues']) ? $_POST['formValues'] : null;

$data = [];

switch ($accion) {
    case 1:
        $data = [$auth->getDatosParaFrontend()];
        break;

    case 2:
        $data = $auth->obtenerObrasPermitidas();
        break;

    case 3:
        // Ver proveedores — Capturista, Validador, Developer
        $auth->requierePermiso('proveedores', 'ver');
        $consulta = "SELECT * FROM `provedores` WHERE `proveedor_estatus` = 'ACTIVO'";
        $resultado = $conexion->prepare($consulta);
        $resultado->execute();
        $data = $resultado->fetchAll();
        break;

    case 4:
        // Desactivar proveedor — SOLO Validador y Developer
        $auth->requierePermiso('proveedores', 'editar');
        $consulta = "UPDATE `provedores` SET `proveedor_estatus` = 'INACTIVO' WHERE `proveedor_id` = :id";
        $resultado = $conexion->prepare($consulta);
        $resultado->bindParam(':id', $id_prov, PDO::PARAM_INT);
        $resultado->execute();
        $auth->registrarBitacora('ELIMINAR', 'Proveedores', $id_prov);
        $data = 1;
        break;

    case 5:
        // Ver proveedor específico
        $auth->requierePermiso('proveedores', 'ver');
        $consulta = "SELECT * FROM `provedores` WHERE `proveedor_id` = :id LIMIT 1";
        $resultado = $conexion->prepare($consulta);
        $resultado->bindParam(':id', $id_prov, PDO::PARAM_INT);
        $resultado->execute();
        $data = $resultado->fetchAll();
        break;

    case 6:
        $auth->requierePermiso('proveedores', 'editar');
        $consulta = "UPDATE `provedores` 
        SET 
            `proveedor_nombre` = :nombre,
            `presiones_type` = :tipo,
            `proveedor_rfc` = :rfc,
            `proveedor_clabe` = :clabe,
            `proveedor_numeroCuenta` = :cuenta,
            `proveedor_sucursal` = :sucursal,
            `proveedor_refBanco` = :referencia,
            `presiones_tarjetaBanco` = :tarjeta,
            `proveedor_banco` = :banco,
            `proveedor_email` = :email,
            `proveedor_telefono` = :telefono
        WHERE `proveedor_id` = :id";
    
        $resultado = $conexion->prepare($consulta);
        $resultado->bindParam(':nombre', $formValues['nombreProv']);
        $resultado->bindParam(':tipo', $formValues['typeProv']);
        $resultado->bindParam(':rfc', $formValues['RFCProv']);
        $resultado->bindParam(':clabe', $formValues['claveProv']);
        $resultado->bindParam(':cuenta', $formValues['cuentaBancaria']);
        $resultado->bindParam(':sucursal', $formValues['sucursalProv']);
        $resultado->bindParam(':referencia', $formValues['referenciaProv']);
        $resultado->bindParam(':tarjeta', $formValues['tarjetaProv']);
        $resultado->bindParam(':banco', $formValues['bancoProv']);
        $resultado->bindParam(':email', $formValues['correoProv']);
        $resultado->bindParam(':telefono', $formValues['telefonoProv']);
        $resultado->bindParam(':id', $id_prov, PDO::PARAM_INT);
        $resultado->execute();
        $auth->registrarBitacora('EDITAR', 'Proveedores', $id_prov, $formValues);
        $data = 1;
        break;
}

print json_encode($data, JSON_UNESCAPED_UNICODE);
Conexion::Desconectar();
<?php
include_once 'conexion.php';
include_once 'auth.php';
$conexion = Conexion::Conectar();

$auth = new Auth($conexion);
$usuario = $auth->verificarSesion();

$_POST = json_decode(file_get_contents("php://input"), true);
if (!is_array($_POST)) $_POST = [];

$accion     = isset($_POST['accion'])     ? $_POST['accion']     : '';
$id_banco   = isset($_POST['id_banco'])   ? $_POST['id_banco']   : '';
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
        // Listar bancos — solo Validador y Developer
        $auth->requierePermiso('bancos', 'ver');
        $consulta = "SELECT * FROM `bancos` WHERE `banco_activo` = 1";
        $resultado = $conexion->prepare($consulta);
        $resultado->execute();
        $data = $resultado->fetchAll();
        break;

    case 4:
        // Desactivar banco
        $auth->requierePermiso('bancos', 'eliminar');
        $consulta = "UPDATE `bancos` SET `banco_activo` = 0 WHERE `banco_id` = :id";
        $resultado = $conexion->prepare($consulta);
        $resultado->bindParam(':id', $id_banco, PDO::PARAM_INT);
        $resultado->execute();
        $auth->registrarBitacora('ELIMINAR', 'Bancos', $id_banco);
        $data = 1;
        break;

    case 5:
        // Ver banco específico
        $auth->requierePermiso('bancos', 'ver');
        $consulta = "SELECT * FROM `bancos` WHERE `banco_id` = :id LIMIT 1";
        $resultado = $conexion->prepare($consulta);
        $resultado->bindParam(':id', $id_banco, PDO::PARAM_INT);
        $resultado->execute();
        $data = $resultado->fetchAll();
        break;

    case 6:
        // Editar banco
        $auth->requierePermiso('bancos', 'editar');
        $consulta = "UPDATE `bancos` 
                     SET `banco_razonSocial` = :RazonSocial, 
                         `banco_nombreComercial` = :NombreComercial
                     WHERE `banco_id` = :id";
        $resultado = $conexion->prepare($consulta);
        $resultado->bindParam(':RazonSocial', $formValues['razonSocialBanco']);
        $resultado->bindParam(':NombreComercial', $formValues['comercialBanco']);
        $resultado->bindParam(':id', $id_banco, PDO::PARAM_INT);
        $resultado->execute();
        $auth->registrarBitacora('EDITAR', 'Bancos', $id_banco, $formValues);
        $data = 1;
        break;

    case 7:
        // Crear banco
        $auth->requierePermiso('bancos', 'crear');
        $consulta = "INSERT INTO `bancos` 
                     (`banco_id`, `banco_razonSocial`, `banco_nombreComercial`, `banco_activo`)
                     VALUES (NULL, :RazonSocial, :NombreComercial, 1)";
        $resultado = $conexion->prepare($consulta);
        $resultado->bindParam(':RazonSocial', $formValues['razonSocialBanco']);
        $resultado->bindParam(':NombreComercial', $formValues['comercialBanco']);
        $resultado->execute();
        $nuevoId = $conexion->lastInsertId();
        $auth->registrarBitacora('CREAR', 'Bancos', $nuevoId, $formValues);
        $data = 1;
        break;
}

print json_encode($data, JSON_UNESCAPED_UNICODE);
Conexion::Desconectar();
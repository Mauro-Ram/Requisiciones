<?php
include_once 'conexion.php';
include_once 'auth.php';
$conexion = Conexion::Conectar();

$auth = new Auth($conexion);
$usuario = $auth->verificarSesion();

$_POST = json_decode(file_get_contents("php://input"), true);
if (!is_array($_POST)) $_POST = [];

$accion = isset($_POST['accion']) ? $_POST['accion'] : '';
$obra    = isset($_POST['obra'])  ? $_POST['obra']   : '';

$data = [];

switch ($accion) {
    case 1:
        // Datos del usuario con permisos calculados
        $data = [$auth->getDatosParaFrontend()];
        break;

    case 2:
        // Obras filtradas por rol
        $data = $auth->obtenerObrasPermitidas();
        break;

    case 3:
        // Info de obra específica (parametrizado)
        $consulta = "SELECT `obras_nombre` FROM `obras` WHERE `obras_id` = :obra";
        $resultado = $conexion->prepare($consulta);
        $resultado->bindParam(':obra', $obra, PDO::PARAM_INT);
        $resultado->execute();
        $data = $resultado->fetchAll();
        break;
}

print json_encode($data, JSON_UNESCAPED_UNICODE);
Conexion::Desconectar();
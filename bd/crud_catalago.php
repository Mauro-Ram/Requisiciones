<?php
include_once 'conexion.php';
include_once 'auth.php';
$conexion = Conexion::Conectar();

$auth = new Auth($conexion);
$usuario = $auth->verificarSesion();

$_POST = json_decode(file_get_contents("php://input"), true);
if (!is_array($_POST)) $_POST = [];

$accion = isset($_POST['accion']) ? $_POST['accion'] : '';

$data = [];

switch ($accion) {
    case 1:
        $data = [$auth->getDatosParaFrontend()];
        break;

    case 2:
        $data = $auth->obtenerObrasPermitidas();
        break;
}

print json_encode($data, JSON_UNESCAPED_UNICODE);
Conexion::Desconectar();
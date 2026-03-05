<?php
include_once 'conexion.php';
include_once 'auth.php';
$conexion = Conexion::Conectar();

$auth = new Auth($conexion);
$usuario = $auth->verificarSesion();

$_POST = json_decode(file_get_contents("php://input"), true);
if (!is_array($_POST)) $_POST = [];

$accion    = isset($_POST['accion'])    ? $_POST['accion']    : '';
$nombre    = isset($_POST['nombre'])    ? $_POST['nombre']    : '';
$direccion = isset($_POST['direccion']) ? $_POST['direccion'] : '';
$rfc       = isset($_POST['rfc'])       ? $_POST['rfc']       : '';
$clabe     = isset($_POST['clabe'])     ? $_POST['clabe']     : '';
$cuenta    = isset($_POST['cuenta'])    ? $_POST['cuenta']    : '';
$tarjeta   = isset($_POST['tarjeta'])   ? $_POST['tarjeta']   : '';
$referencia= isset($_POST['referencia'])? $_POST['referencia'] : '';
$banco     = isset($_POST['banco'])     ? $_POST['banco']     : '';
$tipoProv  = isset($_POST['tipoProv'])  ? $_POST['tipoProv']  : '';
$sucursal  = isset($_POST['sucursal'])  ? $_POST['sucursal']  : '';
$telefono  = isset($_POST['telefono'])  ? $_POST['telefono']  : '';
$correo    = isset($_POST['correo'])    ? $_POST['correo']    : '';

$data = [];

switch ($accion) {
    case 1:
        // Listar bancos para el select
        $consulta = "SELECT * FROM `bancos` WHERE `banco_activo` = 1";
        $resultado = $conexion->prepare($consulta);
        $resultado->execute();
        $data = $resultado->fetchAll();
        break;

    case 2:
        $data = [$auth->getDatosParaFrontend()];
        break;

    case 3:
        $data = $auth->obtenerObrasPermitidas();
        break;

    case 4:
        // Agregar proveedor — Capturista + Validador + Developer
        $auth->requierePermiso('proveedores', 'crear');
        $consulta = "INSERT INTO `provedores` 
                     (`proveedor_id`, `proveedor_nombre`, `presiones_type`, `proveedor_rfc`, 
                      `proveedor_clabe`, `proveedor_numeroCuenta`, `proveedor_sucursal`, 
                      `proveedor_refBanco`, `presiones_tarjetaBanco`, `proveedor_banco`, 
                      `proveedor_email`, `proveedor_telefono`, `proveedor_estatus`) 
                     VALUES (NULL, :nombre, :tipo, :rfc, :clabe, :cuenta, :sucursal, 
                             :ref, :tarjeta, :banco, :correo, :tel, 'ACTIVO')";
        $resultado = $conexion->prepare($consulta);
        $resultado->bindParam(':nombre',   $nombre);
        $resultado->bindParam(':tipo',     $tipoProv);
        $resultado->bindParam(':rfc',      $rfc);
        $resultado->bindParam(':clabe',    $clabe);
        $resultado->bindParam(':cuenta',   $cuenta);
        $resultado->bindParam(':sucursal', $sucursal);
        $resultado->bindParam(':ref',      $referencia);
        $resultado->bindParam(':tarjeta',  $tarjeta);
        $resultado->bindParam(':banco',    $banco);
        $resultado->bindParam(':correo',   $correo);
        $resultado->bindParam(':tel',      $telefono);
        $resultado->execute();

        $nuevoId = $conexion->lastInsertId();
        $auth->registrarBitacora('CREAR', 'Proveedores', $nuevoId, [
            'nombre' => $nombre, 'rfc' => $rfc, 'banco' => $banco
        ]);
        $data = 1;
        break;
}

print json_encode($data, JSON_UNESCAPED_UNICODE);
Conexion::Desconectar();
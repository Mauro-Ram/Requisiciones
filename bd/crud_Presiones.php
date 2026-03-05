<?php
include_once 'conexion.php';
include_once 'auth.php';
$conexion = Conexion::Conectar();

$auth = new Auth($conexion);
$usuario = $auth->verificarSesion();

$_POST = json_decode(file_get_contents("php://input"), true);
if (!is_array($_POST)) $_POST = [];

$accion      = isset($_POST['accion'])      ? $_POST['accion']      : '';
$semana      = isset($_POST['semana'])       ? $_POST['semana']      : '';
$dia         = isset($_POST['dia'])          ? $_POST['dia']         : '';
$clave       = isset($_POST['clave'])        ? $_POST['clave']       : '';
$fecha       = isset($_POST['fecha'])        ? $_POST['fecha']       : '';
$obra        = isset($_POST['obra'])         ? $_POST['obra']        : '';
$alias       = isset($_POST['alias'])        ? $_POST['alias']       : '';
$time        = isset($_POST['time'])         ? $_POST['time']        : '';

$data = [];

switch ($accion) {
    case 1:
        // Listar presiones de una obra (parametrizado)
        $auth->requierePermiso('presiones', 'ver');
        $consulta = "SELECT `presiones_id`, `presiones_nombre`, `presiones_alias`, 
                     `presiones_estatus`, `presiones_semana`, `presiones_dia`
                     FROM `presiones` 
                     WHERE `presiones_obra` = :obra 
                     ORDER BY `presiones_fechaCreacion` DESC";
        $resultado = $conexion->prepare($consulta);
        $resultado->bindParam(':obra', $obra, PDO::PARAM_INT);
        $resultado->execute();
        $data = $resultado->fetchAll();
        break;

    case 2:
        // Datos del usuario con permisos
        $data = [$auth->getDatosParaFrontend()];
        break;

    case 3:
        // Crear nueva presión
        $auth->requierePermiso('presiones', 'crear');

        // Obtener nombre de la obra
        $consulta = "SELECT `obras_nombre`, `ciudadesObras_codigo` 
                     FROM `obras` 
                     JOIN `estadosobra` ON `estadosobra`.`ciudadesObras_id` = `obras`.`obras_cuidad` 
                     WHERE `obras_id` = :obra";
        $resultado = $conexion->prepare($consulta);
        $resultado->bindParam(':obra', $obra, PDO::PARAM_INT);
        $resultado->execute();
        $data = $resultado->fetchAll();

        $nombre_presion = $data[0]['obras_nombre'] . "-" . $semana . "-" . $dia;
        $user_creado = $auth->getUserName();

        $consulta = "INSERT INTO `presiones` 
                     (`presiones_id`, `presiones_nombre`, `presiones_alias`, `presiones_semana`, 
                      `presiones_dia`, `presiones_adeudo`, `presiones_fechaCreacion`, 
                      `presiones_gastosObra`, `presiones_obra`, `presiones_userCreado`, 
                      `presiones_userValidado`, `presiones_estatus`) 
                     VALUES (NULL, :nombre, :alias, :semana, :dia, '0', :fecha, '0', 
                             :obra, :userCreado, '', 'PENDIENTE')";
        $resultado = $conexion->prepare($consulta);
        $resultado->bindParam(':nombre', $nombre_presion, PDO::PARAM_STR);
        $resultado->bindParam(':alias', $alias, PDO::PARAM_STR);
        $resultado->bindParam(':semana', $semana, PDO::PARAM_STR);
        $resultado->bindParam(':dia', $dia, PDO::PARAM_STR);
        $resultado->bindParam(':fecha', $fecha, PDO::PARAM_STR);
        $resultado->bindParam(':obra', $obra, PDO::PARAM_INT);
        $resultado->bindParam(':userCreado', $user_creado, PDO::PARAM_STR);
        $resultado->execute();

        $nuevoId = $conexion->lastInsertId();
        $auth->registrarBitacora('CREAR', 'Presiones', $nuevoId, [
            'nombre' => $nombre_presion,
            'alias'  => $alias,
            'obra'   => $obra,
            'semana' => $semana,
            'dia'    => $dia
        ]);
        break;

    case 4:
        // Info de obra específica (parametrizado)
        $consulta = "SELECT `obras_nombre` FROM `obras` WHERE `obras_id` = :obra";
        $resultado = $conexion->prepare($consulta);
        $resultado->bindParam(':obra', $obra, PDO::PARAM_INT);
        $resultado->execute();
        $data = $resultado->fetchAll();
        break;

    case 5:
        // Listar obras (filtradas por rol)
        $data = $auth->obtenerObrasPermitidas();
        break;
}

print json_encode($data, JSON_UNESCAPED_UNICODE);
Conexion::Desconectar();
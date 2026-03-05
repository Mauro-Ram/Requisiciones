<?php
include_once 'conexion.php';
$objeto = new Conexion();
$conexion = $objeto->Conectar();

$_POST = json_decode(file_get_contents("php://input"), true);

$Usuario    = (isset($_POST['user']))     ? $_POST['user']     : '';
$Contrasena = (isset($_POST['password'])) ? $_POST['password'] : '';

$dato = array(
    'bandera'   => 'false',
    'user_id'   => 0,
    'user_name' => '',
    'user_rol'  => '',
    'permisos'  => new stdClass()
);

try {
    // ══════════════════════════════════════════════════════════
    // Consulta: traer usuario con su rol
    // user_rol (INT) → roles.rol_id
    // ══════════════════════════════════════════════════════════
    $consulta = "SELECT u.`user_id`, u.`user_password`, u.`user_name`,
                        u.`user_estatus`, u.`user_rol`,
                        r.`rol_nombre`
                 FROM `users` u
                 LEFT JOIN `roles` r ON r.`rol_id` = u.`user_rol`
                 WHERE u.`user_nameUser` = :usuario
                 LIMIT 1";

    $resultado = $conexion->prepare($consulta);
    $resultado->bindParam(':usuario', $Usuario, PDO::PARAM_STR);
    $resultado->execute();
    $userArr = $resultado->fetchAll(PDO::FETCH_ASSOC);

    // ══════════════════════════════════════════════════════════
    // Validar que el usuario exista
    // ══════════════════════════════════════════════════════════
    if (count($userArr) === 0) {
        // Usuario no encontrado — no revelar detalles
        print json_encode($dato, JSON_UNESCAPED_UNICODE);
        exit;
    }

    $user = $userArr[0];

    // ══════════════════════════════════════════════════════════
    // Validar contraseña — SOPORTA AMBOS FORMATOS
    //   1. Hash bcrypt ($2y$10$...) → password_verify()
    //   2. Texto plano (legacy)    → comparación directa
    // ══════════════════════════════════════════════════════════
    $passwordHash = $user["user_password"];
    $passwordValida = false;

    if (substr($passwordHash, 0, 4) === '$2y$' || substr($passwordHash, 0, 4) === '$2a$') {
        // Contraseña hasheada con bcrypt
        $passwordValida = password_verify($Contrasena, $passwordHash);
    } else {
        // Contraseña en texto plano (legacy)
        $passwordValida = ($passwordHash === $Contrasena);
    }

    if (!$passwordValida) {
        // Contraseña incorrecta — incrementar intentos fallidos
        try {
            $update = "UPDATE `users` SET `intentos_fallidos` = `intentos_fallidos` + 1 
                       WHERE `user_id` = :id";
            $stmt = $conexion->prepare($update);
            $stmt->bindParam(':id', $user["user_id"], PDO::PARAM_INT);
            $stmt->execute();
        } catch (Exception $e) {
            error_log('[LoginAcces] Error incrementando intentos: ' . $e->getMessage());
        }

        print json_encode($dato, JSON_UNESCAPED_UNICODE);
        exit;
    }

    // ══════════════════════════════════════════════════════════
    // Verificar que el usuario esté activo
    // ══════════════════════════════════════════════════════════
    $estatus = $user["user_estatus"] ?? 'Activo';
    if ($estatus !== 'Activo') {
        $dato['mensaje'] = 'Usuario inactivo o suspendido';
        print json_encode($dato, JSON_UNESCAPED_UNICODE);
        exit;
    }

    // ══════════════════════════════════════════════════════════
    // ✅ LOGIN EXITOSO
    // ══════════════════════════════════════════════════════════
    session_start();
    $_SESSION["Usuario"]  = $Usuario;
    $_SESSION["user_id"]  = $user["user_id"];

    // Determinar nombre del rol
    $rol = $user["rol_nombre"] ?? 'Capturista';
    $_SESSION["user_rol"] = $rol;

    // Generar permisos para el frontend
    $permisos = generarPermisosRol($rol);

    $dato['bandera']   = 'true';
    $dato['user_id']   = $user["user_id"];
    $dato['user_name'] = $user["user_name"];
    $dato['user_rol']  = $rol;
    $dato['permisos']  = $permisos;

    // Registrar último login y resetear intentos
    try {
        $update = "UPDATE `users` SET `ultimo_login` = NOW(), `intentos_fallidos` = 0 
                   WHERE `user_id` = :id";
        $stmt = $conexion->prepare($update);
        $stmt->bindParam(':id', $user["user_id"], PDO::PARAM_INT);
        $stmt->execute();
    } catch (Exception $e) {
        error_log('[LoginAcces] Error actualizando ultimo_login: ' . $e->getMessage());
    }

} catch (Exception $e) {
    error_log('[LoginAcces] Error general: ' . $e->getMessage());
}

print json_encode($dato, JSON_UNESCAPED_UNICODE);
$conexion = NULL;

/**
 * Genera el mapa de permisos según el rol
 */
function generarPermisosRol($rol)
{
    $mapa = [
        'Capturista' => [
            'proveedores_crear'            => true,
            'proveedores_editar'           => false,
            'proveedores_ver'              => true,
            'requisiciones_crear'          => true,
            'requisiciones_editar_propias' => true,
            'requisiciones_eliminar'       => false,
            'presiones_crear'              => false,
            'presiones_enlazar'            => false,
            'presiones_cerrar'             => false,
            'pagos_autorizar'              => false,
            'pagos_ver'                    => false,
            'obras_gestionar'              => false,
            'usuarios_gestionar'           => false,
            'bancos_gestionar'             => false
        ],
        'Validador' => [
            'proveedores_crear'            => true,
            'proveedores_editar'           => true,
            'proveedores_ver'              => true,
            'requisiciones_crear'          => true,
            'requisiciones_editar_propias' => true,
            'requisiciones_eliminar'       => true,
            'presiones_crear'              => true,
            'presiones_enlazar'            => true,
            'presiones_cerrar'             => true,
            'pagos_autorizar'              => true,
            'pagos_ver'                    => true,
            'obras_gestionar'              => false,
            'usuarios_gestionar'           => false,
            'bancos_gestionar'             => false
        ],
        'CEO' => [
            'proveedores_crear'            => false,
            'proveedores_editar'           => false,
            'proveedores_ver'              => true,
            'requisiciones_crear'          => false,
            'requisiciones_editar_propias' => false,
            'requisiciones_eliminar'       => false,
            'presiones_crear'              => false,
            'presiones_enlazar'            => false,
            'presiones_cerrar'             => false,
            'pagos_autorizar'              => true,
            'pagos_ver'                    => true,
            'obras_gestionar'              => false,
            'usuarios_gestionar'           => false,
            'bancos_gestionar'             => false
        ],
        'Developer' => [
            'proveedores_crear'            => true,
            'proveedores_editar'           => true,
            'proveedores_ver'              => true,
            'requisiciones_crear'          => true,
            'requisiciones_editar_propias' => true,
            'requisiciones_eliminar'       => true,
            'presiones_crear'              => true,
            'presiones_enlazar'            => true,
            'presiones_cerrar'             => true,
            'pagos_autorizar'              => true,
            'pagos_ver'                    => true,
            'obras_gestionar'              => true,
            'usuarios_gestionar'           => true,
            'bancos_gestionar'             => true
        ]
    ];

    return $mapa[$rol] ?? $mapa['Capturista'];
}
?>
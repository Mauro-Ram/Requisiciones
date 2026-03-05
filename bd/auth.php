<?php
/**
 * MIDDLEWARE DE AUTENTICACIÓN Y AUTORIZACIÓN
 */

class Auth
{
    private $conexion;
    private $usuario = null;

    // ============================================
    // MAPA DE PERMISOS CORREGIDO
    // ============================================
    private static $permisos = [
        'presiones' => [
            'crear'    => ['Capturista', 'Validador', 'Developer'],
            'ver'      => ['Capturista', 'Validador', 'CEO', 'Developer'],
            'cerrar'   => ['Validador', 'Developer'],
            'eliminar' => ['Validador', 'Developer']
        ],
        'requisiciones' => [
            'crear'    => ['Capturista', 'Validador', 'Developer'],
            'editar'   => ['Capturista', 'Validador', 'Developer'],
            'ver'      => ['Capturista', 'Validador', 'CEO', 'Developer'],
            'eliminar' => ['Validador', 'Developer']
        ],
        'proveedores' => [
            'crear'    => ['Capturista', 'Validador', 'Developer'],
            'editar'   => ['Validador', 'Developer'],
            'ver'      => ['Capturista', 'Validador', 'Developer']
        ],
        'bancos' => [
            'crear'    => ['Validador', 'Developer'],
            'editar'   => ['Validador', 'Developer'],
            'ver'      => ['Validador', 'Developer'],
            'eliminar' => ['Validador', 'Developer']
        ],
        'enlazar' => [
            'enlazar'  => ['Validador', 'Developer'],
            'ver'      => ['Validador', 'Developer']
        ],
        'pagos' => [
            'autorizar' => ['Validador', 'CEO', 'Developer'],
            'rechazar'  => ['Validador', 'CEO', 'Developer'],
            'ver'       => ['Validador', 'CEO', 'Developer']
        ],
        'obras' => [
            'crear'    => ['Validador', 'Developer'],
            'editar'   => ['Validador', 'Developer'],
            'ver'      => ['Capturista', 'Validador', 'CEO', 'Developer'],
            'asignar'  => ['Validador', 'Developer']
        ],
        'direccion' => [
            'ver'      => ['Validador', 'CEO', 'Developer']
        ],
        'reportes' => [
            'ver'      => ['Validador', 'CEO', 'Developer']
        ],
        'kpis' => [
            'ver'      => ['CEO', 'Developer']
        ],
        'bitacora' => [
            'ver'      => ['Validador', 'CEO', 'Developer']
        ],
        'usuarios' => [
            'admin'    => ['Developer']
        ]
    ];

    public function __construct($conexion)
    {
        $this->conexion = $conexion;
    }

    // ============================================
    // 1. VERIFICAR SESIÓN
    // ============================================
    public function verificarSesion()
    {
        if (session_status() === PHP_SESSION_NONE) {
            session_start();
        }

        if (!isset($_SESSION['user_id']) || empty($_SESSION['user_id'])) {
            http_response_code(401);
            die(json_encode([
                'error'   => true,
                'mensaje' => 'Sesión no válida. Inicie sesión nuevamente.'
            ]));
        }

        $stmt = $this->conexion->prepare(
            "SELECT u.*, r.`rol_nombre`, r.`rol_nivel`
             FROM `users` u
             LEFT JOIN `roles` r ON u.`user_rol` = r.`rol_id`
             WHERE u.`user_id` = :id 
             LIMIT 1"
        );
        $stmt->bindParam(':id', $_SESSION['user_id'], PDO::PARAM_INT);
        $stmt->execute();
        $this->usuario = $stmt->fetch();

        if (!$this->usuario) {
            http_response_code(401);
            die(json_encode([
                'error'   => true,
                'mensaje' => 'Usuario no encontrado.'
            ]));
        }

        if ($this->usuario['user_estatus'] !== 'Activo') {
            http_response_code(403);
            die(json_encode([
                'error'   => true,
                'mensaje' => 'Su cuenta está ' . $this->usuario['user_estatus'] . '.'
            ]));
        }

        return $this->usuario;
    }

    // ============================================
    // 2. VERIFICAR ROL
    // Valida que el usuario tenga un rol de la lista permitida
    // ============================================
    public function requiereRol(array $rolesPermitidos)
    {
        if (!$this->usuario) $this->verificarSesion();

        $rol = $this->usuario['rol_nombre'] ?? null;

        // Sin rol asignado → modo compatibilidad, no bloquear
        if (!$rol) return true;

        if (!in_array($rol, $rolesPermitidos)) {
            http_response_code(403);
            die(json_encode([
                'error'   => true,
                'mensaje' => 'No tiene permisos para realizar esta acción.'
            ]));
        }
        return true;
    }

    // ============================================
    // 3. VERIFICAR PERMISO (módulo + acción)
    // Usa el mapa de permisos para decidir acceso
    // ============================================
    public function puede(string $modulo, string $accion): bool
    {
        if (!$this->usuario) $this->verificarSesion();

        $rol = $this->usuario['rol_nombre'] ?? null;

        // Sin rol → usar banderas viejas como fallback
        if (!$rol) {
            return $this->puedePorBanderas($modulo, $accion);
        }

        if (!isset(self::$permisos[$modulo][$accion])) return false;
        return in_array($rol, self::$permisos[$modulo][$accion]);
    }

    /**
     * Muere si no tiene permiso
     */
    public function requierePermiso(string $modulo, string $accion)
    {
        if (!$this->puede($modulo, $accion)) {
            http_response_code(403);
            die(json_encode([
                'error'   => true,
                'mensaje' => 'No tiene permisos para ' . $accion . ' en ' . $modulo . '.'
            ]));
        }
    }

    // ============================================
    // 4. FALLBACK: BANDERAS VIEJAS
    // Para usuarios que aún no tienen rol asignado
    // ============================================
    private function puedePorBanderas(string $modulo, string $accion): bool
    {
        $u = $this->usuario;
        switch ($modulo) {
            case 'presiones':
                if ($accion === 'crear') return (bool)($u['user_createPresion'] ?? false);
                if ($accion === 'cerrar') return (bool)($u['user_closePresion'] ?? false);
                return true;
            case 'requisiciones':
                if ($accion === 'editar') return (bool)($u['user_editReq'] ?? false);
                return true;
            case 'enlazar':
                return (bool)($u['user_linkedPresion'] ?? false);
            case 'pagos':
                if ($accion === 'autorizar') return (bool)($u['user_payPresion'] ?? false);
                return true;
            case 'bancos':
                return (bool)($u['user_directionAcess'] ?? false);
            default:
                return true;
        }
    }

    // ============================================
    // 5. REGLA ESPECIAL: EDICIÓN DE REQUISICIONES
    // ============================================
    public function puedeEditarRequisicion(int $requisicionId): bool
    {
        if (!$this->usuario) $this->verificarSesion();

        $rol = $this->usuario['rol_nombre'] ?? null;

        // Validador, CEO y Developer pueden siempre
        if (in_array($rol, ['Validador', 'CEO', 'Developer'])) return true;

        if ($rol === 'Capturista') {
            $stmt = $this->conexion->prepare(
                "SELECT `requisicion_creadoPor`, `requisicion_created_at` 
                 FROM `requisiciones` 
                 WHERE `requisicion_id` = :id LIMIT 1"
            );
            $stmt->bindParam(':id', $requisicionId, PDO::PARAM_INT);
            $stmt->execute();
            $req = $stmt->fetch();

            if (!$req) return false;

            // ¿Es el creador?
            if ((int)$req['requisicion_creadoPor'] !== (int)$this->usuario['user_id']) {
                return false;
            }

            // ¿Es el mismo día?
            $fechaCreacion = date('Y-m-d', strtotime($req['requisicion_created_at']));
            if ($fechaCreacion !== date('Y-m-d')) return false;

            // ¿Antes de las 12:00 PM?
            if ((int)date('H') >= 12) return false;

            return true;
        }

        // Sin rol → bandera vieja
        return (bool)($this->usuario['user_editReq'] ?? false);
    }

    // ============================================
    // 6. SEGMENTACIÓN DE OBRAS POR ROL
    // ============================================
    public function obtenerObrasPermitidas(bool $incluirInactivas = false): array
    {
        if (!$this->usuario) $this->verificarSesion();

        $rol = $this->usuario['rol_nombre'] ?? null;

        // Validador, CEO y Developer ven todas
        if (in_array($rol, ['Validador', 'CEO', 'Developer'])) {
            $where = $incluirInactivas ? "1=1" : "`obras_estatus` = 'ACTIVO'";
            $stmt = $this->conexion->prepare("SELECT * FROM `obras` WHERE $where ORDER BY `obras_nombre`");
            $stmt->execute();
            return $stmt->fetchAll();
        }

        // Capturista → solo obras asignadas
        $stmt = $this->conexion->prepare(
            "SELECT o.* FROM `obras` o
             JOIN `user_obras` uo ON o.`obras_id` = uo.`uo_obra_id`
             WHERE uo.`uo_user_id` = :userId 
             AND o.`obras_estatus` = 'ACTIVO'
             ORDER BY o.`obras_nombre`"
        );
        $stmt->bindParam(':userId', $this->usuario['user_id'], PDO::PARAM_INT);
        $stmt->execute();
        $obras = $stmt->fetchAll();

        // Fallback: si no tiene obras asignadas, mostrar todas activas
        if (empty($obras)) {
            $stmt = $this->conexion->prepare(
                "SELECT * FROM `obras` WHERE `obras_estatus` = 'ACTIVO' ORDER BY `obras_nombre`"
            );
            $stmt->execute();
            return $stmt->fetchAll();
        }

        return $obras;
    }

    // ============================================
    // 7. BITÁCORA DE AUDITORÍA
    // Registra quién hizo qué, cuándo y desde dónde
    // ============================================
    public function registrarBitacora(string $accion, string $modulo, $registroId = null, $detalle = null)
    {
        if (!$this->usuario) return;

        $ip = $_SERVER['REMOTE_ADDR'] ?? 'desconocida';
        $detalleJson = null;
        if ($detalle !== null) {
            $detalleJson = is_string($detalle) ? $detalle : json_encode($detalle, JSON_UNESCAPED_UNICODE);
        }

        try {
            $stmt = $this->conexion->prepare(
                "INSERT INTO `bitacora` 
                 (`bit_usuario_id`, `bit_usuario_nombre`, `bit_rol`, `bit_accion`, `bit_modulo`, `bit_registro_id`, `bit_detalle`, `bit_ip`)
                 VALUES (:userId, :userName, :rol, :accion, :modulo, :registroId, :detalle, :ip)"
            );
            $stmt->bindParam(':userId',     $this->usuario['user_id'],   PDO::PARAM_INT);
            $stmt->bindParam(':userName',   $this->usuario['user_name'], PDO::PARAM_STR);
            $rolNombre = $this->usuario['rol_nombre'] ?? 'Sin rol';
            $stmt->bindParam(':rol',        $rolNombre, PDO::PARAM_STR);
            $stmt->bindParam(':accion',     $accion, PDO::PARAM_STR);
            $stmt->bindParam(':modulo',     $modulo, PDO::PARAM_STR);
            $stmt->bindParam(':registroId', $registroId, PDO::PARAM_STR);
            $stmt->bindParam(':detalle',    $detalleJson, PDO::PARAM_STR);
            $stmt->bindParam(':ip',         $ip, PDO::PARAM_STR);
            $stmt->execute();
        } catch (Exception $e) {
            error_log('[Bitacora] Error: ' . $e->getMessage());
        }
    }

    // ============================================
    // 8. DATOS PARA FRONTEND
    // ============================================
    public function getDatosParaFrontend(): array
    {
        if (!$this->usuario) $this->verificarSesion();

        return [
            // Datos del usuario
            'user_id'              => $this->usuario['user_id'],
            'user_name'            => $this->usuario['user_name'],
            'user_nameUser'        => $this->usuario['user_nameUser'],
            'user_estatus'         => $this->usuario['user_estatus'],
            'rol_nombre'           => $this->usuario['rol_nombre'] ?? 'Sin rol',
            'rol_nivel'            => $this->usuario['rol_nivel'] ?? 0,

            'user_directionAcess'  => $this->puede('bancos', 'ver') ? 1 : 0,
            'user_editReq'         => $this->puede('requisiciones', 'editar') ? 1 : 0,
            'user_createPresion'   => $this->puede('presiones', 'crear') ? 1 : 0,
            'user_linkedPresion'   => $this->puede('enlazar', 'enlazar') ? 1 : 0,
            'user_payPresion'      => $this->puede('pagos', 'autorizar') ? 1 : 0,
            'user_closePresion'    => $this->puede('presiones', 'cerrar') ? 1 : 0,
            'puede_ver_reportes'       => $this->puede('reportes', 'ver'),
            'puede_ver_kpis'           => $this->puede('kpis', 'ver'),
            'puede_ver_bitacora'       => $this->puede('bitacora', 'ver'),
            'puede_admin_usuarios'     => $this->puede('usuarios', 'admin'),
            'puede_editar_proveedores' => $this->puede('proveedores', 'editar')
        ];
    }

    // ============================================
    // GETTERS
    // ============================================
    public function getUsuario()   { return $this->usuario; }
    public function getRol()       { return $this->usuario['rol_nombre'] ?? null; }
    public function getNivel()     { return $this->usuario['rol_nivel'] ?? 0; }
    public function getUserId()    { return $this->usuario['user_id'] ?? null; }
    public function getUserName()  { return $this->usuario['user_name'] ?? null; }
}
<?php
    // class Conexion{
    //     public static function Conectar(){
    //         define('servidor', 'localhost');
    //         define('nombre_bd', 'fuente_group_prod');
    //         define('usuario', 'root');
    //         define('password', '');

    //         $opciones = array(PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES utf8');
    //         try{
    //             $conexion = new PDO("mysql:host=".servidor."; dbname=".nombre_bd,usuario,password,$opciones);
    //             return $conexion;
    //         }catch(Exception $e){
    //             die("El error de conexion es: ". $e->getMessage());
    //         }
    //     }
    // }

class Conexion
{
    private static $conexion = null;

    public static function Conectar()
    {
        if (self::$conexion !== null) {
            return self::$conexion;
        }

        $rutaConfig = __DIR__ . '/config.php';

        if (!file_exists($rutaConfig)) {
            error_log('[Conexion BD] Archivo config.php no encontrado en: ' . $rutaConfig);
            http_response_code(500);
            die(json_encode([
                'error'   => true,
                'mensaje' => 'Error de configuración del servidor.'
            ]));
        }

        $cred = require $rutaConfig;

        $camposRequeridos = ['servidor', 'nombre_bd', 'usuario', 'password'];
        foreach ($camposRequeridos as $campo) {
            if (!array_key_exists($campo, $cred)) {
                error_log('[Conexion BD] Falta el campo "' . $campo . '" en config.php');
                http_response_code(500);
                die(json_encode([
                    'error'   => true,
                    'mensaje' => 'Error de configuración del servidor.'
                ]));
            }
        }

        $opciones = [
            PDO::MYSQL_ATTR_INIT_COMMAND  => 'SET NAMES utf8mb4',
            PDO::ATTR_ERRMODE             => PDO::ERRMODE_EXCEPTION,
            PDO::ATTR_EMULATE_PREPARES    => false,
            PDO::ATTR_DEFAULT_FETCH_MODE  => PDO::FETCH_ASSOC,
        ];

        try {
            self::$conexion = new PDO(
                'mysql:host=' . $cred['servidor'] . ';dbname=' . $cred['nombre_bd'] . ';charset=utf8mb4',
                $cred['usuario'],
                $cred['password'],
                $opciones
            );

            return self::$conexion;
        } catch (PDOException $e) {
            error_log('[Conexion BD] Error: ' . $e->getMessage());

            http_response_code(500);
            die(json_encode([
                'error'   => true,
                'mensaje' => 'Error interno del servidor. Contacte al administrador.'
            ]));
        }
    }

    public static function Desconectar()
    {
        self::$conexion = null;
    }
}
        

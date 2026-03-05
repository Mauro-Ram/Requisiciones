<?php
session_start();

// Verifica si la clave "Usuario" está definida
if (!isset($_SESSION["Usuario"]) || $_SESSION["Usuario"] == "") {
    // Redirige a login.php si la sesión no está activa
    header("Location: login.php");
    exit();
}
?>
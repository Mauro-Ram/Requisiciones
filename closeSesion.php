<?php
    session_start();
    session_destroy();
?>
<!DOCTYPE html>
<html><head><title>Cerrando sesión...</title></head>
<body>
<script>
    localStorage.clear();
    window.location.href = "login.php";
</script>
</body>
</html>
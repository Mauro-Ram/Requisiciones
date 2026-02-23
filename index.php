<?php
include_once 'validarSesion.php';
// NOTA PARA EL USUARIO: Se asume que {{NameUser}} y las directivas de Vue (v-if, v-for)
// funcionan correctamente cuando Vue se inicializa en tu archivo index.js.
?>
<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="utf8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <link rel="icon" type="image/jpg" href="./images/TheFuenteIcon.png" />
    <title>Inicio :: The Fuentes Corporation</title>

    <link rel="stylesheet" href="plugins/sweetalert/sweetalert2.min.css">
    
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Roboto+Flex:opsz,wght@8..144,300..700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Rounded:opsz,wght,FILL,GRAD@20..48,400,0,0" />
    
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/2.0.8/css/dataTables.bootstrap5.css">
    
    <link rel="stylesheet" href="main.css">
    
    <style>
        :root {
            /* Definición de paleta de colores consistente */
            --primary-color: #4468C1;
            --primary-dark: #324d91;
            --bg-body: #f8faff; /* Fondo general más luminoso */
            --text-dark: #2c3e50;
            --text-muted: #7f8c8d;
            --sidebar-width: 280px; /* Un poco más ancho para mejor lectura */
            --card-shadow: 0 10px 30px -5px rgba(68, 104, 193, 0.1); /* Sombra suave y moderna */
        }

        body {
            font-family: 'Roboto Flex', sans-serif;
            background-color: var(--bg-body);
            height: 100vh;
            overflow: hidden;
        }

        /* --- MEJORAS DEL SIDEBAR --- */
        #sidebar {
            width: var(--sidebar-width);
            background: linear-gradient(160deg, var(--primary-color) 0%, var(--primary-dark) 100%);
            box-shadow: 5px 0 15px rgba(0,0,0,0.05);
            z-index: 100;
        }

        .sidebar-header {
            padding: 2rem 1.5rem;
            background-color: rgba(0,0,0,0.08);
        }

        .nav-link {
            color: rgba(255,255,255,0.8);
            font-weight: 500;
            padding: 14px 20px;
            margin: 4px 12px;
            border-radius: 12px; /* Bordes más redondeados */
            transition: all 0.3s ease;
            display: flex;
            align-items: center;
        }

        /* Efecto Hover y Active más sofisticado */
        .nav-link:hover, .nav-link.active, .nav-link[aria-expanded="true"] {
            background-color: rgba(255,255,255,0.15);
            color: white;
            transform: translateX(5px); /* Pequeño movimiento al interactuar */
        }

        .nav-link .material-symbols-rounded {
            margin-right: 16px;
            font-size: 24px;
        }

        /* Submenú */
        #submenuObras .nav-link {
            padding-left: 50px;
            background: transparent !important; /* El submenú no debe tener fondo active */
            transform: none !important;
            font-size: 0.95rem;
        }
        #submenuObras .nav-link:hover {
             color: white;
             padding-left: 55px; /* Desplazamiento solo en el texto */
        }
        
        /* --- MEJORAS DEL ÁREA PRINCIPAL --- */
        #main-content {
            flex-grow: 1;
            height: 100vh;
            overflow-y: auto;
            display: flex;
            flex-direction: column;
        }

        /* Navbar Superior Limpia */
        .navbar-custom {
            background: white;
            padding: 1rem 2rem;
            border-bottom: 1px solid #eef2f7;
        }

        /* --- NUEVO DISEÑO DEL HERO DE BIENVENIDA --- */
        /* Reemplaza a la tarjeta simple anterior */
        .welcome-hero {
            background: white;
            border-radius: 24px;
            padding: 3rem;
            /* Degradado sutil de fondo */
            background: linear-gradient(135deg, #ffffff 0%, #f0f4ff 100%);
            box-shadow: var(--card-shadow);
            position: relative;
            overflow: hidden;
        }

        /* Decoración de fondo */
        .welcome-hero::after {
            content: 'dashboard';
            font-family: 'Material Symbols Rounded';
            position: absolute;
            right: -20px;
            bottom: -40px;
            font-size: 200px;
            color: var(--primary-color);
            opacity: 0.05;
            pointer-events: none;
            transform: rotate(-10deg);
        }
        
        .hero-title {
            color: var(--text-dark);
            font-weight: 700;
            letter-spacing: -0.5px;
        }

        .hero-subtitle {
            font-size: 1.1rem;
            color: var(--text-muted);
            max-width: 600px;
        }

        /* Botones de acción rápida en el hero */
        .quick-action-btn {
            background: white;
            border: 1px solid #eef2f7;
            color: var(--primary-color);
            font-weight: 600;
            padding: 12px 24px;
            border-radius: 50px;
            display: inline-flex;
            align-items: center;
            box-shadow: 0 4px 10px rgba(0,0,0,0.03);
            transition: all 0.2s;
        }
        .quick-action-btn:hover {
            background: var(--primary-color);
            color: white;
            box-shadow: 0 8px 20px rgba(68, 104, 193, 0.2);
            transform: translateY(-2px);
        }
        .quick-action-btn .material-symbols-rounded {
            font-size: 20px;
            margin-right: 8px;
        }

    </style>
</head>

<body>
    <div id="AppIndex" class="d-flex w-100">
        
        <div class="d-flex flex-column flex-shrink-0" id="sidebar">
            <div class="sidebar-header d-flex align-items-center">
                <div class="bg-white bg-opacity-25 rounded-circle p-2 d-flex justify-content-center align-items-center me-3">
                     <span class="material-symbols-rounded text-white fs-2">person</span>
                </div>
                <div class="d-flex flex-column text-truncate">
                    <span class="small text-white-50 fw-semibold">Workspace</span>
                    <span class="fs-5 fw-bold text-white text-truncate" title="{{NameUser}}">{{NameUser}}</span>
                </div>
            </div>
            
            <div class="flex-grow-1 overflow-auto py-4">
                <ul class="nav flex-column list-unstyled" id="v-pills-tab" role="tablist">
                    
                    <li v-if="this.users[0].user_directionAcess == 1">
                        <a href="#" class="nav-link text-decoration-none" @click="irDireecion">
                            <span class="material-symbols-rounded">corporate_fare</span>
                            <span>DIRECCIÓN</span>
                        </a>
                    </li>

                    <li>
                        <a href="#submenuObras" class="nav-link text-decoration-none d-flex justify-content-between" data-bs-toggle="collapse" role="button" aria-expanded="false">
                            <span class="d-flex align-items-center">
                                <span class="material-symbols-rounded">engineering</span>
                                <span>OBRAS</span>
                            </span>
                            <span class="material-symbols-rounded opacity-50">expand_more</span>
                        </a>
                        <div class="collapse" id="submenuObras">
                            <ul class="nav flex-column list-unstyled ps-2 mt-1">
                                <li v-for="obra in this.obras" :key="obra.obras_id">
                                    <a style="cursor: pointer" class="nav-link text-decoration-none" @click="irObra(obra.obras_id)">
                                        {{obra.obras_nombre}}
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </li>

                    <li>
                        <a href="#" class="nav-link text-decoration-none" @click="irMenuCatalago">
                            <span class="material-symbols-rounded">menu_book</span>
                            <span>CATÁLOGOS</span>
                        </a>
                    </li>
                </ul>
            </div>

            <div class="p-3 pb-4">
                <a href="./closeSesion.php" class="nav-link bg-danger bg-opacity-25 text-white justify-content-center fw-bold mt-auto">
                    <span class="material-symbols-rounded me-2">logout</span>
                    Cerrar Sesión
                </a>
            </div>
        </div>
        <div id="main-content">
            
            <nav class="navbar-custom d-flex justify-content-between align-items-center sticky-top">
                <div>
                    <h5 class="mb-1 fw-bold" style="color: var(--primary-dark);">The Fuentes Corporation Workspace</h5>
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb mb-0 small">
                            <li class="breadcrumb-item active d-flex align-items-center text-muted">
                                <span class="material-symbols-rounded fs-5 me-1">home</span>
                                Inicio
                            </li>
                        </ol>
                    </nav>
                </div>
                <div class="d-flex align-items-center text-muted fw-medium bg-light px-3 py-2 rounded-pill">
                    <span class="material-symbols-rounded me-2 fs-5">calendar_today</span>
                    <?php setlocale(LC_TIME, 'es_ES', 'esp'); echo strftime("%d de %B, %Y"); ?>
                </div>
            </nav>

            <div class="container-fluid p-4 p-md-5">
                
                <div class="row mb-5">
                    <div class="col-12">
                        <div class="welcome-hero">
                            <div class="row align-items-center position-relative z-1">
                                <div class="col-lg-8">
                                    <h1 class="display-5 hero-title mb-3">Hola, {{NameUser}}</h1>
                                    <p class="hero-subtitle mb-4 pe-lg-5 lead">
                                        Bienvenido a tu panel de control. Hemos preparado todo para que gestiones tus proyectos de forma eficiente hoy.
                                    </p>
                                    
                                    <div class="d-flex flex-wrap gap-3 mt-4">
                                        <button class="btn quick-action-btn text-decoration-none">
                                            <span class="material-symbols-rounded">add_circle</span>
                                            Nueva Acción
                                        </button>
                                        <a href="#" class="btn quick-action-btn text-decoration-none" @click="irMenuCatalago">
                                            <span class="material-symbols-rounded">manage_search</span>
                                            Consultar Catálogos
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-12">
                        <div class="alert alert-info bg-white border-0 shadow-sm rounded-4 d-flex align-items-center p-4">
                             <span class="material-symbols-rounded fs-1 text-primary me-3 opacity-50">info</span>
                             <div>
                                 <h5 class="fw-bold mb-1">Área de Trabajo</h5>
                                 <p class="mb-0 text-muted">Selecciona una opción del menú lateral para cargar la información aquí.</p>
                             </div>
                         </div>
                    </div>
                </div>

            </div> </div> </div> <script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
    <script src="https://unpkg.com/@popperjs/core@2/dist/umd/popper.js"></script>
    <script src="./bootstrap/js/bootstrap.min.js"></script>

    <script src="https://cdn.jsdelivr.net/npm/vue@2.5.16/dist/vue.js"></script>

    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>

    <script src="plugins/sweetalert/sweetalert2.min.js"></script>

    <script src="https://cdn.datatables.net/2.0.8/js/dataTables.js"></script>
    <script src="https://cdn.datatables.net/2.0.8/js/dataTables.bootstrap5.js"></script>

    <script src="./js/index.js"></script>
</body>

</html>
<?php
include_once 'validarSesion.php';
?>
<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <link rel="icon" type="image/jpg" href="./images/TheFuenteIcon.png" />
    
    <link rel="stylesheet" href="plugins/sweetalert/sweetalert2.min.css">
    
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Roboto+Flex:opsz,wght@8..144,300..600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/2.0.8/css/dataTables.bootstrap5.css">
    <link rel="stylesheet" href="main.css">
    
    <title>Presiones de Todas las Obras</title>

    <style>
        /* ESTILOS MINIMALISTAS (Solo afectan al contenido, no al sidebar) */
        body {
            background-color: #f4f6f9; /* Fondo gris muy claro para contraste */
            font-family: 'Roboto Flex', sans-serif;
        }

        /* Navbar Superior más limpia */
        .navbar-top {
            background-color: #ffffff !important;
            border-bottom: 1px solid #e0e0e0;
            box-shadow: 0 1px 3px rgba(0,0,0,0.05);
        }
        .navbar-brand-text {
            color: #4468C1;
            font-weight: 700;
            letter-spacing: 0.5px;
        }

        /* Contenedor Principal */
        .main-content {
            padding: 20px 40px; /* Más aire a los lados */
        }

        /* Acordeón Minimalista */
        .accordion-item {
            border: none;
            margin-bottom: 10px;
            border-radius: 8px !important;
            box-shadow: 0 2px 5px rgba(0,0,0,0.02);
            overflow: hidden;
            background: #fff;
        }
        
        .accordion-button {
            background-color: #ffffff;
            color: #333;
            font-weight: 600;
            padding: 15px 20px;
            box-shadow: inset 0 -1px 0 rgba(0,0,0,0.05);
        }
        
        .accordion-button:not(.collapsed) {
            color: #4468C1;
            background-color: #f8faff;
            box-shadow: inset 0 -1px 0 rgba(0,0,0,0.05);
        }
        
        .accordion-button:focus {
            box-shadow: none;
            border-color: rgba(0,0,0,0.05);
        }

        /* Tablas Minimalistas */
        .table-minimal thead th {
            background-color: #f8f9fa;
            color: #6c757d;
            font-weight: 600;
            font-size: 0.75rem;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            border-bottom: 2px solid #eaecf0;
            padding: 12px;
        }
        
        .table-minimal tbody td {
            vertical-align: middle;
            font-size: 0.85rem;
            padding: 8px 12px;
            color: #2c3e50;
        }

        /* Inputs dentro de tablas */
        .input-group-sm .form-control, 
        .form-control-sm {
            border-radius: 4px;
            border: 1px solid #dee2e6;
            font-size: 0.85rem;
        }
        
        .input-group-text {
            background-color: #f8f9fa;
            border: 1px solid #dee2e6;
            color: #6c757d;
        }

        /* Botones sutiles */
        .btn-ghost {
            background: transparent;
            color: #4468C1;
            border: 1px solid #4468C1;
            transition: all 0.2s;
        }
        .btn-ghost:hover {
            background: #4468C1;
            color: white;
        }

        .header-title {
            font-size: 1.5rem;
            color: #1a1a1a;
        }
        .header-subtitle {
            color: #6c757d;
            font-size: 0.9rem;
        }
    </style>
</head>

<body style="display: flex;">
    <div id="AppIndex" class="d-flex w-100">
        
        <div class="d-flex flex-column flex-shrink-0 p-3 text-white position-fixed top-0 start-0 h-100" style="width: 15%; z-index: 1000; background-color: #212529;" id="sidebar">
            <div class="d-flex align-items-center mb-3 mb-md-0 me-md-auto text-white text-decoration-none">
                <div class="d-flex flex-row">
                    <div class="d-flex align-items-center me-3">
                        <img src="images/icons/user.svg" alt="user-icon" height="60" width="60">
                    </div>
                    <div class="d-flex flex-column my-3">
                        <span class="fs-5"> {{NameUser}}</span>
                    </div>
                </div>
            </div>
            <hr>
            <div id="sideBarItem" class="mb-auto overflow-auto">
                <ul class="nav nav-pills flex-column f-5" id="v-pills-tab" role="tablist" aria-orientation="vertical">
                    <li v-if="this.users[0].user_directionAcess == 1">
                        <a href="#" class="nav-link text-white" id="v-pills-reports-tab" data-bs-toggle="pill" data-bs-target="#v-pills-reports" type="button" role="tab" aria-controls="v-pills-reports" aria-selected="false" @click="irDireecion">
                            <img class="me-2" src="images/icons/ceo.svg" alt="user-icon" height="24" width="24">
                            DIRECCION
                        </a>
                    </li>
                    <li>
                        <a href="#" class="nav-link text-white" aria-current="page" id="v-pills-obras-tab" data-bs-toggle="pill" data-bs-target="#v-pills-obras" type="button" role="tab" aria-controls="v-pills-obras" aria-selected="true">
                            <img class="me-2" src="images/icons/obras.svg" alt="user-icon" height="24" width="24">
                            OBRAS
                        </a>
                        <div class="tab-content" id="v-pills-tabContent">
                            <ul class="tab-pane fade nav nav-pills flex-column mb-auto" id="v-pills-obras" role="tabpanel" aria-labelledby="v-pills-obras-tab">
                                <li v-for="obra in this.obras">
                                    <a style="cursor: pointer" class="nav-link text-white ms-4" aria-current="page" @click="irObra(obra.obras_id)">{{obra.obras_nombre}}</a>
                                </li>
                            </ul>
                        </div>
                    </li>
                    <li>
                        <a href="#" class="nav-link text-white" aria-current="page" id="v-pills-catalago-tab" data-bs-toggle="pill" data-bs-target="#v-pills-catalago" type="button" role="tab" aria-controls="v-pills-catalago" aria-selected="false" @click="irMenuCatalago">
                            <img class="me-2" src="images/icons/catalagos.svg" alt="user-icon" height="24" width="24">
                            CATALAGOS
                        </a>
                    </li>
                </ul>
            </div>
            <hr>
            <div class="dropdown">
                <a href="./closeSesion.php" class="d-flex align-items-center text-white text-decoration-none f-5" aria-expanded="false">
                    <img class="me-2" src="images/icons/logout.svg" alt="user-icon" height="24" width="24">
                    <span>CERRAR SESION</span>
                </a>
            </div>
        </div>
        <div class="d-flex flex-column flex-shrink-0 min-vh-100 position-absolute top-0 end-0" style="width: 85%;">
            
            <nav class="navbar navbar-top px-4 py-2 sticky-top">
                <div class="d-flex justify-content-between w-100 align-items-center">
                    <span class="navbar-brand-text fs-5">The Fuentes Corporation Workspace</span>
                    
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb mb-0" style="font-size: 0.85rem;">
                            <li class="breadcrumb-item"><a href="./index.php" class="text-decoration-none text-muted">Inicio</a></li>
                            <li class="breadcrumb-item"><a href="./direccion.php" class="text-decoration-none text-muted">Dirección</a></li>
                            <li class="breadcrumb-item active fw-bold text-primary" aria-current="page">Presiones Pendientes</li>
                        </ol>
                    </nav>
                </div>
            </nav>

            <div class="main-content overflow-auto">
                
                <div class="d-flex justify-content-between align-items-center mb-4 mt-2">
                    <div>
                        <h2 class="header-title fw-bold mb-1">Presiones Pendientes</h2>
                        <p class="header-subtitle mb-0">Listado de obras pendientes de autorización y pago</p>
                    </div>
                </div>

                <div class="accordion" id="accordionExample">
                    
                    <div class="accordion-item" v-for="(obra, index) in presiones" :key="index">
                        <h2 class="accordion-header">
                            <button v-bind:class="'accordion-button d-flex justify-content-between align-items-center '+ obra.colapse_Atr" type="button" data-bs-toggle="collapse" v-bind:data-bs-target="'#' + 'collapse' + quitarEspacios(obra.Nombre_Obra)" v-bind:aria-expanded="obra.colapse_band" v-bind:aria-controls="'collapse' + quitarEspacios(obra.Nombre_Obra)">
                                <span class="d-flex align-items-center gap-2">
                                    <span class="material-symbols-outlined text-primary">apartment</span>
                                    <span>{{obra.Nombre_Obra}}</span>
                                </span>
                            </button>
                        </h2>
                        
                        <div v-bind:id="'collapse'+ quitarEspacios(obra.Nombre_Obra)" class="'accordion-collapse collapse ' + obra.colapse_show" data-bs-parent="#accordionExample">
                            <div class="accordion-body p-0"> <div class="d-flex justify-content-end p-3 bg-light border-bottom">
                                    <button type="button" class="btn btn-ghost btn-sm fw-bold d-flex align-items-center gap-2" @click="consultarTotales(obra.total_Glabal, obra.total_Global_Aut, obra.total_Efectivo, obra.total_Efectivo_Aut, obra.total_Transferencia, obra.total_Transferencia_Aut, obra.total_Global_Rechazado, obra.total_Efectivo_Rechazado, obra.total_Transferencia_Rechazado, obra.Nombre_Obra)">
                                        <span class="material-symbols-outlined" style="font-size: 18px;">analytics</span>
                                        Consultar Totales
                                    </button>
                                </div>

                                <div class="table-responsive">
                                    <table id="example" class="table table-hover table-minimal mb-0 w-100">
                                        <thead>
                                            <tr>
                                                <th style="width: 8%;">CLAVE</th>
                                                <th style="width: 10%;">N° REQUISICIÓN</th>
                                                <th style="width: 15%;">PROVEEDOR</th>
                                                <th style="width: 20%;">CONCEPTO</th>
                                                <th class="text-end" style="width: 10%;">ADEUDO</th>
                                                <th class="text-end" style="width: 15%;">PAGO AUT.</th>
                                                <th style="width: 15%;">OBSERVACIONES</th>
                                                <th style="width: 7%;">PAGO</th>                                                    
                                            </tr>
                                        </thead>
                                        <tbody id="Tabla_Items">
                                            <tr v-for="(presionObra,indice) of obra.Presion_Obra">
                                                <td class="fw-bold text-secondary" style="font-size: 0.8rem;">{{presionObra.clave}}</td>
                                                <td>{{presionObra.NumReq}}</td>
                                                <td>
                                                    <div class="text-truncate" style="max-width: 150px;" :title="presionObra.proveedor">{{presionObra.proveedor}}</div>
                                                </td>
                                                <td>
                                                    <div class="text-truncate" style="max-width: 200px;" :title="presionObra.concepto">{{presionObra.concepto}}</div>
                                                </td>
                                                <td class="text-end fw-bold">{{formatearMoneda(presionObra.total)}}</td>
                                                
                                                <td>
                                                    <div class="input-group input-group-sm">                                                                  
                                                        <span class="input-group-text bg-white border-end-0">$</span>
                                                        <input type="text" class="form-control border-start-0 text-end fw-bold text-primary" v-model="presionObra.adeudo">
                                                        <button class="btn btn-outline-secondary" type="button" @click="openWinPorcentaje(index,indice)" title="Calcular Porcentaje">%</button>
                                                    </div>
                                                </td>
                                                
                                                <td>
                                                    <textarea v-model="presionObra.Observaciones" class="form-control form-control-sm" rows="1" placeholder="Comentarios..." style="resize: none;"></textarea>
                                                </td>
                                                
                                                <td>
                                                    <span class="badge bg-light text-dark border">{{presionObra.formaPago}}</span>
                                                </td>                
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>

                                <div class="p-3 bg-light border-top d-flex justify-content-end">
                                    <button type="button" class="btn btn-primary btn-sm px-4 fw-bold shadow-sm d-flex align-items-center gap-2" @click="guardarCambios(obra.Presion_Obra)">
                                        <span class="material-symbols-outlined" style="font-size: 18px;">save</span>
                                        Guardar Cambios
                                    </button>
                                </div>

                            </div>
                        </div>
                    </div>
                </div> </div>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
    <script src="https://unpkg.com/@popperjs/core@2/dist/umd/popper.js"></script>
    <script src="./bootstrap/js/bootstrap.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/vue@2.5.16/dist/vue.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
    <script src="plugins/sweetalert/sweetalert2.min.js"></script>
    <script src="https://cdn.datatables.net/2.0.8/js/dataTables.js"></script>
    <script src="https://cdn.datatables.net/2.0.8/js/dataTables.bootstrap5.js"></script>
    <script src="./js/all_presiones.js"></script>
</body>

</html>
<!-- SIDEBAR — Se renderiza UNA sola vez -->
<div id="sidebar">
    <!-- Header del usuario -->
    <div class="sidebar-header d-flex align-items-center">
        <div class="bg-white bg-opacity-25 rounded-circle p-2 d-flex justify-content-center align-items-center me-3" style="min-width:44px; height:44px;">
            <span class="material-symbols-rounded text-white" style="font-size:24px;">person</span>
        </div>
        <div class="d-flex flex-column text-truncate">
            <span class="small text-white-50 fw-semibold">Workspace</span>
            <span class="fs-6 fw-bold text-white text-truncate" id="sidebarUserName">Cargando...</span>
            <span class="badge bg-white bg-opacity-25 text-white mt-1" style="font-size:0.7rem; width:fit-content;" id="sidebarUserRol"></span>
        </div>
    </div>

    <!-- Navegación -->
    <div class="flex-grow-1 py-3 sidebar-nav">
        <ul class="nav flex-column list-unstyled">

            <!-- INICIO -->
            <li>
                <a href="index.php?vista=inicio" class="nav-link <?php echo ($vista ?? '') == 'inicio' ? 'active' : ''; ?>">
                    <span class="material-symbols-rounded">home</span>
                    <span>INICIO</span>
                </a>
            </li>

            <!-- DIRECCIÓN — Solo roles con acceso -->
            <li v-if="puedeVerDireccion">
                <a href="index.php?vista=direccion" class="nav-link <?php echo ($vista ?? '') == 'direccion' ? 'active' : ''; ?>">
                    <span class="material-symbols-rounded">corporate_fare</span>
                    <span>DIRECCIÓN</span>
                </a>
            </li>

            <!-- OBRAS — Desplegable -->
            <li>
                <a href="#submenuObras" class="nav-link d-flex justify-content-between" data-bs-toggle="collapse" role="button" aria-expanded="false">
                    <span class="d-flex align-items-center">
                        <span class="material-symbols-rounded">engineering</span>
                        <span>OBRAS</span>
                    </span>
                    <span class="material-symbols-rounded opacity-50" style="font-size:20px;">expand_more</span>
                </a>
                <div class="collapse" id="submenuObras">
                    <ul class="nav flex-column list-unstyled">
                        <li v-for="obra in obras" :key="obra.obras_id">
                            <a style="cursor:pointer" class="nav-link sub-link" @click="irObra(obra.obras_id)">
                                {{obra.obras_nombre}}
                            </a>
                        </li>
                    </ul>
                </div>
            </li>

            <!-- CATÁLOGOS -->
            <li>
                <a href="index.php?vista=menu_catalago" class="nav-link <?php echo ($vista ?? '') == 'menu_catalago' ? 'active' : ''; ?>">
                    <span class="material-symbols-rounded">menu_book</span>
                    <span>CATÁLOGOS</span>
                </a>
            </li>

        </ul>
    </div>

    <!-- Cerrar Sesión -->
    <div class="p-3">
        <a href="./closeSesion.php" class="nav-link bg-danger bg-opacity-25 text-white justify-content-center fw-bold rounded-3 text-center" style="padding:10px;">
            <span class="material-symbols-rounded me-1" style="font-size:18px; vertical-align:middle;">logout</span>
            Cerrar Sesión
        </a>
    </div>
</div>
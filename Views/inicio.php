<!-- views/inicio.php — Solo el contenido del área principal -->
<div class="container-fluid p-4 p-md-5">

    <!-- Hero de Bienvenida -->
    <div class="row mb-5">
        <div class="col-12">
            <div class="p-4 rounded-4 shadow-sm" style="background: linear-gradient(135deg, #ffffff 0%, #f0f4ff 100%);">
                <div class="row align-items-center">
                    <div class="col-lg-8">
                        <h1 class="display-6 fw-bold mb-3" style="color: #2c3e50;">
                            Hola, <span id="heroUserName">{{NameUser}}</span>
                        </h1>
                        <p class="lead text-muted mb-4">
                            Bienvenido a tu panel de control. Gestiona tus proyectos de forma eficiente.
                        </p>
                        <div class="d-flex flex-wrap gap-3">
                            <a href="index.php?vista=menu_catalago" class="btn btn-outline-primary rounded-pill px-4 d-flex align-items-center gap-2">
                                <span class="material-symbols-rounded" style="font-size:18px;">manage_search</span>
                                Consultar Catálogos
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Info -->
    <div class="row">
        <div class="col-12">
            <div class="alert bg-white border-0 shadow-sm rounded-4 d-flex align-items-center p-4">
                <span class="material-symbols-rounded fs-1 text-primary me-3 opacity-50">info</span>
                <div>
                    <h5 class="fw-bold mb-1">Área de Trabajo</h5>
                    <p class="mb-0 text-muted">Selecciona una opción del menú lateral para comenzar.</p>
                </div>
            </div>
        </div>
    </div>

</div>
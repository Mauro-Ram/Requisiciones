<!-- views/menu_catalago.php — Solo el contenido -->
<div class="container px-5 py-4">
    <div class="row">
        <div class="col-12">
            <h2 class="text-dark mb-1 fw-bold">CATÁLOGOS DE THE FUENTES CORPORATION</h2>
            <p class="text-muted mb-4">Selecciona el catálogo que quieres consultar.</p>
        </div>
    </div>
    <div class="row g-3">
        <div class="col-4">
            <div class="card h-100 border-0 shadow-sm text-center p-4" style="cursor:pointer;" @click="irVista('proveedores')">
                <img class="mx-auto mb-3" src="images/icons/supplier.svg" alt="proveedores" height="80" width="80">
                <h5 class="fw-bold">Proveedores</h5>
            </div>
        </div>
        <div class="col-4">
            <div class="card h-100 border-0 shadow-sm text-center p-4" style="cursor:pointer;" @click="irVista('bancos')">
                <img class="mx-auto mb-3" src="images/icons/bank.svg" alt="bancos" height="80" width="80">
                <h5 class="fw-bold">Bancos</h5>
            </div>
        </div>
    </div>
</div>
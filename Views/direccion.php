<!-- views/direccion.php — Solo el contenido -->
<div class="container px-5 py-4">
    <div class="row">
        <div class="col-12">
            <h2 class="text-dark mb-1 fw-bold">Menu de Dirección The Fuentes Corporation</h2>
            <p class="text-muted mb-4">Selecciona la acción que realizarás.</p>
        </div>
    </div>
    <div class="row g-3">
        <div class="col-4">
            <div class="card h-100 border-0 shadow-sm text-center p-4" style="cursor:pointer;" @click="irVista('all_presiones')">
                <img class="mx-auto mb-3" src="images/icons/requisiciones.svg" alt="presiones" height="80" width="80">
                <h5 class="fw-bold">Presiones de Obras</h5>
            </div>
        </div>
    </div>
</div>
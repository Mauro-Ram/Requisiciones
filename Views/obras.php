<!-- views/obras.php — Solo el contenido -->
<div class="container px-5 py-4">
    <div class="row">
        <div class="col-12">
            <h2 class="text-dark mb-1 fw-bold" v-if="obraActiva.length">
                Menu de la Obra: {{obraActiva[0].obras_nombre}}
            </h2>
            <p class="text-muted mb-4">Selecciona la acción que realizarás sobre la obra.</p>
        </div>
    </div>
    <div class="row g-3">
        <div class="col-4">
            <div class="card h-100 border-0 shadow-sm text-center p-4" style="cursor:pointer;" @click="irVista('presiones')">
                <img class="mx-auto mb-3" src="images/icons/requisiciones.svg" alt="presiones" height="80" width="80">
                <h5 class="fw-bold">Presiones</h5>
            </div>
        </div>
        <div class="col-4">
            <div class="card h-100 border-0 shadow-sm text-center p-4" style="cursor:pointer;" @click="irVista('requisiciones')">
                <img class="mx-auto mb-3" src="images/icons/presiones.svg" alt="requisiciones" height="80" width="80">
                <h5 class="fw-bold">Requisiciones</h5>
            </div>
        </div>
    </div>
</div>
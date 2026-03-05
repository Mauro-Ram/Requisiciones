<?php
// Construir breadcrumb dinámico según la vista actual
$breadcrumbs = [
    'inicio' => [['Inicio', '']],
    'direccion' => [['Inicio', 'inicio'], ['Dirección', '']],
    'all_presiones' => [['Inicio', 'inicio'], ['Dirección', 'direccion'], ['Presiones Pendientes', '']],
    'obras' => [['Inicio', 'inicio'], ['Menu de Obra', '']],
    'requisiciones' => [['Inicio', 'inicio'], ['Menu de Obra', 'obras'], ['Requisiciones', '']],
    'hojas_requisicion' => [['Inicio', 'inicio'], ['Menu de Obra', 'obras'], ['Requisiciones', 'requisiciones'], ['Hojas', '']],
    'items_requisicion' => [['Inicio', 'inicio'], ['Menu de Obra', 'obras'], ['Requisiciones', 'requisiciones'], ['Hojas', 'hojas_requisicion'], ['Detalle', '']],
    'nueva_hoja' => [['Inicio', 'inicio'], ['Menu de Obra', 'obras'], ['Requisiciones', 'requisiciones'], ['Hojas', 'hojas_requisicion'], ['Nueva Hoja', '']],
    'presiones' => [['Inicio', 'inicio'], ['Menu de Obra', 'obras'], ['Presiones', '']],
    'presiones_detalles' => [['Inicio', 'inicio'], ['Menu de Obra', 'obras'], ['Presiones', 'presiones'], ['Detalle', '']],
    'enlazar_requisiciones' => [['Inicio', 'inicio'], ['Menu de Obra', 'obras'], ['Presiones', 'presiones'], ['Enlazar', '']],
    'menu_catalago' => [['Inicio', 'inicio'], ['Catálogos', '']],
    'proveedores' => [['Inicio', 'inicio'], ['Catálogos', 'menu_catalago'], ['Proveedores', '']],
    'agregar_proveedor' => [['Inicio', 'inicio'], ['Catálogos', 'menu_catalago'], ['Proveedores', 'proveedores'], ['Agregar', '']],
    'bancos' => [['Inicio', 'inicio'], ['Catálogos', 'menu_catalago'], ['Bancos', '']],
    'catalago' => [['Inicio', 'inicio'], ['Catálogos', 'menu_catalago'], ['Catálogo', '']],
];

$crumbs = $breadcrumbs[$vista] ?? [['Inicio', '']];
?>
<nav class="navbar-top d-flex justify-content-between align-items-center">
    <div>
        <h6 class="mb-1 fw-bold" style="color: var(--primary-dark);">The Fuentes Corporation Workspace</h6>
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb mb-0 small">
                <?php foreach ($crumbs as $i => $crumb): ?>
                    <?php if ($crumb[1] === ''): ?>
                        <!-- Último item (activo) -->
                        <li class="breadcrumb-item active fw-bold text-primary" aria-current="page">
                            <?php if ($i === 0): ?>
                                <span class="material-symbols-rounded" style="font-size:16px; vertical-align:middle;">home</span>
                            <?php endif; ?>
                            <?php echo $crumb[0]; ?>
                        </li>
                    <?php else: ?>
                        <!-- Item con enlace -->
                        <li class="breadcrumb-item">
                            <a href="index.php?vista=<?php echo $crumb[1]; ?>" class="text-decoration-none text-muted">
                                <?php if ($i === 0): ?>
                                    <span class="material-symbols-rounded" style="font-size:16px; vertical-align:middle;">home</span>
                                <?php endif; ?>
                                <?php echo $crumb[0]; ?>
                            </a>
                        </li>
                    <?php endif; ?>
                <?php endforeach; ?>
            </ol>
        </nav>
    </div>
    <div class="d-flex align-items-center text-muted fw-medium bg-light px-3 py-1 rounded-pill" style="font-size:0.8rem;">
        <span class="material-symbols-rounded me-1" style="font-size:16px;">calendar_today</span>
        <?php echo date('d/m/Y'); ?>
    </div>
</nav>
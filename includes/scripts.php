<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
<!-- Popper -->
<script src="https://unpkg.com/@popperjs/core@2/dist/umd/popper.js"></script>
<!-- Bootstrap -->
<script src="./bootstrap/js/bootstrap.min.js"></script>
<!-- Vue.js -->
<script src="https://cdn.jsdelivr.net/npm/vue@2.5.16/dist/vue.js"></script>
<!-- Axios -->
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<!-- SweetAlert -->
<script src="plugins/sweetalert/sweetalert2.min.js"></script>
<!-- DataTables -->
<script src="https://cdn.datatables.net/2.0.8/js/dataTables.js"></script>
<script src="https://cdn.datatables.net/2.0.8/js/dataTables.bootstrap5.js"></script>

<?php if ($vista === 'presiones_detalles'): ?>
    <!-- jsPDF solo para presiones_detalles -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.5.3/jspdf.debug.js" integrity="sha384-NaWTHo/8YCBYJ59830LTz/P4aQZK1sS0SneOgAvhsIl3zBu8r9RevNg5lHCHAuQ/" crossorigin="anonymous"></script>
    <script src="./js/pdfGenerate.js"></script>
<?php endif; ?>

<!-- ✅ Permisos globales — SIEMPRE antes del JS de vista -->
<script src="./js/permisos.js"></script>

<!-- JS específico de la vista actual -->
<script src="./<?php echo $script_actual; ?>"></script>
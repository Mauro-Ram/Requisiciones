var url = "bd/crud_proveedor.php";
var url2 = ".";

const appRequesition = new Vue({
    el: "#AppIndex",
    data: {
        users: [],
        obras: [],
        proveedores: [],
        nombreProv: "",
        RFCProv: "",
        claveProv: "",
        cuentaProv: "",
        tarjetaProv: "",
        referenciaProv: "",
        typeProv: "",
        bancoProv: "",
        sucursalProv: "",
        telefonoProv: "",
        correoProv: "",
        NameUser: "",
        // NUEVO: permisos del usuario
        permisos: {},
        userRol: ""
    },
    methods: {
        consultarUsuario: function (user_id) {
            axios.post(url, { accion: 1, id_user: user_id }).then(response => {
                this.users = response.data;
                this.NameUser = this.users[0].user_name;
            });
        },
        listarObras: function () {
            axios.post(url, { accion: 2 }).then(response => {
                this.obras = response.data;
            });
        },
        obtenerProveedores: function () {
            axios.post(url, { accion: 3 }).then(response => {
                this.proveedores = response.data;
            }).finally(() => {
                $(document).ready(function () {
                    $('[data-toggle="tooltip"]').tooltip();
                    $('#example').DataTable({
                        "order": [],
                        "language": {
                            "sProcessing": "Procesando...", "sLengthMenu": "Mostrar _MENU_ registros",
                            "sZeroRecords": "No se encontraron resultados", "sEmptyTable": "Ningún dato disponible en esta tabla",
                            "sInfo": "Mostrando registros del _START_ al _END_ de un total de _TOTAL_ registros",
                            "sInfoEmpty": "Mostrando registros del 0 al 0 de un total de 0 registros",
                            "sInfoFiltered": "(filtrado de un total de _MAX_ registros)", "sSearch": "Buscar:",
                            "sLoadingRecords": "Cargando...",
                            "oPaginate": { "sFirst": "Primero", "sLast": "Último", "sNext": "Siguiente", "sPrevious": "Anterior" },
                            "oAria": { "sSortAscending": ": Activar para ordenar ascendente", "sSortDescending": ": Activar para ordenar descendente" }
                        },
                        "autoWidth": false
                    });
                });
            });
        },
        irObra(idObra) {
            localStorage.setItem("obraActiva", idObra);
            window.location.href = url2 + "/obras.php";
        },
        irDireecion: function () { window.location.href = url2 + "/direccion.php"; },
        irMenuCatalago: function () { window.location.href = url2 + "/menu_catalago.php"; },
        addProvedores: function () { window.location.href = url2 + "/agregar_proveedor.php"; },

        // EDITAR — ahora verifica permiso antes de abrir el modal
        editProvShow: async function (idProv) {
            if (!this.puedeEditar) {
                Swal.fire({ icon: 'error', title: 'Sin permisos', text: 'No tiene permisos para editar proveedores.' });
                return;
            }
            // ... tu lógica existente de abrir el Swal con el formulario de edición
            axios.post(url, { accion: 5, id_prov: idProv }).then(response => {
                const prov = response.data[0];
                // Aquí tu Swal.fire con los campos prellenados — SE MANTIENE IGUAL
                // La protección real está en el backend (case 6 con requierePermiso)
            });
        },

        // ELIMINAR (inactivar) — verifica permiso
        deleteProvShow: async function (idProv) {
            if (!this.puedeEditar) {
                Swal.fire({ icon: 'error', title: 'Sin permisos', text: 'No tiene permisos para desactivar proveedores.' });
                return;
            }
            const result = await Swal.fire({
                title: "¿Desactivar este proveedor?",
                icon: "warning", showCancelButton: true,
                confirmButtonText: "Sí, desactivar", cancelButtonText: "Cancelar"
            });
            if (result.isConfirmed) {
                axios.post(url, { accion: 4, id_prov: idProv }).then(response => {
                    Swal.fire({ toast: true, position: "top-end", icon: "success", title: "Proveedor desactivado", showConfirmButton: false, timer: 2000 });
                    this.obtenerProveedores();
                });
            }
        },

        cerrarSesion: function () { PermisosApp.cerrarSesion(); }
    },
    computed: {
        // Computed para usar en v-if del template
        puedeEditar: function () {
            return PermisosApp.tiene('proveedores_editar');
        },
        puedeCrear: function () {
            return PermisosApp.tiene('proveedores_crear');
        }
    },
    created: function () {
        PermisosApp.verificarSesion();
        this.permisos = PermisosApp.obtener();
        this.userRol = PermisosApp.getRol();
        this.NameUser = PermisosApp.getUserName();
        this.listarObras();
        this.consultarUsuario(PermisosApp.getUserId());
        this.obtenerProveedores();
    }
});
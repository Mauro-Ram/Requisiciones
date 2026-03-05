var url = "bd/crud_Requisiciones.php";
var url2 = ".";

const appRequesition = new Vue({
    el: "#AppPresion",
    data: {
        requisiciones: [],
        presiones: [],
        obras: [],
        obrasLista: [],
        requisicion: "",
        NameUser: "",
        gastosTotalPresion: 0,
        nombreRequisicion: "",
        fechaGeneracion: "",
        clave: "",
        folioReq: "",
        hojaReq: "",
        // NUEVO
        permisos: {},
        userRol: ""
    },
    methods: {
        ConsultarItemRq: async function (idRq) {
            localStorage.setItem("idRequisicion", idRq);
            window.location.href = url2 + "/hojas_requisicion.php";
        },
        infoObraActiva: async function (obrasId) {
            try {
                const response = await axios.post(url, { accion: 3, obra: obrasId });
                this.obras = response.data;
            } catch (error) { console.error("Error al consultar la Obra:", error); }
        },
        listarRequisiciones: async function (idObra) {
            try {
                const response = await axios.post(url, { accion: 1, obra: idObra });
                this.requisiciones = response.data;
                this.$nextTick(() => {
                    $(document).ready(function () {
                        $('[data-toggle="tooltip"]').tooltip();
                        $('#example').DataTable({
                            "order": [],
                            "language": {
                                "sProcessing": "Procesando...", "sLengthMenu": "Mostrar _MENU_ registros",
                                "sZeroRecords": "No se encontraron resultados", "sEmptyTable": "Ningún dato disponible",
                                "sInfo": "Mostrando _START_ al _END_ de _TOTAL_", "sSearch": "Buscar:",
                                "oPaginate": { "sFirst": "Primero", "sLast": "Último", "sNext": "Siguiente", "sPrevious": "Anterior" }
                            }
                        });
                    });
                });
            } catch (error) { console.error("Error al listar Requisiciones", error); }
        },
        consultarUsuario: async function (user_id) {
            try {
                const response = await axios.post(url, { accion: 2, id_user: user_id });
                this.users = response.data;
                this.NameUser = this.users[0].user_name;
            } catch (error) { console.error("Error al consultar usuario:", error); }
        },
        listarObras: async function () {
            try {
                const response = await axios.post(url, { accion: 5 });
                this.obrasLista = response.data;
            } catch (error) { console.error("Error Obras:", error); }
        },
        irObra(idObra) {
            localStorage.setItem("obraActiva", idObra);
            window.location.href = url2 + "/obras.php";
        },
        // Crear requisición — se mantiene igual, el backend verifica
        addRequisicion: async function () {
            // ... tu lógica actual de Swal con formulario — SIN CAMBIOS
            // El backend ya valida con requierePermiso('requisiciones', 'crear')
        },
        newRequisicionAuto: function () {
            axios.post(url, { accion: 6, nombreReq: this.nombreRequisicion, fechaReq: this.fechaGeneracion, clave: this.clave, obra: localStorage.getItem("obraActiva") }).then(response => {
                var table = $('#example').DataTable(); table.destroy();
                this.listarRequisiciones(localStorage.getItem("obraActiva"));
            });
        },
        newRequisicionManual: function () {
            this.hojaReq--;
            axios.post(url, { accion: 7, nombreReq: this.nombreRequisicion, fechaReq: this.fechaGeneracion, clave: this.clave, folio: this.folioReq, hoja: this.hojaReq, obra: localStorage.getItem("obraActiva") }).then(response => {
                var table = $('#example').DataTable(); table.destroy();
                this.listarRequisiciones(localStorage.getItem("obraActiva"));
            });
        },
        irDireecion: function () { window.location.href = url2 + "/direccion.php"; },
        editRequisicion: function (index) {
            this.requisiciones[index]['requisicion_EditShow'] = true;
            this.requisiciones[index]['requisicion_Numero'] = this.ultimosDigitos(this.requisiciones[index]['requisicion_Numero']);
        },
        saveEditrequisicion: function (index, idReq, numeroReq, nombreReq) {
            axios.post(url, { accion: 8, idReq: idReq, numeroReq: numeroReq, nombreReq: nombreReq }).then(response => {
                this.requisiciones[index]['requisicion_EditShow'] = false;
                this.requisiciones[index]['requisicion_Numero'] = response.data['numero_nuevo'];
            }).catch(error => {
                this.requisiciones[index]['requisicion_EditShow'] = false;
                // El interceptor global de axios ya muestra el Swal de 403
            });
        },

        // ELIMINAR — verificación en frontend + backend
        deleteRequisicionShow: async function (index, idReq) {
            if (!this.puedeEliminar) {
                Swal.fire({ icon: 'error', title: 'Sin permisos', text: 'No tiene permisos para eliminar requisiciones.' });
                return;
            }
            const result = await Swal.fire({
                title: "¿Quieres eliminar esta Requisición?",
                text: "Si tiene hojas integradas también se eliminarán. Esta acción no se puede revertir.",
                icon: "warning", showCancelButton: true,
                confirmButtonText: "Sí, eliminar", cancelButtonText: "No",
                customClass: { confirmButton: "btn btn-success ms-5 w-auto", cancelButton: "btn btn-danger w-auto" },
                buttonsStyling: false, reverseButtons: true
            });
            if (result.isConfirmed) { this.eliminarReq(index, idReq); }
        },
        eliminarReq: function (index, idReq) {
            axios.post(url, { accion: 9, idReq: idReq }).then(response => {
                Swal.fire({ toast: true, position: "top-end", icon: "success", title: "Eliminado", showConfirmButton: false, timer: 3000, timerProgressBar: true });
                this.requisiciones.splice(index, 1);
            });
            // Error 403 se maneja por el interceptor global
        },
        irMenuCatalago: function () { window.location.href = url2 + "/menu_catalago.php"; },
        ultimosDigitos: function (Folio) {
            const partes = Folio.split('-');
            const ultimaParte = partes[partes.length - 1];
            const numeros = ultimaParte.match(/\d+$/);
            return numeros ? numeros[0] : null;
        },
        cerrarSesion: function () { PermisosApp.cerrarSesion(); }
    },
    computed: {
        puedeCrear: function () { return PermisosApp.tiene('requisiciones_crear'); },
        puedeEliminar: function () { return PermisosApp.tiene('requisiciones_eliminar'); }
    },
    mounted: async function () {
        PermisosApp.verificarSesion();
        this.permisos = PermisosApp.obtener();
        this.userRol = PermisosApp.getRol();
        await this.listarObras();
        await this.consultarUsuario(PermisosApp.getUserId());
        await this.infoObraActiva(localStorage.getItem("obraActiva"));
        await this.listarRequisiciones(localStorage.getItem("obraActiva"));
    }
});
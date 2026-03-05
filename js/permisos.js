/**
 * permisos.js — Sistema de permisos, sesión y mixin global
 * Se incluye en TODAS las páginas vía includes/scripts.php
 */

const PermisosApp = {
    obtener: function () {
        try { return JSON.parse(localStorage.getItem("UserPermisos")) || {}; }
        catch (e) { return {}; }
    },
    tiene: function (permiso) {
        return this.obtener()[permiso] === true;
    },
    getRol: function () {
        return localStorage.getItem("UserRol") || 'Capturista';
    },
    getUserId: function () {
        return localStorage.getItem("NameUser") || null;
    },
    getUserName: function () {
        return localStorage.getItem("UserName") || '';
    },
    verificarSesion: function () {
        if (!this.getUserId()) {
            window.location.href = "./login.php";
            return false;
        }
        return true;
    }
};

/**
 * Mixin Vue — se inyecta en CUALQUIER instancia de Vue
 * Provee: datos del sidebar, permisos computed, navegación
 */
const PermisosMixin = {
    data: function () {
        return {
            userRol: '',
            userPermisos: {},
            users: [],
            obras: [],
            obrasLista: [],
            NameUser: ''
        };
    },
    computed: {
        puedeVerDireccion: function () {
            return ['Validador', 'CEO', 'Developer'].includes(this.userRol);
        },
        puedeCrearProveedor: function () { return PermisosApp.tiene('proveedores_crear'); },
        puedeEditarProveedor: function () { return PermisosApp.tiene('proveedores_editar'); },
        puedeCrearRequisicion: function () { return PermisosApp.tiene('requisiciones_crear'); },
        puedeEliminarRequisicion: function () { return PermisosApp.tiene('requisiciones_eliminar'); },
        puedeEditarRequisicion: function () { return PermisosApp.tiene('requisiciones_editar_propias'); },
        puedeCrearPresion: function () { return PermisosApp.tiene('presiones_crear'); },
        puedeEnlazarPresion: function () { return PermisosApp.tiene('presiones_enlazar'); },
        puedeCerrarPresion: function () { return PermisosApp.tiene('presiones_cerrar'); },
        puedeAutorizarPago: function () { return PermisosApp.tiene('pagos_autorizar'); },
        puedeVerPagos: function () { return PermisosApp.tiene('pagos_ver'); },
        puedeGestionarBancos: function () { return PermisosApp.tiene('bancos_gestionar'); },
        puedeGestionarObras: function () { return PermisosApp.tiene('obras_gestionar'); }
    },
    methods: {
        inicializarPermisos: function () {
            PermisosApp.verificarSesion();
            this.userRol = PermisosApp.getRol();
            this.userPermisos = PermisosApp.obtener();
            this.NameUser = PermisosApp.getUserName();

            // Actualizar sidebar con nombre y rol
            var sidebarName = document.getElementById('sidebarUserName');
            var sidebarRol = document.getElementById('sidebarUserRol');
            if (sidebarName) sidebarName.textContent = this.NameUser || 'Usuario';
            if (sidebarRol) sidebarRol.textContent = this.userRol;
        },
        /**
         * Navegación centralizada — reemplaza window.location.href
         * Ahora todo va a index.php?vista=xxx
         */
        irVista: function (vista) {
            window.location.href = 'index.php?vista=' + vista;
        },
        irObra: function (idObra) {
            localStorage.setItem("obraActiva", idObra);
            this.irVista('obras');
        },
        irDireecion: function () { this.irVista('direccion'); },
        irMenuCatalago: function () { this.irVista('menu_catalago'); },

        // Carga de datos comunes del sidebar
        cargarDatosSidebar: function () {
            var self = this;
            // Cargar obras para el sidebar
            axios.post('bd/crud_index.php', { accion: 2 }).then(function (response) {
                self.obras = response.data;
                self.obrasLista = response.data;
            });
            // Cargar datos del usuario
            var userId = PermisosApp.getUserId();
            if (userId) {
                axios.post('bd/crud_index.php', { accion: 1, id_user: userId }).then(function (response) {
                    self.users = response.data;
                    if (response.data.length > 0) {
                        self.NameUser = response.data[0].user_name;
                        var sidebarName = document.getElementById('sidebarUserName');
                        if (sidebarName) sidebarName.textContent = self.NameUser;
                    }
                });
            }
        }
    }
};

/**
 * Interceptor global de Axios — captura errores 403
 */
axios.interceptors.response.use(
    function (response) { return response; },
    function (error) {
        if (error.response && error.response.status === 403) {
            Swal.fire({
                icon: 'error',
                title: 'Acceso denegado',
                text: (error.response.data && error.response.data.mensaje)
                    ? error.response.data.mensaje
                    : 'No tiene permisos para esta acción.',
                confirmButtonColor: '#dc3545'
            });
        }
        return Promise.reject(error);
    }
);
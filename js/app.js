/**
 * app.js — Instancia Vue para la vista de inicio (views/inicio.php)
 * También sirve como fallback para vistas que no necesitan lógica especial
 */
var url = "bd/crud_index.php";

const appMain = new Vue({
    el: "#AppMain",
    mixins: [PermisosMixin],
    data: {
        // datos específicos de inicio (si los hay)
    },
    methods: {
        // métodos específicos de inicio (si los hay)
    },
    created: function () {
        this.inicializarPermisos();
        this.cargarDatosSidebar();
    }
});
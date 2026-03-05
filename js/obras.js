var url = "bd/crud_obras.php";

const appMain = new Vue({
    el: "#AppMain",                    // ← Siempre #AppMain
    mixins: [PermisosMixin],           // ← Siempre el mixin
    data: {
        obraActiva: [],
        // ... datos específicos de obras
    },
    methods: {
        infoObraActiva: function (obrasId) {
            var self = this;
            axios.post(url, { accion: 1, obra: obrasId }).then(function (response) {
                self.obraActiva = response.data;
            });
        },
        enterPresiones: function () { this.irVista('presiones'); },
        enterRequisiciones: function () { this.irVista('requisiciones'); },
        // ... demás métodos de obras
    },
    created: function () {
        this.inicializarPermisos();     // ← Siempre primero
        this.cargarDatosSidebar();      // ← Carga sidebar
        this.infoObraActiva(localStorage.getItem("obraActiva"));
    }
});
var url = "./bd/LoginAcces.php";
var url2 = ".";

const appLogin = new Vue({
    el: "#LoginApp",
    data: {
        User: "",
        Password: "",
        Credenciales: []
    },
    methods: {
        EntarLogin: async function (User, Password) {
            if (User == "" || Password == "") {
                Swal.fire({ toast: true, position: "top-end", icon: "warning", title: "Datos incompletos", showConfirmButton: false, timer: 3000, timerProgressBar: true });
            } else {
                this.login();
            }
        },
        login: function () {
            axios.post(url, { user: this.User, password: this.Password }).then(response => {
                this.Credenciales = response.data;
                if (this.Credenciales.bandera == "true") {
                    // Guardar datos de sesión en localStorage
                    localStorage.setItem("NameUser", this.Credenciales.user_id);
                    localStorage.setItem("UserName", this.Credenciales.user_name);
                    localStorage.setItem("UserRol", this.Credenciales.user_rol);
                    localStorage.setItem("UserPermisos", JSON.stringify(this.Credenciales.permisos));

                    Swal.fire({ toast: true, position: "top-end", icon: "success", title: "Autenticación Correcta", showConfirmButton: false, timer: 1000, timerProgressBar: true }).then(() => {
                        window.location.href = url2 + "/index.php";
                    });
                } else {
                    const mensaje = this.Credenciales.mensaje || "Verifica la información";
                    Swal.fire({ toast: true, position: "top-end", icon: "error", title: mensaje, showConfirmButton: false, timer: 2000, timerProgressBar: true });
                }
            });
        }
    },
    created: function () {},
    computed: {}
});
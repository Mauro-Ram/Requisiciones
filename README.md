# 🏗️ The Fuentes Corp WS

**The Fuentes Corp WS** es una aplicación web desarrollada en PHP, pensada para cubrir las necesidades administrativas de **The Fuentes Corporation**, con un enfoque en la gestión de requisiciones, proveedores, obras y generación de documentos operativos.

Este sistema centraliza los procesos internos relacionados con compras, solicitudes de recursos y seguimiento de obras, permitiendo una operación más organizada, clara y eficiente dentro del ecosistema corporativo.

---

## 🚀 Características principales

- 🔐 **Inicio de sesión seguro** con manejo de sesiones
- 🧾 **Gestión de requisiciones** con módulos para capturar, consultar y editar solicitudes
- 🏢 **Administración de proveedores** con registro detallado por RFC y contacto
- 📍 **Control de obras** incluyendo ubicación, descripción y presupuestos
- 📄 **Generación de documentos PDF** usando FPDF
- 📊 **Interfaz amigable** con Bootstrap y jQuery
- 🐳 **Contenedores Docker** para facilitar el despliegue del sistema

---

## 🧰 Tecnologías utilizadas

| Categoría         | Tecnología                      |
|-------------------|----------------------------------|
| Backend           | PHP (vanilla, sin framework)     |
| Frontend          | HTML, CSS, JavaScript            |
| UI/UX             | Bootstrap, jQuery, SweetAlert    |
| PDFs              | [FPDF](http://www.fpdf.org/)     |
| Contenedores      | Docker, docker-compose           |
| Control de código | Git                              |

---

## 📦 Estructura del proyecto

```bash
├── index.php                # Página de inicio / login
├── login.php                # Autenticación
├── agregar_proveedor.php    # Alta de proveedores
├── requisiciones.php        # Vista principal de requisiciones
├── nueva_requisicion.php    # Formulario para capturar requisiciones
├── obras.php / direccion.php
├── generar_pdf.php          # Generación de PDFs
├── js/                      # Scripts personalizados
├── bootstrap/               # Recursos UI
├── plugins/sweetalert/      # Alertas interactivas
├── Dockerfile
├── docker-compose.yml
└── README.md

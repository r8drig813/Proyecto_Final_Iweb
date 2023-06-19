<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.proyecto_iweb.models.beans.Juegos" %>
<%@ page import="com.example.proyecto_iweb.models.beans.Cuentas" %>
<%@ page import="com.example.proyecto_iweb.models.beans.VentaUsuario" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    ArrayList<VentaUsuario> listaVendidos = (ArrayList<VentaUsuario>) request.getAttribute("lista2");
    //ArrayList<Cuentas> listaPerfil = (ArrayList<Cuentas>) request.getAttribute("perfil");
    //ArrayList<ComprasVentas> listaNotificaciones = (ArrayList<ComprasVentas>) request.getAttribute("lista4");
%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">

    <title>JA-VAGOS</title>
    <meta content="" name="description">
    <meta content="" name="keywords">
    <link rel="icon" href="pestania.png">

    <!-- Estilos CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <!--Importando estilos CSS-->
    <link rel="stylesheet" href="estilos/usuario/filtros.css">

    <!-- Google Fonts -->
    <link href="https://fonts.gstatic.com" rel="preconnect">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

    <!-- Vendor CSS Files -->
    <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
    <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">

    <!-- Template Main CSS File -->
    <link href="assets/css/style.css" rel="stylesheet">

    <!-- Option 1: Include in HTML -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">

</head>
<body>
<jsp:include page="../includes/narvar.jsp">
    <jsp:param name="currentPage" value="vendidos"/>
</jsp:include>

<main id="main" class="main">

    <div class="pagetitle">
        <h1>Lista de videojuegos vendidos</h1>
    </div>

    <section class="section faq">
        <div class="row">
            <div class="col-lg-12" >
                <br><br>
                <table class="table table-stripped">
                    <thead>
                    <tr>
                        <th>Nombre</th>
                        <th>Precio de Venta</th>
                        <th>Estado</th>
                        <th>Opciones</th>
                        <th>Ver Formulario</th>
                    </tr>
                    </thead>
                    <tbody>
                    <% for (VentaUsuario vu : listaVendidos) { %>
                    <tr>
                        <td><%=vu.getJuegos().getNombre()%>
                        </td>
                        <td><%=vu.getPrecioVenta()%>
                        </td>
                        <td><%=vu.getEstados().getEstados()%>
                        </td>
                        <td> <% if (vu.getEstados().getEstados().equals("pendiente")){ %>
                            <a onclick="return confirm('¿ Estas de retirar tu propuesta ?')" class="btn btn-primary"
                               href="<%=request.getContextPath()%>/JuegosServlet?a=actualizarVenta&id=<%=vu.getIdVenta()%>">Retirar Propuesta</a>
                            <%}%>

                            <% if (vu.getEstados().getEstados().equals("aceptado")){ %>
                            <a onclick="return confirm('¿ Ya vendio el juego pero esta seguro de Eliminar ?')" class="btn btn-primary"
                               href="<%=request.getContextPath()%>/JuegosServlet?a=eliminarVenta&id=<%=vu.getIdVenta()%>">Eliminar Propuesta</a>
                            <%}%>
                            <% if (vu.getEstados().getEstados().equals("no aceptado")){ %>
                            <a href="<%=request.getContextPath()%>/JuegosServlet?a=verjuego&id=<%=vu.getIdVenta()%>" class="btn btn-dark">Ver Precio Sugerido</a>
                            <a href="<%=request.getContextPath()%>/UsuariosJuegosServlet?a=listarNotificaciones" class="btn btn-dark">Modificar Precio</a>
                            <a onclick="return confirm('¿ Estas de retirar tu propuesta ?')" class="btn btn-primary"
                               href="<%=request.getContextPath()%>/JuegosServlet?a=actualizarVenta&id=<%=vu.getIdVenta()%>">Retirar Propuesta</a>
                            <%}%>

                            <% if (vu.getEstados().getEstados().equals("rechazado")){ %>
                            <a href="<%=request.getContextPath()%>/UsuariosJuegosServlet?a=listarNotificaciones" class="btn btn-dark" >Ver Motivo</a>
                            <a onclick="return confirm('¿ Estas de retirar tu propuesta ?')" class="btn btn-primary"
                               href="<%=request.getContextPath()%>/JuegosServlet?a=actualizarVenta&id=<%=vu.getIdVenta()%>">Retirar Propuesta</a>
                            <%}%>

                            <% if (vu.getEstados().getEstados().equals("retirado")){ %>
                            <a onclick="return confirm('¿ Estas seguro de Eliminar ?')" class="btn btn-primary"
                               href="<%=request.getContextPath()%>/JuegosServlet?a=eliminarVenta&id=<%=vu.getIdVenta()%>">Eliminar Propuesta</a>
                            <%}%>

                        </td>
                        <td><a href="<%=request.getContextPath()%>/JuegosServlet?a=verjuego&id=<%=vu.getIdVenta()%>" class="btn btn-dark">Ver Formulario</a>
                        </td>
                    </tr>
                    <% } %>
                    </tbody>
                </table>
            </div>


        </div>
    </section>

</main><!-- End #main -->


<!-- ======= Footer ======= -->
<footer id="footer" class="footer">

    <!-- Section: Social media -->
    <section class="d-flex justify-content-center justify-content-lg-between p-4 border-bottom">
        <!-- Left -->
        <div class="me-5 d-none d-lg-block">
            <span>Conéctate con nosotras en las redes sociales:</span>
        </div>
        <!-- Left -->

        <!-- Right -->
        <div>
            <a href="" class="me-4 link-secondary">
                <i class="bi bi-facebook"></i>
            </a>
            <a href="" class="me-4 link-secondary">
                <i class="bi bi-twitter"></i>
            </a>
            <a href="" class="me-4 link-secondary">
                <i class="bi bi-instagram"></i>
            </a>
            <a href="" class="me-4 link-secondary">
                <i class="bi bi-linkedin"></i>
            </a>

        </div>
        <!-- Right -->
    </section>
    <!-- Section: Social media -->


    <!-- Section: Links  -->
    <section class="">
        <div class="container text-center text-md-start mt-5">
            <!-- Grid row -->
            <div class="row mt-3">
                <!-- Grid column -->
                <div class="col-md-3 col-lg-4 col-xl-3 mx-auto mb-4">
                    <!-- Content -->
                    <h6 class="text-uppercase fw-bold mb-4">
                        <i class="fas fa-gem me-3 text-secondary"></i>Nombre de la compañia
                    </h6>
                    <p>
                        Ja-Vagos, somos un grupo de estudiantes que quiere aprobar el curso de Ing. Web para Telecomunicaciones...
                    </p>
                </div>
                <!-- Grid column -->

                <!-- Grid column -->
                <div class="col-md-2 col-lg-2 col-xl-2 mx-auto mb-4">
                    <!-- Links -->
                    <h6 class="text-uppercase fw-bold mb-4">
                        Productos
                    </h6>
                    <p>
                        <a href="#!" class="text-reset">Angular</a>
                    </p>
                    <p>
                        <a href="#!" class="text-reset">React</a>
                    </p>
                    <p>
                        <a href="#!" class="text-reset">Vue</a>
                    </p>
                    <p>
                        <a href="#!" class="text-reset">Laravel</a>
                    </p>
                </div>
                <!-- Grid column -->

                <!-- Grid column -->
                <div class="col-md-3 col-lg-2 col-xl-2 mx-auto mb-4">
                    <!-- Links -->
                    <h6 class="text-uppercase fw-bold mb-4">
                        Links
                    </h6>
                    <p>
                        <a href="#!" class="text-reset">Pricing</a>
                    </p>
                    <p>
                        <a href="#!" class="text-reset">Settings</a>
                    </p>
                    <p>
                        <a href="#!" class="text-reset">Orders</a>
                    </p>
                    <p>
                        <a href="#!" class="text-reset">Help</a>
                    </p>
                </div>
                <!-- Grid column -->

                <!-- Grid column -->
                <div class="col-md-4 col-lg-3 col-xl-3 mx-auto mb-md-0 mb-4">
                    <!-- Links -->
                    <h6 class="text-uppercase fw-bold mb-4">Contacto</h6>
                    <p><i class="bi bi-geo-alt me-3 text-secondary"></i>Av. Universitaria 1801, San Miguel</p>
                    <p>
                        <i class="bi bi-envelope me-3 text-secondary"></i>
                        javagos@pucp.edu.pe
                    </p>
                    <p><i class="bi bi-phone me-3 text-secondary"></i> + 51 987 654 321</p>
                    <p><i class="bi bi-telephone me-3 text-secondary"></i> + 01 765 567 21</p>
                </div>
                <!-- Grid column -->
            </div>
            <!-- Grid row -->
        </div>
    </section>
    <!-- Section: Links  -->



    <div class="copyright">
        &copy; Copyright <strong><span>NiceAdmin</span></strong>. Todos los derechos reservados
    </div>
    <div class="credits">
        Designed by <a href="#">Ja-Vagos</a>
    </div>
</footer><!-- End Footer -->

<a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i
        class="bi bi-arrow-up-short"></i></a>


<!-- Vendor JS Files -->
<script src="/assets/vendor/apexcharts/apexcharts.min.js"></script>
<script src="/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="/assets/vendor/chart.js/chart.umd.js"></script>
<script src="/assets/vendor/echarts/echarts.min.js"></script>
<script src="/assets/vendor/quill/quill.min.js"></script>
<script src="/assets/vendor/simple-datatables/simple-datatables.js"></script>
<script src="/assets/vendor/tinymce/tinymce.min.js"></script>
<script src="/assets/vendor/php-email-form/validate.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
<!-- Template Main JS File -->
<script src="assets/js/main.js"></script>

</body>

</html>

<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.proyecto_iweb.models.beans.Juegos" %>
<%@ page import="com.example.proyecto_iweb.models.beans.Cuentas" %>
<%@ page import="com.example.proyecto_iweb.models.beans.CompraUsuario" %>
<%@ page import="com.example.proyecto_iweb.models.dtos.GeneroMasComprado" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    ArrayList<CompraUsuario> listaComprados = (ArrayList<CompraUsuario>) request.getAttribute("lista3");
    ArrayList<GeneroMasComprado> listaGenero = (ArrayList<GeneroMasComprado>) request.getAttribute("generoMasComprado");

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

<!-- ======= Header ======= -->
<jsp:include page="../includes/narvar.jsp">
    <jsp:param name="currentPage" value="comprados"/>
</jsp:include>

<main id="main" class="main">

    <div class="pagetitle">
        <h1>Historial de juegos comprados</h1>
    </div>
    <div class="row g-0">
        <br><br>
        <div class="col-md-6 offset-md-3 bg-primary border rounded-4 p-4">
            <div class="text-light text-center">
                <h4>Género Más Comprado</h4>
                <%for (GeneroMasComprado g : listaGenero){%>
                <h3><%=g.getGeneroComprado()%></h3>
                <%}%>
            </div>
        </div>

    </div>

    <section class="section faq">
        <div class="row">

            <% if (listaComprados.size()==0) { %>

            <div class="col-lg-12">
                <br><br>
                <div class="col text-center">
                    <div class="disponibleUsuario">
                        <div class="col text-center" style="max-width: 1000px;">
                            <h1>AÚN NO HA COMPRADO NINGÚN JUEGO</h1>
                            <div class="spinner-border" role="status">
                                <span class="visually-hidden" >COMPRA JUEGOS ACA </span>
                            </div>
                        </div>
                        <br><br>
                        <a href="<%=request.getContextPath()%>/UsuariosJuegosServlet?a=listar" class="btn btn-primary">Compre Aquí</a>
                    </div>
                </div>
            </div>
            <%}else { %>
            <!--Todos los juegos comprados-->
            <div class="col-lg-12">
                <br><br>
                <div class="container">
                    <div class="disponibleUsuario">
                        <% for (CompraUsuario cu : listaComprados) { %>
                        <div class="card mb-10" style="max-width: 1000px;">
                            <div class="row g-0 rounded-4 border border-primary border-2 p-2">
                                <!--Imagen del juego-->
                                <div class="col-md-6 d-flex justify-content-center align-items-center">
                                    <img src="<%=cu.getJuegos().getFoto()%>" class="card-img-top" alt="...">
                                </div>
                                <!--Descripción del juego-->
                                <div class="col-md-6">
                                    <div class="card-body">
                                        <h6 class="card-title"> <%=cu.getJuegos().getNombre()%> </h6>
                                        <p class="card-text"> Descripcion : <%=cu.getJuegos().getDescripcion()%></p>
                                        <p class="card-text"> Precio : $ <%=cu.getPrecioCompra()%> </p>
                                        <p class="fw-bold"> Estado :  <%=cu.getEstados().getEstados()%> </p>
                                        <!--<a href="<%=request.getContextPath()%>/JuegosServlet?a=verjuego&id=<%=cu.getJuegos().getIdJuegos()%>" class="btn btn-dark">Ver juego</a>-->
                                </div>
                            </div>
                        </div>
                        <%}%>
                    </div>
                </div>
            </div>

            <!--Genero más comprado-->
            <div class="col-lg-4">


                <!--<div class="row g-0">
                    <div class="col-md-12 bg-primary border rounded-4 p-4">
                        <div class="text-light text-center">
                            <h4>Recomendaciones</h4>
                        </div>

                        <div class="d-flex justify-content-center align-items-center">
                            <img src="img/usuario/snipeer.jpg" width="50%" alt="">
                        </div>
                    </div>
                </div>-->
            </div>
            <%}%>

        </div>
    </section>
</main>

<br>
<!-- ======= Footer ======= -->
<jsp:include page="/includes/footer.jsp">
    <jsp:param name="title" value=""/>
</jsp:include>

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
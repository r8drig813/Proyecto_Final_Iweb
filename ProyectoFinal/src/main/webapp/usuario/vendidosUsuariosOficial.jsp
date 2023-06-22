<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.proyecto_iweb.models.beans.Juegos" %>
<%@ page import="com.example.proyecto_iweb.models.beans.Cuentas" %>
<%@ page import="com.example.proyecto_iweb.models.beans.VentaUsuario" %>
<%@ page import="com.example.proyecto_iweb.models.beans.CompraUsuario" %>
<%@ page import="com.example.proyecto_iweb.models.dtos.GeneroMasComprado" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<%
    ArrayList<VentaUsuario> listaVendidos = (ArrayList<VentaUsuario>) request.getAttribute("lista2");
%>

<jsp:useBean id="usuarioLog" scope="session" type="com.example.proyecto_iweb.models.beans.Cuentas"
             class="com.example.proyecto_iweb.models.beans.Cuentas"/>

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
            <%if(listaVendidos.isEmpty()){%>

            <div class="col-lg-12">
                <br><br>
                <div class="col text-center">
                    <div class="disponibleUsuario">
                        <div class="col text-center" style="max-width: 1000px;">
                            <h1>AÚN NO HA VENDIDO NINGÚN JUEGO</h1>
                            <div class="spinner-border" role="status">
                                <span class="visually-hidden" >VENDE JUEGOS ACA </span>
                            </div>
                        </div>
                        <br><br>
                        <a href="<%=request.getContextPath()%>/UsuariosJuegosServlet?a=listar1" class="btn btn-primary">Venda Aquí</a>
                    </div>
                </div>
            </div>


            <%}else{%>
            <div class="col-lg-12" >
                <br><br>
                <table class="table table-stripped" >
                    <thead>
                    <tr>
                        <th class="col text-center">Nombre </th>
                        <th class="col text-center">Precio de Venta </th>
                        <th class="col text-center">Estado  </th>
                        <th class="col text-center">Opciones </th>
                    </tr>
                    </thead>
                    <tbody>
                    <% for (VentaUsuario vu : listaVendidos) { %>
                    <tr>
                        <td class="col text-center"><%=vu.getJuegos().getNombre()%>
                        </td>
                        <td class="col text-center"><%=vu.getPrecioVenta()%>
                        </td>
                        <td class="col text-center"><%=vu.getEstados().getEstados()%>
                        </td>
                        <td class="col text-center"> <% if (vu.getEstados().getEstados().equals("pendiente")){ %>
                            <a onclick="return confirm('¿ Estas de retirar tu propuesta ?')" class="btn btn-primary"
                               href="<%=request.getContextPath()%>/UsuariosJuegosServlet?a=actualizarVenta&id=<%=vu.getIdVenta()%>">Retirar Propuesta</a>
                            <%}%>

                            <% if (vu.getEstados().getEstados().equals("aceptado")){ %>
                            <a onclick="return confirm('¿ Ya vendio el juego pero esta seguro de Eliminar ?')" class="btn btn-primary"
                               href="<%=request.getContextPath()%>/UsuariosJuegosServlet?a=eliminarVenta&id=<%=vu.getIdVenta()%>">Eliminar Propuesta</a>
                            <%}%>
                            <% if (vu.getEstados().getEstados().equals("no aceptado")){ %>
                            <a href="<%=request.getContextPath()%>/UsuariosJuegosServlet?a=verjuego&id=<%=vu.getIdVenta()%>" class="btn btn-dark" data-bs-toggle="modal" data-bs-target="#exampleModal">Ver Precio Sugerido</a>
                            <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h1 class="modal-title fs-5" id="exampleModalLabel">¿Porque el juego no fue aceptado?</h1>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                        </div>
                                        <div class="modal-body">
                                            <div class="form-floating">
                                                <p><%=vu.getMensajeAdmin()%></p>
                                            </div>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Regresar</button>
                                            <a href="<%=request.getContextPath()%>/UsuariosJuegosServlet?a=verPrecio&id=<%=vu.getIdVenta()%>" class="btn btn-dark">Modificar Precio</a>
                                            <!--<button type="button" class="btn btn-primary" data-bs-dismiss="modal">Modificar Precio</button> -->
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <a onclick="return confirm('¿ Estas de retirar tu propuesta ?')" class="btn btn-primary"
                               href="<%=request.getContextPath()%>/UsuariosJuegosServlet?a=actualizarVenta&id=<%=vu.getIdVenta()%>">Retirar Propuesta</a>
                            <%}%>

                            <% if (vu.getEstados().getEstados().equals("rechazado")){ %>
                            <a href="<%=request.getContextPath()%>/UsuariosJuegosServlet?a=listarNotificaciones" class="btn btn-dark" data-bs-toggle="modal" data-bs-target="#exampleModal2" >Ver Motivo</a>
                            <div class="modal fade" id="exampleModal2" tabindex="-1" aria-labelledby="exampleModalLabel2" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h1 class="modal-title fs-5" id="exampleModalLabel2">¿Porque el juego fue rechazado?</h1>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                        </div>
                                        <div class="modal-body">
                                            <div class="form-floating">
                                                <p><%=vu.getMensajeAdmin()%></p>
                                            </div>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Regresar</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <a onclick="return confirm('¿ Estas de retirar tu propuesta ?')" class="btn btn-primary"
                               href="<%=request.getContextPath()%>/UsuariosJuegosServlet?a=actualizarVenta&id=<%=vu.getIdVenta()%>">Retirar Propuesta</a>
                            <%}%>

                            <% if (vu.getEstados().getEstados().equals("retirado")){ %>
                            <a onclick="return confirm('¿ Estas seguro de Eliminar ?')" class="btn btn-primary"
                               href="<%=request.getContextPath()%>/UsuariosJuegosServlet?a=eliminarVenta&id=<%=vu.getIdVenta()%>">Eliminar Propuesta</a>
                            <%}%>
                    </tr>
                    <% } %>
                    </tbody>
                </table>
            </div>
            <%}%>

        </div>
    </section>

</main><!-- End #main -->


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

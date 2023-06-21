
<%@ page import="com.example.proyecto_iweb.models.beans.Juegos" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.ArrayList" %>

<% ArrayList<Juegos> lista = (ArrayList<Juegos>) request.getAttribute("lista"); %>

<!DOCTYPE html>
<html lang="en">

<!-- ======= Head ======= -->
<jsp:include page="/includes/head.jsp">
    <jsp:param name="title" value="Nueva lista"/>
</jsp:include>

<body>
<!-- ======= Header ======= -->
<jsp:include page="/includes/headerAdmin.jsp">
    <jsp:param name="title" value=""/>
</jsp:include>

<!-- ======= Asidebar ======= -->
<jsp:include page="/includes/asideAdmin.jsp">
    <jsp:param name="title" value="disponibles"/>
</jsp:include>

<!-- ======= Main ======= -->
<main id="main" class="main">
    <div class="row">
        <div class="col-md-1"></div>
        <div class="col-md-10">
            <% for (Juegos j : lista) { %>
            <div class="card mb-10" style="max-width: 1500px;">
                <div class="row g-0">
                    <div class="col-md-5">
                        <img src="<%=j.getFoto()%>" class="img-fluid rounded-start" alt="...">
                    </div>
                    <div class="col-md-7">
                        <div class="card-body">
                            <h5 class="card-title"><%=j.getNombre()%></h5>
                            <p class="card-text"><%=j.getDescripcion()%></p>
                            <p class="card-text">Precio: <%=j.getPrecio()%></p>
                            <a href="<%=request.getContextPath()%>/AdminJuegosServlet?a=editarJuego&id=<%=j.getIdJuegos()%>" class="btn btn-primary ml-5">Editar</a>
                            <a onclick="return confirm('Esta seguro de desea eliminar el juego')" class="btn btn-danger"
                               href="<%=request.getContextPath()%>/AdminJuegosServlet?a=deshabilitarJuego&id=<%=j.getIdJuegos()%>">Eliminar</a>
                        </div>

                        <br>
                    </div>
                </div>
            </div>
            <% } %>
        </div>
        <div class="col-md-1">
            <a href="<%=request.getContextPath()%>/AdminJuegosServlet?a=crearJuego" class="btn btn-danger">+</a>
            <p>Añadir juego</p>
        </div>
    </div>

</main>


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
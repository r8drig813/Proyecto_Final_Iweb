<%--
  Created by IntelliJ IDEA.
  User: oscar
  Date: 21/06/2023
  Time: 08:42
  To change this template use File | Settings | File Templates.
--%>

<%@ page import="com.example.proyecto_iweb.models.beans.Cuentas" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.proyecto_iweb.models.beans.VentaUsuario" %>

<% ArrayList<VentaUsuario> lista = (ArrayList<VentaUsuario>) request.getAttribute("lista"); %>

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
  <jsp:param name="title" value="reservasYcomprados"/>
</jsp:include>

<!-- ======= Main ======= -->
<main id="main" class="main">

  <div class="pagetitle">
    <h1>Juegos Propuestos</h1>
  </div>

  <div class="container">
    <table id="example" class="table table-striped" style="width:100%">
      <thead>
      <tr>
        <th>Proveedor</th>
        <th>Nombre juego</th>
        <th>Precio</th>
        <th>Estado</th>
        <th>Observación</th>
        <th>Opciones</th>
      </tr>
      </thead>
      <tbody>
      <% for (VentaUsuario v : lista) { %>
      <tr>
        <td><%=v.getUsuario().getNombre()%></td>
        <td><%=v.getJuegos().getNombre()%></td>
        <td><%=v.getPrecioVenta()%></td>
        <td><%=v.getEstados().getEstados()%></td>
        <td><%=v.getMensajeAdmin()%></td>
        <td>
          <div class="d-flex justify-content-center">
            <a href="<%=request.getContextPath()%>/AdminServlet?a=verPerfil" class="btn btn-primary m-1"><i class="bi bi-person-circle"></i></a>
            <a href="#" class="btn btn-success m-1"><i class="bi bi-check-circle-fill"></i></a>
            <a onclick="return confirm('¿Está seguro de rechazar al usuario:?')" class="btn btn-danger m-1"
               href="#"><i class="bi bi-x-circle-fill"></i></a>

          </div>
        </td>
      </tr>
      <% } %>

      </tbody>
      <tfoot>
      <tr>
        <th>Name de usuario</th>
        <th>Dirección</th>
        <th>Nickname</th>
        <th>Estado</th>
        <th>Observación</th>
        <th>Opciones</th>
      </tr>
      </tfoot>
    </table>
  </div>

</main>

<!-- ======= Footer ======= -->
<jsp:include page="/includes/footer.jsp">
  <jsp:param name="title" value=""/>
</jsp:include>

<a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i
        class="bi bi-arrow-up-short"></i></a>

<!-- Template Main JS File -->
<script src="assets/js/main.js"></script>
<script src="assets/js/lista.js"></script>
</body>
</html>


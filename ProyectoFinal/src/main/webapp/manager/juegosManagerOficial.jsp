<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.proyecto_iweb.models.beans.Juegos" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% ArrayList<Juegos> listaJuegos = (ArrayList<Juegos>) request.getAttribute("listaManager");
%>

<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>JA-VAGOS</title>
  <meta content="" name="description">
  <meta content="" name="keywords">
  <link rel="icon" href="pestania.png">

  <!-- Estilos CSS -->
  <!--Importando estilos CSS-->
  <link rel="stylesheet" href="estilos/usuario/filtros.css">
  <link rel="stylesheet" href="estilos/usuario.css">

  <!-- Google Fonts -->
  <link href="https://fonts.gstatic.com" rel="preconnect">
  <link
          href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
          rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="assets/css/style.css" rel="stylesheet">

</head>

<body>

<!-- ======= Header ======= -->
<header id="header" class="header fixed-top d-flex align-items-center bg-warning">

  <div class="d-flex align-items-center justify-content-between">
    <a href="indexManagerOficial.html" class="logo d-flex align-items-center">
      <img src="logo.png" alt="">
      <span class="d-none d-lg-block">JA-VAGOS</span>
    </a>
    <i class="bi bi-list toggle-sidebar-btn"></i>
  </div>

  <div class="search-bar">
    <form class="search-form d-flex align-items-center" method="POST" action="#">
      <input type="text" name="query" placeholder="Search" title="Enter search keyword">
      <button type="submit" title="Search"><i class="bi bi-search"></i></button>
    </form>
  </div><!-- End Search Bar -->

  <nav class="header-nav ms-auto">
    <ul class="d-flex align-items-center">

      <!--BUSCADOR -->
      <li class="nav-item d-block d-lg-none">
        <a class="nav-link nav-icon search-bar-toggle " href="#">
          <i class="bi bi-search"></i>
        </a>
      </li><!-- End Search Icon-->

      <!-- ICONO DE TIENDA Y NOTIFICACIÓN-->

      <li class="nav-item dropdown">

        <a class="nav-link nav-icon" href="#" data-bs-toggle="dropdown">
          <i class="bi bi-chat-left-text"></i>
          <span class="badge bg-danger badge-number">3</span>
        </a><!-- End Messages Icon -->

        <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow messages">
          <li class="dropdown-header">
            Tienes 3 mensajes nuevos ! ! !
            <!--
            <a href="#"><span class="badge rounded-pill bg-primary p-2 ms-2">Ver todo</span></a>
            -->
          </li>
          <li>
            <hr class="dropdown-divider">
          </li>

          <li class="message-item">
            <a href="#">
              <img src="assets/img/messages-1.jpg" alt="" class="rounded-circle">
              <div>
                <h4>Maria Hudson</h4>
                <p>Velit asperiores et ducimus soluta repudiandae labore officia est ut...</p>
                <p>4 hrs. ago</p>
              </div>
            </a>
          </li>
          <li>
            <hr class="dropdown-divider">
          </li>

          <li class="message-item">
            <a href="#">
              <img src="assets/img/messages-2.jpg" alt="" class="rounded-circle">
              <div>
                <h4>Anna Nelson</h4>
                <p>Velit asperiores et ducimus soluta repudiandae labore officia est ut...</p>
                <p>6 hrs. ago</p>
              </div>
            </a>
          </li>
          <li>
            <hr class="dropdown-divider">
          </li>

          <li class="message-item">
            <a href="#">
              <img src="assets/img/messages-3.jpg" alt="" class="rounded-circle">
              <div>
                <h4>David Muldon</h4>
                <p>Velit asperiores et ducimus soluta repudiandae labore officia est ut...</p>
                <p>8 hrs. ago</p>
              </div>
            </a>
          </li>
          <li>
            <hr class="dropdown-divider">
          </li>

          <li class="dropdown-footer">
            <a href="notificacionesManagerOficial.html">Ver todo los mensajes</a>
          </li>

        </ul><!-- End Messages Dropdown Items -->

      </li><!-- End Messages Nav -->



      <li class="nav-item dropdown pe-3">

        <a class="nav-link nav-profile d-flex align-items-center pe-0" href="#" data-bs-toggle="dropdown">
          <img src="/img/manager/manager1.jpg" alt="Profile" class="rounded-circle">
          <span class="d-none d-md-block dropdown-toggle ps-2">L. Stuardo</span>
        </a><!-- End Profile Iamge Icon -->

        <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow profile">
          <li class="dropdown-header">
            <h6>L. Stuardo</h6>
            <span>Manager</span>
          </li>
          <li>
            <hr class="dropdown-divider">
          </li>

          <li>
            <a class="dropdown-item d-flex align-items-center" href="miPerfilManagerOficial.html">
              <i class="bi bi-person"></i>
              <span>Mi Perfil</span>
            </a>
          </li>
          <li>
            <hr class="dropdown-divider">
          </li>

          <li>
            <a class="dropdown-item d-flex align-items-center" href="miPerfilManagerOficial.html">
              <i class="bi bi-gear"></i>
              <span>Configuración</span>
            </a>
          </li>
          <li>
            <hr class="dropdown-divider">
          </li>


          <li>
            <a class="dropdown-item d-flex align-items-center" href="cerrarLoguinOficial.html">
              <i class="bi bi-box-arrow-right"></i>
              <span>Sign Out</span>
            </a>
          </li>

        </ul><!-- End Profile Dropdown Items -->
      </li><!-- End Profile Nav -->

    </ul>
  </nav><!-- End Icons Navigation -->

</header><!-- End Header -->


<!--ACABO EL HEADER-->





<!-- ======= Sidebar ======= -->
<aside id="sidebar" class="sidebar">

  <ul class="sidebar-nav" id="sidebar-nav">

    <li class="nav-item">
      <a class="nav-link collapsed" href="<%=request.getContextPath()%>/usuarioManager">
        <i class="bi bi-person-circle"></i>
        <span>Usuarios</span>
      </a>
    </li><!-- End Dashboard Nav -->

    <li class="nav-item">
      <a class="nav-link collapsed" href="<%=request.getContextPath()%>/empleados">
        <i class="bi bi-person-bounding-box"></i>
        <span>Administradores</span>
      </a>
    </li><!-- End Profile Page Nav -->


    <li class="nav-item">
      <a class="nav-link text-warning" href="<%=request.getContextPath()%>/JuegosManager">
        <i class="bi bi-playstation text-warning"></i>
        <span>Juegos</span>
      </a>
    </li><!-- End F.A.Q Page Nav -->

  </ul>

</aside><!-- End Sidebar-->

<main id="main" class="main">

  <div class="pagetitle">
    <h1>Lista de todos los juegos del catálogo</h1>
  </div>

  <section class="section faq">
    <div class="row">
      <!-- AQUI VAN LOS FILTROS DE CATEGORIAS-->
      <div class="col-lg-12">
        <div class="filtros">

          <form action="">
            <select name="" id="">
              <option disabled selected="">Categoría</option>
              <option value="">Acción</option>
              <option value="categoriaTerrorManagerOficial.html">
                <a href="categoriaTerrorManagerOficial.html">Terror</a>
              </option>
              <option value="">Arcade</option>
              <option value="">Deporte</option>
            </select>
          </form>

          <form action="">
            <select name="" id="">
              <option disabled selected="">Consola</option>
              <option value="">X BOX</option>
              <option value="">Play Station</option>
              <option value="">PC</option>
            </select>
          </form>



          <form action="">
            <select name="" id="">
              <option disabled selected="">TOP</option>
              <option value="">Menos vendidos</option>
              <option value="">TOP5</option>

            </select>
          </form>

        </div>
      </div>

      <div class="col-lg-12">

        <!--DENTRO DE UN DIV-->
        <div class="container">
          <div class="row">
            <% for (Juegos j : listaJuegos) { %>
            <div class="col-4">
              <div>
                <div class="card" style="width: 18rem; height: 100%;">
                  <img src="<%=j.getFoto()%>" class="card-img-top" alt="...">
                  <div class="card-body">
                    <h5 class="card-title"><%=j.getNombre()%></h5>
                    <a onclick="return confirm('Esta seguro de desea retirar el juego')" class="btn btn-danger"
                       href="<%=request.getContextPath()%>/JuegosManager?a=eliminar&id=<%=j.getIdJuegos()%>">Retirar juego</a>
                  </div>
                </div>
              </div>
            </div>
            <% } %>
          </div>



          <!--MODAL DE ADVERTENCIA PARA RETIRAR JUEGO DEL CATALOGO-->
          <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
              <div class="modal-content">
                <div class="modal-header">
                  <h1 class="modal-title fs-5" id="exampleModalLabel">Alerta de juego</h1>
                  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                  <p>¿Está seguro de eliminar el juego del catálogo?</p>
                </div>
                <div class="modal-footer">
                  <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Cancelar</button>
                  <button type="button" class="btn btn-primary">Sí, eliminar</button>
                </div>
              </div>
            </div>
          </div>

        </div>

      </div>

      <div class="col-lg-12">

        <!--DENTRO DE UN DIV-->

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
<script src="assets/vendor/apexcharts/apexcharts.min.js"></script>
<script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="assets/vendor/chart.js/chart.umd.js"></script>
<script src="assets/vendor/echarts/echarts.min.js"></script>
<script src="assets/vendor/quill/quill.min.js"></script>
<script src="assets/vendor/simple-datatables/simple-datatables.js"></script>
<script src="assets/vendor/tinymce/tinymce.min.js"></script>
<script src="assets/vendor/php-email-form/validate.js"></script>


<!-- Template Main JS File -->
<script src="assets/js/main.js"></script>
<script src="assets/js/lista.js"></script>

</body>

</html>

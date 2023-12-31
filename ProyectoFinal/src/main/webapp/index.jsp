<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>JA_VAGOS</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Estilos CSS -->
  <!--Importando estilos CSS-->
  <link rel="stylesheet" href="estilos/usuario/filtros.css">
  <link rel="stylesheet" href="estilos/usuario.css">

  <!-- Favicons -->
  <link href="assets/img/favicon.png" rel="icon">
  <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.gstatic.com" rel="preconnect">
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="assets/vendor/quill/quill.snow.css" rel="stylesheet">
  <link href="assets/vendor/quill/quill.bubble.css" rel="stylesheet">
  <link href="assets/vendor/remixicon/remixicon.css" rel="stylesheet">
  <link href="assets/vendor/simple-datatables/style.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="assets/css/style.css" rel="stylesheet">

  <!-- =======================================================
  * Template Name: NiceAdmin
  * Updated: Mar 09 2023 with Bootstrap v5.2.3
  * Template URL: https://bootstrapmade.com/nice-admin-bootstrap-admin-html-template/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
</head>

<body>

<!-- ======= Header ======= -->
<header id="header" class="header fixed-top d-flex align-items-center bg-dark">

  <div class="d-flex align-items-center justify-content-between">
    <a href="index.html" class="logo d-flex align-items-center">
      <img src="assets/img/logo.png" alt="">
      <span class="d-none d-lg-block text-light">JA-VAGOS</span>
    </a>
    <i class="bi bi-list toggle-sidebar-btn text-light"></i>
  </div><!-- End Logo -->

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
        <a class="nav-link nav-icon search-bar-toggle text-light" href="#">
          <i class="bi bi-search"></i>
        </a>
      </li><!-- End Search Icon-->

      <!-- ICONO DE TIENDA Y NOTIFICACIÓN-->
      <li class="nav-item dropdown">

        <a class="nav-link nav-icon" href="#" data-bs-toggle="dropdown">
          <i class="bi bi-cart text-light"></i>
          <span class="badge bg-primary badge-number"></span>
        </a><!-- End Notification Icon -->


      </li><!-- End Notification Nav -->

      <li class="nav-item dropdown">

        <a class="nav-link nav-icon" href="#" data-bs-toggle="dropdown">
          <i class="bi bi-chat-left-text text-light"></i>
          <span class="badge bg-success badge-number"></span>
        </a><!-- End Messages Icon -->



      </li><!-- End Messages Nav -->










      <li class="nav-item dropdown pe-3">

        <a class="nav-link nav-profile d-flex align-items-center pe-0" href="#" data-bs-toggle="dropdown">
          <img src="user.png" alt="Profile" class="rounded-circle">
          <span class="d-none d-md-block ps-2 text-light">Logueate</span>
        </a><!-- End Profile Iamge Icon -->


      </li><!-- End Profile Nav -->

    </ul>
  </nav><!-- End Icons Navigation -->

</header><!-- End Header -->


<!--ACABO EL HEADER-->





<!-- ======= Sidebar ======= -->
<aside id="sidebar" class="sidebar">

  <ul class="sidebar-nav" id="sidebar-nav">

    <li class="nav-item">
      <a class="nav-link" href="#">
        <i class="bi bi-grid"></i>
        <span>Disponibles</span>
      </a>
    </li><!-- End Dashboard Nav -->

    <li class="nav-item">
      <a class="nav-link collapsed" href="#">
        <i class="bi bi-arrow-up-square"></i>
        <span>Postear</span>
      </a>
    </li><!-- End Profile Page Nav -->


    <li class="nav-item">
      <a class="nav-link collapsed" href="#">
        <i class="bi bi-bag"></i>
        <span>Vendidos</span>
      </a>
    </li><!-- End F.A.Q Page Nav -->

    <li class="nav-item">
      <a class="nav-link collapsed" href="#">
        <i class="bi bi-shop"></i>
        <span>Comprados</span>
      </a>
    </li><!-- End Contact Page Nav -->

  </ul>

</aside><!-- End Sidebar-->

<main id="main" class="main">

  <div class="pagetitle">

  </div><!-- End Page Title -->

  <section class="section faq">
    <div class="row">
      <!-- AQUI VAN LOS FILTROS DE CATEGORIAS-->
      <div class="col-lg-12">
        <div class="filtros">

          <form action="">
            <select name="" id="">
              <option disabled selected="">Categoría</option>
              <option value="">Acción</option>
              <option value="">Terror</option>
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
              <option disabled selected="">Precio</option>
              <option value="">0-50</option>
              <option value="">50-100</option>
              <option value="">100-150</option>
            </select>
          </form>
          <div class="botonOfertas">
            <button type="button" class="btn btn-light border rounded-3">Ofertas</button>
          </div>


        </div>
      </div>

      <div class="col-lg-12">

        <!--DENTRO DE UN DIV-->
        <div class="container">
          <div class="disponibleUsuario">
            <div class="card" style="width: 18rem; height: 100%;">
              <img src="juego.jpg" class="card-img-top" alt="...">
              <div class="card-body">
                <h5 class="card-title">Card title</h5>
                <a href="#" class="btn btn-primary">Ver juego</a>
              </div>
            </div>

            <div class="card" style="width: 18rem; height: 100%;">
              <img src="juego.jpg" class="card-img-top" alt="...">
              <div class="card-body">
                <h5 class="card-title">Card title</h5>
                <a href="#" class="btn btn-primary">Ver juego</a>
              </div>
            </div>

            <div class="card" style="width: 18rem; height: 100%;">
              <img src="juego.jpg" class="card-img-top" alt="...">
              <div class="card-body">
                <h5 class="card-title">Card title</h5>
                <a href="#" class="btn btn-primary">Ver juego</a>
              </div>
            </div>
          </div>

          <div class="disponibleUsuario">
            <div class="card" style="width: 18rem; height: 100%;">
              <img src="juego.jpg" class="card-img-top" alt="...">
              <div class="card-body">
                <h5 class="card-title">Card title</h5>
                <a href="#" class="btn btn-primary">Ver juego</a>
              </div>
            </div>

            <div class="card" style="width: 18rem; height: 100%;">
              <img src="juego.jpg" class="card-img-top" alt="...">
              <div class="card-body">
                <h5 class="card-title">Card title</h5>
                <a href="#" class="btn btn-primary">Ver juego</a>
              </div>
            </div>

            <div class="card" style="width: 18rem; height: 100%;">
              <img src="juego.jpg" class="card-img-top" alt="...">
              <div class="card-body">
                <h5 class="card-title">Card title</h5>
                <a href="#" class="btn btn-primary">Ver juego</a>
              </div>
            </div>
          </div>

          <div class="disponibleUsuario">
            <div class="card" style="width: 18rem; height: 100%;">
              <img src="juego.jpg" class="card-img-top" alt="...">
              <div class="card-body">
                <h5 class="card-title">Card title</h5>
                <a href="#" class="btn btn-primary">Ver juego</a>
              </div>
            </div>

            <div class="card" style="width: 18rem; height: 100%;">
              <img src="juego.jpg" class="card-img-top" alt="...">
              <div class="card-body">
                <h5 class="card-title">Card title</h5>
                <a href="#" class="btn btn-primary">Ver juego</a>
              </div>
            </div>

            <div class="card" style="width: 18rem; height: 100%;">
              <img src="juego.jpg" class="card-img-top" alt="...">
              <div class="card-body">
                <h5 class="card-title">Card title</h5>
                <a href="#" class="btn btn-primary">Ver juego</a>
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
<footer id="footer" class="footer bg-dark-light">
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

<a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>


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

</body>

</html>


<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

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
<header id="header" class="header fixed-top d-flex align-items-center bg-danger">

    <div class="d-flex align-items-center justify-content-between">
        <a href="#" class="logo d-flex align-items-center">
            <img src="/logoUsuario.png" alt="">
            <span class="d-none d-lg-block text-light">JA-VAGOS</span>
        </a>
    </div>

    <div class="search-bar">
        <form class="search-form d-flex align-items-center" method="POST" action="#">
            <input type="text" name="query" placeholder="Search" title="Enter search keyword">
            <button type="submit" title="Search"><i class="bi bi-search"></i></button>
        </form>
    </div>

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
                    <i class="bi bi-chat-left-text text-light"></i>
                    <span class="badge bg-success badge-number">2</span>
                </a><!-- End Messages Icon -->

                <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow messages">
                    <li class="dropdown-header">
                        Tienes 2 mensajes nuevos ! ! !
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

                    <li>
                        <hr class="dropdown-divider">
                    </li>

                    <li class="dropdown-footer">
                        <a href="notificacionesAdminOficial.html">Ver todos los mensajes</a>
                    </li>

                </ul><!-- End Messages Dropdown Items -->

            </li><!-- End Messages Nav -->










            <li class="nav-item dropdown pe-3">

                <a class="nav-link nav-profile d-flex align-items-center pe-0" href="#" data-bs-toggle="dropdown">
                    <img src="/img/administrador/admin1.png" alt="Profile" class="rounded-circle">
                    <span class="d-none d-md-block dropdown-toggle ps-2 text-light">B. Chavez</span>
                </a><!-- End Profile Iamge Icon -->

                <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow profile">
                    <li class="dropdown-header">
                        <h6>B. Chavez</h6>
                        <span>Administrador</span>
                    </li>
                    <li>
                        <hr class="dropdown-divider">
                    </li>

                    <li>
                        <a class="dropdown-item d-flex align-items-center" href="miPerfilAdminOficial.html">
                            <i class="bi bi-person"></i>
                            <span>Mi Perfil</span>
                        </a>
                    </li>
                    <li>
                        <hr class="dropdown-divider">
                    </li>

                    <li>
                        <a class="dropdown-item d-flex align-items-center" href="miPerfilAdminOficial.html">
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
            <a class="nav-link text-danger" href="#">
                <i class="bi bi-grid text-danger"></i>
                <span>Disponibles</span>
            </a>
        </li>

        <li class="nav-item">
            <a class="nav-link collapsed" href="<%=request.getContextPath()%>/AdminServlet">
                <i class="bi bi-arrow-up-square"></i>
                <span>Reservas y juegos comprados</span>
            </a>
        </li>



        <li class="nav-item">
            <a class="nav-link collapsed" href="<%=request.getContextPath()%>/AdminJuegosServlet?a=Ofertas">
                <i class="bi bi-exclamation-square"></i>
                <span>Ofertas</span>
            </a>
        </li><!-- End Contact Page Nav -->

        <li class="nav-item">
            <a class="nav-link collapsed" data-bs-target="#icons-nav" data-bs-toggle="collapse" href="#">
                <i class="bi bi-bag"></i><span>Juegos vendidos</span><i class="bi bi-chevron-down ms-auto"></i>
            </a>
            <ul id="icons-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
                <li>
                    <a href="juegosNuevosAdminOficial.html">
                        <i class="bi bi-circle"></i><span>Nuevo</span>
                    </a>
                </li>
                <li>
                    <a href="juegosExistentesAdminOficial.html">
                        <i class="bi bi-circle"></i><span>Existente</span>
                    </a>
                </li>
                <li>
                    <a href="juegosColaAdminOficial.html">
                        <i class="bi bi-circle"></i><span>Cola</span>
                    </a>
                </li>
            </ul>
        </li><!-- End Icons Nav -->

    </ul>


</aside><!-- End Sidebar-->


<main id="main" class="main">
    <div class="col-md-1"></div>

    <div class="col-md-10 row d-flex justify-content-center border border-primary rounded-4">

        <div class="col-lg-4 m-4">
            <!--VA IR LA FOTO-->
            <div class="col-auto">
                <div class="col-md-9 mx-auto">
                    <img src="user.png" alt="" class="img-fluid mb-4">
                </div>


                <h5 class="text-center">Datos del usuario</h5>
                <table class="table table-bordered">
                    <thead>
                    <tr>

                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td>Nombre</td>
                        <td>Nombre completo</td>
                    </tr>
                    <tr>
                        <td>Direccion</td>
                        <td>Av. Universitaria 1919</td>
                    </tr>
                    <tr>
                        <td>Correo</td>
                        <td>Va_vagos@pucp.edu.pe</td>
                    </tr>
                    <tr>
                        <td>Celular</td>
                        <td>987654321</td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>


        <div class="col-lg-6 m-2">
            <!--VA IR LA INFORMACIÓN-->
            <div class="row-lg-6">
                <h5 class="text-center">Estadisticas del usuario</h5>
                <table class="table table-bordered">
                    <thead>
                    <tr>

                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td>Cant. juegos comprados</td>
                        <td>23</td>
                    </tr>
                    <tr>
                        <td>Cant. juegos vendidos</td>
                        <td>2</td>
                    </tr>
                    <tr>
                        <td>Cant. juegos pendientes</td>
                        <td>13</td>
                    </tr>
                    <tr>
                        <td>Dinero gastado</td>
                        <td>$230</td>
                    </tr>
                    </tbody>
                </table>
            </div>


            <div class="row">
                <h5 class="text-center">Ubicación del usuario</h5>
                <iframe
                        src="https://www.google.com/maps/embed?pb=!1m14!1m12!1m3!1d7803.090718696196!2d-77.09065694650349!3d-12.074770906006872!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!5e0!3m2!1ses-419!2spe!4v1682624518105!5m2!1ses-419!2spe"
                        width="400" height="300" style="border:0;" allowfullscreen="" loading="lazy"
                        referrerpolicy="no-referrer-when-downgrade"></iframe>
                <br>
            </div>
            <br>
        </div>

    </div>

    <div class="col-md-1"></div>
    <br>
    <a href="<%=request.getContextPath()%>/AdminServlet" class="btn btn-danger">Regresar</a>

</main>


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


<!-- Template Main JS File -->
<script src="assets/js/main.js"></script>


</body>
</html>

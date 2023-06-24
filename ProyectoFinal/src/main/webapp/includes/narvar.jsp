<%@ page import="com.example.proyecto_iweb.models.beans.VentaUsuario" %>
<% String currentPage = request.getParameter("currentPage"); %>
<jsp:useBean id="usuarioLog" scope="session" type="com.example.proyecto_iweb.models.beans.Cuentas"
             class="com.example.proyecto_iweb.models.beans.Cuentas"/>

<%if(usuarioLog.getIdRol()==0) { %>
<header id="header" class="header fixed-top d-flex align-items-center bg-black">
  <div class="d-flex align-items-center justify-content-between">
    <a href="<%=request.getContextPath()%>/UsuariosJuegosServlet?a=listar" class="logo d-flex align-items-center">
      <img src="img/sistema/logoUsuario.png" alt="">
      <span class="d-none d-lg-block text-light">JA-VAGOS</span>
    </a>
    <i class="bi bi-list toggle-sidebar-btn text-light"></i>
  </div>

  <div class="search-bar mt-3">
    <form class="search-form d-flex align-items-center" method="post" action="<%=request.getContextPath()%>/UsuariosJuegosServlet?p=b1">
      <input type="text" name="buscador" placeholder="Search" title="Enter search keyword">
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
      </li>


      <li class="nav-item dropdown pe-3">

        <div class="form-inline font-italic my-2 my-lg-0">
          <% if (usuarioLog.getIdCuentas() > 0) { //esto logueado %>
          <span></span>
          <!-- ICONO DE TIENDA Y NOTIFICACI?N-->

          <li class="nav-item dropdown">
            <a class="nav-link nav-icon" href="#" data-bs-toggle="dropdown">
              <i class="bi bi-chat-left-text text-light"></i>
              <span class="badge bg-danger badge-number">2</span>
            </a>

            <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow messages">
              <li class="dropdown-header">
                Tienes 2 mensajes nuevos ! ! !

                <a href="#"><span class="badge rounded-pill bg-primary p-2 ms-2">Ver todo</span></a>

              </li>
              <li>
                <hr class="dropdown-divider">
              </li>

              <li class="dropdown-footer">
                <a  href="<%=request.getContextPath()%>/UsuariosJuegosServlet?a=listarNotificaciones&id=<%=usuarioLog.getIdCuentas()%>">Ver todo los mensajes</a>
              </li>

            </ul>

          </li>
          <a class="nav-link nav-profile d-flex align-items-center pe-0" href="#" data-bs-toggle="dropdown">
            <img src="img/usuario/usuario1.webp" alt="Profile" class="rounded-circle">
            <span class="d-none d-md-block dropdown-toggle ps-2 text-light"><%=usuarioLog.getNombre() + " " + usuarioLog.getApellido()%>  </span>
          </a><!-- End Profile Iamge Icon -->

          <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow profile">
            <li class="dropdown-header">
              <h6><%=usuarioLog.getNombre() + " " + usuarioLog.getApellido()%> </h6>
              <span>Usuario</span>
            </li>
            <li>
              <hr class="dropdown-divider">
            </li>

            <li>
              <a class="dropdown-item d-flex align-items-center" href="<%=request.getContextPath()%>/UsuariosJuegosServlet?a=perfil">
                <i class="bi bi-person"></i>
                <span>Mi Perfil</span>

              </a>
            </li>
            <li>
              <hr class="dropdown-divider">
            </li>

            <li>
              <a class="dropdown-item d-flex align-items-center" href="#profile-edit">
                <i class="bi bi-gear"></i>
                <span>Configuraci?n</span>
              </a>
            </li>
            <li>
              <hr class="dropdown-divider">
            </li>

            <li>
              <a class="dropdown-item d-flex align-items-center" href="<%=request.getContextPath()%>/login?action=logout">
                <i class="bi bi-box-arrow-right"></i>
                <span>Sign Out</span>
              </a>
            </li>
              <% } else { //no estoy loggedIn %>
            <div>
              <a class="nav-link" style="color: white;" href="<%=request.getContextPath()%>/UsuariosCuentasServlet?a=agregar">
                Crear cuenta
              </a>
              <a class="nav-link" style="color: white;" href="<%=request.getContextPath()%>/login">
                Iniciar Sesi�n
              </a>
            </div>
              <% } %>
        </div>
    </ul>
    </li>
    </ul>
  </nav>
</header>

<aside id="sidebar" class="sidebar">

  <ul class="sidebar-nav" id="sidebar-nava">

    <li class="nav-item">
      <a class="nav-link collapsed<%=currentPage.equals("listar") ? "active" : ""%>"  href="<%=request.getContextPath()%>/UsuariosJuegosServlet?a=listar">
        <i class="bi bi-grid"></i>
        <span>Disponibles</span>
      </a>
    </li>

    <li class="nav-item">
      <a class="nav-link collapsed<%=currentPage.equals("postear") ? "active" : ""%> " href="<%=request.getContextPath()%>/login">
        <i class="bi bi-arrow-up-square"></i>
        <span>Postear</span>
      </a>
    </li>


    <li class="nav-item">
      <a class="nav-link  collapsed<%=currentPage.equals("vendidos") ? "active" : ""%> " href="<%=request.getContextPath()%>/loginPage.jsp">
        <i class="bi bi-bag"></i>
        <span>Vendidos</span>
      </a>
    </li>

    <li class="nav-item">
      <a class="nav-link collapsed<%=currentPage.equals("comprados") ? "active" : ""%> " href="<%=request.getContextPath()%>/loginPage.jsp">
        <i class="bi bi-shop"></i>
        <span>Comprados</span>
      </a>
    </li>

    <li class="nav-item">
      <a class="nav-link collapsed<%=currentPage.equals("ofertas") ? "active" : ""%>" href="<%=request.getContextPath()%>/UsuariosJuegosServlet?a=ofertas">
        <i class="bi bi-grid"></i>
        <span>Ofertas</span>
      </a>
    </li>
  </ul>
</aside>
<%}%>

<!-- ======= USUARIO ======= -->
<%if(usuarioLog.getIdRol()==3) { %>
  <header id="header" class="header fixed-top d-flex align-items-center bg-primary">
    <div class="d-flex align-items-center justify-content-between">
      <a href="<%=request.getContextPath()%>/UsuariosJuegosServlet?a=listar" class="logo d-flex align-items-center">
        <img src="img/sistema/logoUsuario.png" alt="">
        <span class="d-none d-lg-block text-light">JA-VAGOS</span>
      </a>
      <i class="bi bi-list toggle-sidebar-btn text-light"></i>
    </div>

    <div class="search-bar mt-3">
      <form class="search-form d-flex align-items-center" method="post" action="<%=request.getContextPath()%>/UsuariosJuegosServlet?p=b1">
        <input type="text" name="buscador" placeholder="Search" title="Enter search keyword">
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
        </li>


        <li class="nav-item dropdown pe-3">

          <div class="form-inline font-italic my-2 my-lg-0">
            <% if (usuarioLog.getIdCuentas() > 0) { //esto logueado %>
            <span></span>
            <!-- ICONO DE TIENDA Y NOTIFICACI?N-->

            <li class="nav-item dropdown">
              <a class="nav-link nav-icon" href="<%=request.getContextPath()%>/UsuariosJuegosServlet?a=listarNotificaciones&id=<%=usuarioLog.getIdCuentas()%>" data-bs-toggle="dropdown">
                <i class="bi bi-chat-left-text text-light"></i>
                <span class="badge bg-danger badge-number"></span>
              </a>

              <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow messages">

                <li class="dropdown-footer">
                  <a  href="<%=request.getContextPath()%>/UsuariosJuegosServlet?a=listarNotificaciones&id=<%=usuarioLog.getIdCuentas()%>">Ver todo los mensajes</a>
                </li>

              </ul>

            </li>
            <a class="nav-link nav-profile d-flex align-items-center pe-0" href="#" data-bs-toggle="dropdown">
              <img src="img/usuario/usuario1.webp" alt="Profile" class="rounded-circle">
              <span class="d-none d-md-block dropdown-toggle ps-2 text-light"><%=usuarioLog.getNombre() + " " + usuarioLog.getApellido()%>  </span>
            </a><!-- End Profile Iamge Icon -->

            <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow profile">
              <li class="dropdown-header">
                <h6><%=usuarioLog.getNombre() + " " + usuarioLog.getApellido()%> </h6>
                <span>Usuario</span>
              </li>
              <li>
                <hr class="dropdown-divider">
              </li>

              <li>
                <a class="dropdown-item d-flex align-items-center" href="<%=request.getContextPath()%>/UsuariosJuegosServlet?a=perfil&id=<%=usuarioLog.getIdCuentas()%>">
                  <i class="bi bi-person"></i>
                  <span>Mi Perfil</span>

                </a>
              </li>
              <li>
                <hr class="dropdown-divider">
              </li>

              <li>
                <a class="dropdown-item d-flex align-items-center" href="<%=request.getContextPath()%>/login?action=logout">
                  <i class="bi bi-box-arrow-right"></i>
                  <span>Sign Out</span>
                </a>
              </li>
                <% } else { //no estoy loggedIn %>
              <div>
                <a class="nav-link" style="color: white;" href="<%=request.getContextPath()%>/login">
                  (Crear cuenta)
                </a>
                <a class="nav-link" style="color: white;" href="<%=request.getContextPath()%>/login">
                  (Iniciar Sesi?n)
                </a>
              </div>
                <% } %>
          </div>
      </ul>
      </li>
      </ul>
    </nav>
  </header>

  <aside id="sidebar" class="sidebar">

    <ul class="sidebar-nav" id="sidebar-nav3">

      <li class="nav-item">
        <a class="nav-link collapsed<%=currentPage.equals("listar") ? "active" : ""%>"  href="<%=request.getContextPath()%>/UsuariosJuegosServlet?a=listar">
          <i class="bi bi-grid"></i>
          <span>Disponibles</span>
        </a>
      </li>

      <li class="nav-item">
        <a class="nav-link collapsed<%=currentPage.equals("postear") ? "active" : ""%> " href="<%=request.getContextPath()%>/UsuariosJuegosServlet?a=listar1">
          <i class="bi bi-arrow-up-square"></i>
          <span>Postear</span>
        </a>
      </li>


      <li class="nav-item">
        <a class="nav-link  collapsed<%=currentPage.equals("vendidos") ? "active" : ""%> " href="<%=request.getContextPath()%>/UsuariosJuegosServlet?a=vendidos&id=<%=usuarioLog.getIdCuentas()%>">
          <i class="bi bi-bag"></i>
          <span>Vendidos</span>
        </a>
      </li>

      <li class="nav-item">
        <a class="nav-link collapsed<%=currentPage.equals("comprados") ? "active" : ""%> " href="<%=request.getContextPath()%>/UsuariosJuegosServlet?a=comprados&id=<%=usuarioLog.getIdCuentas()%>">
          <i class="bi bi-shop"></i>
          <span>Comprados</span>
        </a>
      </li>

      <li class="nav-item">
        <a class="nav-link collapsed<%=currentPage.equals("ofertas") ? "active" : ""%>" href="<%=request.getContextPath()%>/UsuariosJuegosServlet?a=ofertas">
          <i class="bi bi-grid"></i>
          <span>Ofertas</span>
        </a>
      </li>
    </ul>
  </aside>
<%}%>


<!-- ======= ADMIN ======= -->
<%if(usuarioLog.getIdRol()==2) { %>
  <header id="header" class="header fixed-top d-flex align-items-center bg-danger">

    <!-- Parte superior izquierda -->
    <div class="d-flex align-items-center justify-content-between">
      <a href="#" class="logo d-flex align-items-center">
        <img src="img/sistema/pestania.png" alt="">
        <span class="d-none d-lg-block text-light">JA-VAGOS</span>
      </a>
      <i class="bi bi-list toggle-sidebar-btn text-light"></i>
    </div>
    <!-- Parte superior medio (BUSCADOR) -->
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
        </li>


        <li class="nav-item dropdown pe-3">

          <div class="form-inline font-italic my-2 my-lg-0">
            <% if (usuarioLog.getIdCuentas() > 0) { //esto logueado %>
            <span></span>
            <!-- ICONO DE TIENDA Y NOTIFICACI?N-->

            <li class="nav-item dropdown">
              <a class="nav-link nav-icon" href="<%=request.getContextPath()%>/UsuariosJuegosServlet?a=listarNotificaciones&id=<%=usuarioLog.getIdCuentas()%>" data-bs-toggle="dropdown">
                <i class="bi bi-chat-left-text text-light"></i>
                <span class="badge bg-danger badge-number"></span>
              </a>

              <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow messages">

                <li class="dropdown-footer">
                  <a  href="<%=request.getContextPath()%>/UsuariosJuegosServlet?a=listarNotificaciones&id=<%=usuarioLog.getIdCuentas()%>">Ver todo los mensajes</a>
                </li>

              </ul>

            </li>
            <a class="nav-link nav-profile d-flex align-items-center pe-0" href="#" data-bs-toggle="dropdown">
              <img src="img/usuario/usuario1.webp" alt="Profile" class="rounded-circle">
              <span class="d-none d-md-block dropdown-toggle ps-2 text-light"><%=usuarioLog.getNombre() + " " + usuarioLog.getApellido()%>  </span>
            </a><!-- End Profile Iamge Icon -->

            <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow profile">
              <li class="dropdown-header">
                <h6><%=usuarioLog.getNombre() + " " + usuarioLog.getApellido()%> </h6>
                <span>Administrador</span>
              </li>
              <li>
                <hr class="dropdown-divider">
              </li>

              <li>
                <a class="dropdown-item d-flex align-items-center" href="<%=request.getContextPath()%>/UsuariosJuegosServlet?a=perfil&id=<%=usuarioLog.getIdCuentas()%>">
                  <i class="bi bi-person"></i>
                  <span>Mi Perfil</span>

                </a>
              </li>
              <li>
                <hr class="dropdown-divider">
              </li>

              <li>
                <a class="dropdown-item d-flex align-items-center" href="<%=request.getContextPath()%>/login?action=logout">
                  <i class="bi bi-box-arrow-right"></i>
                  <span>Sign Out</span>
                </a>
              </li>
                <% } else { //no estoy loggedIn %>
              <div>
                <a class="nav-link" style="color: white;" href="<%=request.getContextPath()%>/login">
                  (Crear cuenta)
                </a>
                <a class="nav-link" style="color: white;" href="<%=request.getContextPath()%>/login">
                  (Iniciar Sesi?n)
                </a>
              </div>
                <% } %>
          </div>
      </ul>
      </li>
      </ul>
    </nav>

  </header>


  <aside id="sidebar" class="sidebar">

    <ul class="sidebar-nav" id="sidebar-nav2">

      <li class="nav-item">
        <a class="nav-link collapsed<%=currentPage.equals("indexAdmin") ? "active" : ""%>"  href="<%=request.getContextPath()%>/AdminJuegosServlet">
          <i class="bi bi-grid text-danger"></i>
          <span>Disponibles</span>
        </a>
      </li>

      <li class="nav-item">
        <a class="nav-link collapsed<%=currentPage.equals("reservasYcomprados") ? "active" : ""%>"  href="<%=request.getContextPath()%>/AdminJuegosServlet?a=reservas">
          <i class="bi bi-arrow-up-square text-danger"></i>
          <span>Reservas o comprados</span>
        </a>
      </li>

      <li class="nav-item">
        <a class="nav-link collapsed<%=currentPage.equals("propuestos") ? "active" : ""%>"  href="<%=request.getContextPath()%>/AdminJuegosServlet?a=propuestos">
          <i class="bi bi-arrow-up-square text-danger"></i>
          <span>Juegos propuestos</span>
        </a>
      </li>



      <li class="nav-item">
        <a class="nav-link collapsed<%=currentPage.equals("ofertas") ? "active" : ""%>"  href="<%=request.getContextPath()%>/AdminJuegosServlet?a=ofertas">
          <i class="bi bi-exclamation-square text-danger"></i>
          <span>Ofertas</span>
        </a>
      </li>


      <li class="nav-item">
        <a class="nav-link collapsed" href="#">
          <i class="bi bi-bag"></i><span>Juegos vendidos</span><i class="bi bi-chevron-down ms-auto"></i>
        </a>
        <ul id="icons-nav" class="nav-content" data-bs-parent="#sidebar-nav">
          <li>
            <a href="<%=request.getContextPath()%>/AdminJuegosServlet?a=nuevos">
              <i class="bi bi-circle"></i><span>Nuevo</span>
            </a>
          </li>
          <li>
            <a href="<%=request.getContextPath()%>/AdminJuegosServlet?a=existentes">
              <i class="bi bi-circle"></i><span>Existente</span>
            </a>
          </li>
          <li>
            <a href="<%=request.getContextPath()%>/AdminJuegosServlet?a=listarcola">
              <i class="bi bi-circle"></i><span>Cola</span>
            </a>
          </li>
        </ul>
      </li>



    </ul>


  </aside>
<%}%>


<!-- ======= MANAGER ======= -->
<%if(usuarioLog.getIdRol()==1) { %>
  <header id="header" class="header fixed-top d-flex align-items-center bg-warning">

    <div class="d-flex align-items-center justify-content-between">
      <a href="indexManagerOficial.html" class="logo d-flex align-items-center">
        <img src="logo.png" alt="">
        <span class="d-none d-lg-block">JA-VAGOS</span>
      </a>
    </div>

    <nav class="header-nav ms-auto">
      <ul class="d-flex align-items-center">

        <!--BUSCADOR -->
        <li class="nav-item d-block d-lg-none">
          <a class="nav-link nav-icon search-bar-toggle " href="#">
            <i class="bi bi-search"></i>
          </a>
        </li><!-- End Search Icon-->

        <!-- ICONO DE TIENDA Y NOTIFICACI?N-->

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
                <img src="" alt="" class="rounded-circle">
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
            <span class="d-none d-md-block dropdown-toggle ps-2"><%=usuarioLog.getNombre() + " " + usuarioLog.getApellido()%></span>
          </a><!-- End Profile Iamge Icon -->

          <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow profile">
            <li class="dropdown-header">
              <h6><%=usuarioLog.getNombre() + " " + usuarioLog.getApellido()%></h6>
              <span>Manager</span>
            </li>
            <li>
              <hr class="dropdown-divider">
            </li>

            <li>
              <a class="dropdown-item d-flex align-items-center" href="<%=request.getContextPath()%>/ManagerCuentasServlet?a=perfil&id=<%=usuarioLog.getIdCuentas()%>">
                <i class="bi bi-person"></i>
                <span>Mi Perfil</span>
              </a>
            </li>
            <li>
              <hr class="dropdown-divider">
            </li>

            <li>
              <a class="dropdown-item d-flex align-items-center" href="<%=request.getContextPath()%>/login?action=logout">
                <i class="bi bi-box-arrow-right"></i>
                <span>Sign Out</span>
              </a>
            </li>

          </ul><!-- End Profile Dropdown Items -->
        </li><!-- End Profile Nav -->

      </ul>
    </nav><!-- End Icons Navigation -->

  </header>

  <aside id="sidebar" class="sidebar">

    <ul class="sidebar-nav" id="sidebar-nav">

      <li class="nav-item">
        <a class="nav-link text-warning" href="<%=request.getContextPath()%>/ManagerCuentasServlet">
          <i class="bi bi-person-circle text-warning"></i>
          <span>Usuarios</span>
        </a>
      </li><!-- End Dashboard Nav -->

      <li class="nav-item">
        <a class="nav-link collapsed" href="<%=request.getContextPath()%>/ManagerCuentasServlet?a=ListaEmpleados">
          <i class="bi bi-person-bounding-box"></i>
          <span>Administradores</span>
        </a>
      </li><!-- End Profile Page Nav -->


      <li class="nav-item">
        <a class="nav-link collapsed" href="<%=request.getContextPath()%>/ManagerJuegosServlet">
          <i class="bi bi-playstation"></i>
          <span>Juegos</span>
        </a>
      </li><!-- End F.A.Q Page Nav -->

    </ul>

  </aside>
<%}%>
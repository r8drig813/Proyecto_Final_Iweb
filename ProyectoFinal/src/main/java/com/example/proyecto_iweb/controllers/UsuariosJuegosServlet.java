package com.example.proyecto_iweb.controllers;

import java.io.*;

import com.example.proyecto_iweb.models.beans.Cuentas;
import com.example.proyecto_iweb.models.beans.Juegos;
import com.example.proyecto_iweb.models.beans.VentaUsuario;
import com.example.proyecto_iweb.models.daos.UsuarioCuentasDaos;
import com.example.proyecto_iweb.models.daos.UsuarioJuegosDaos;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet(name = "UsuariosJuegosServlet", urlPatterns = {"/UsuariosJuegosServlet"})
public class UsuariosJuegosServlet extends HttpServlet {

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        response.setContentType("text/html");



        String action = request.getParameter("a") == null ? "listar" : request.getParameter("a");

        UsuarioJuegosDaos usuarioJuegosDaos = new UsuarioJuegosDaos();
        UsuarioCuentasDaos usuarioCuentasDaos = new UsuarioCuentasDaos();

        switch (action) {

            case "listar":
                request.setAttribute("lista", usuarioJuegosDaos.listarJuegos());
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("usuario/indexUsuarioOficial.jsp");
                requestDispatcher.forward(request, response);
                break;
            case "listar1":
                request.setAttribute("lista", usuarioJuegosDaos.listarJuegos());
                RequestDispatcher requestDispatcher1 = request.getRequestDispatcher("usuario/postearUsuariosOficial.jsp");
                requestDispatcher1.forward(request, response);
                break;
            case "verjuego":
                int juegoId = Integer.parseInt(request.getParameter("id"));
                request.setAttribute("juegos", usuarioJuegosDaos.listar(juegoId));
                request.getRequestDispatcher("usuario/verJuego.jsp").forward(request, response);
                break;
            case "vendidos":
                String idCuenta1 = request.getParameter("id");
                request.setAttribute("lista2", usuarioJuegosDaos.listarVendidos(idCuenta1));
                request.getRequestDispatcher("usuario/vendidosUsuariosOficial.jsp").forward(request, response);
                break;
            case "comprados":
                String idCuenta2 = request.getParameter("id");
                String idCuenta7 = request.getParameter("id");

                request.setAttribute("lista3", usuarioJuegosDaos.listarComprados(idCuenta2));

                request.setAttribute("generoMasComprado",usuarioJuegosDaos.generoMasComprado(idCuenta7));

                request.getRequestDispatcher("usuario/compradosUsuariosOficial.jsp").forward(request, response);
                break;
            case  "perfil" :
                String id = request.getParameter("id");
                request.setAttribute("cuentas", usuarioCuentasDaos.listar(id));
                request.getRequestDispatcher("usuario/miPerfilOficial.jsp").forward(request, response);
                break;
            case "borrar":
                String id2 = request.getParameter("id");
                usuarioJuegosDaos.borrar(id2);
                response.sendRedirect(request.getContextPath() + "/UsuariosJuegosServlet");
                break;
            case "listarNotificaciones":
                String idCuenta3 = request.getParameter("id");
                request.setAttribute("notificaciones", usuarioJuegosDaos.listarNotificaciones(idCuenta3));
                request.getRequestDispatcher("usuario/notificacionesUsuarioOficial.jsp").forward(request,response);
                break;
            case "agregar":
                request.setAttribute("consolas", usuarioJuegosDaos.consolas());
                request.setAttribute("generos", usuarioJuegosDaos.generos());
                request.getRequestDispatcher("usuario/agregarjuegonuevo.jsp").forward(request, response);
                break;
            case "ofertas":
                request.setAttribute("ofertas", usuarioJuegosDaos.listarOfertas());
                request.getRequestDispatcher("usuario/ofertasUsuarioOficial.jsp").forward(request,response);
                break;
            case "actualizarVenta":
                String id3 =request.getParameter("id");
                usuarioJuegosDaos.actualizarEstadoVenta(id3);
                HttpSession session = request.getSession();
                Cuentas cuentas = (Cuentas) session.getAttribute("usuarioLog");


                response.sendRedirect(request.getContextPath() + "/UsuariosJuegosServlet?a=vendidos&id=" + cuentas.getIdCuentas() );
                break;

            case "eliminarVenta":
                String id4 =request.getParameter("id");
                usuarioJuegosDaos.eliminarVenta(id4);
                HttpSession session2 = request.getSession();
                Cuentas cuentas2 = (Cuentas) session2.getAttribute("usuarioLog");

                response.sendRedirect(request.getContextPath() + "/UsuariosJuegosServlet?a=vendidos&id=" + cuentas2.getIdCuentas());
                break;

            case "gc":
                String consola = request.getParameter("consola");
                String genero = request.getParameter("genero");
                request.setAttribute("lista", usuarioJuegosDaos.generosyconsolas(consola,genero));
                request.getRequestDispatcher("usuario/indexUsuarioOficial.jsp").forward(request, response);
                break;

            case "verPrecio":
                String id5 = request.getParameter("id");
                request.setAttribute("verVenta", usuarioJuegosDaos.verVenta(id5));
                request.getRequestDispatcher("usuario/editarPrecioJuego.jsp").forward(request, response);
                break;



            case "agregarjuego":
                String id7 =request.getParameter("id");
                request.setAttribute("verJuego", usuarioJuegosDaos.listar(Integer.parseInt(id7)));
                request.getRequestDispatcher("usuario/agregarjuegoexistente.jsp").forward(request, response);
                break;

            case "comprar":
                String idJuegoStr =request.getParameter("id");
                String precioStr = request.getParameter("precio");
                double precio = Double.parseDouble(precioStr);
                int idJuego = Integer.parseInt(idJuegoStr);
                HttpSession session1 = request.getSession();
                Cuentas cuentas1 = (Cuentas) session1.getAttribute("usuarioLog");
                usuarioJuegosDaos.guardarCompra(idJuego,cuentas1.getIdCuentas(),precio,cuentas1.getDireccion());
                response.sendRedirect(request.getContextPath() + "/UsuariosJuegosServlet?a=listar");
                break;


        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String action = request.getParameter("p") == null ? "crear" : request.getParameter("p");

        UsuarioJuegosDaos usuarioJuegosDaos = new UsuarioJuegosDaos();

        switch (action) {
            case "b":
                String textoBuscar = request.getParameter("textoBuscar");
                request.setAttribute("lista", usuarioJuegosDaos.buscarPorTitle(textoBuscar));
                request.getRequestDispatcher("usuario/postearUsuariosOficial.jsp").forward(request, response);
                break;
            case "b1":
                String textoBuscar1 = request.getParameter("buscador");
                request.setAttribute("lista", usuarioJuegosDaos.buscarPorTitle(textoBuscar1));
                request.getRequestDispatcher("usuario/indexUsuarioOficial.jsp").forward(request, response);
                break;
            case "c":
                Juegos juegos = parseJuegosPosteadosNuevos(request);
                HttpSession session = request.getSession();
                Cuentas cuentas = (Cuentas) session.getAttribute("usuarioLog");
                if (juegos != null) {
                    String precioString = String.valueOf(juegos.getPrecio());
                    if (juegos.getNombre().isEmpty() || precioString.isEmpty() || juegos.getDescripcion().isEmpty() || juegos.getPrecio()<0) {
                        session.setAttribute("msg1","");
                        response.sendRedirect(request.getContextPath() + "/UsuariosJuegosServlet?a=agregar");
                    }else{
                        usuarioJuegosDaos.guardar(juegos, cuentas.getIdCuentas());
                        response.sendRedirect(request.getContextPath() + "/UsuariosJuegosServlet?a=listar1");
                    }
                }else{
                    session.setAttribute("msg","");
                    response.sendRedirect(request.getContextPath() + "/UsuariosJuegosServlet?a=agregar");
                }
                break;
            case "a":
                VentaUsuario ventaUsuario = parseVentas(request);
                usuarioJuegosDaos.actualizarPrecioVenta(ventaUsuario);
                response.sendRedirect(request.getContextPath() + "/UsuariosJuegosServlet?a=vendidos");
                break;

            case "e":
                Juegos juegos1 = parseJuegos(request);
                HttpSession session1 = request.getSession();
                Cuentas cuentas1 = (Cuentas) session1.getAttribute("usuarioLog");
                usuarioJuegosDaos.guardarVenta1(juegos1,cuentas1.getIdCuentas());
                response.sendRedirect(request.getContextPath() + "/UsuariosJuegosServlet?a=listar1");
                break;
        }
    }



    public Juegos parseJuegosPosteadosNuevos(HttpServletRequest request) {

        Juegos juegos = new Juegos();
        String nombre = request.getParameter("nombre");
        String precio = request.getParameter("precio");
        String consola = request.getParameter("consola");
        String genero = request.getParameter("genero");
        String foto = request.getParameter("foto");
        String descripcion = request.getParameter("descripcion");

        try {

            juegos.setNombre(nombre);
            juegos.setPrecio(Integer.parseInt(precio));
            juegos.setDescripcion(descripcion);
            juegos.setConsola(consola);
            juegos.setGenero(genero);
            juegos.setFoto(foto);

            return juegos;

        } catch (NumberFormatException e) {
            return null;
        }
    }

    public VentaUsuario parseVentas(HttpServletRequest request)  {

        VentaUsuario ventaUsuario = new VentaUsuario();
        String idVenta = request.getParameter("idVentas") != null ? request.getParameter("idVentas") : "";
        String precio = request.getParameter("precioVenta");


        try {

            int id = Integer.parseInt(idVenta);

            ventaUsuario.setIdVenta(id);
            ventaUsuario.setPrecioVenta(Double.parseDouble(precio));


            return ventaUsuario;

        } catch (NumberFormatException e) {

        }
        return ventaUsuario;
    }

    public Juegos parseJuegos(HttpServletRequest request)  {

        Juegos juegos = new Juegos();
        String idVenta = request.getParameter("idJuego") != null ? request.getParameter("idJuego") : "";
        String precio = request.getParameter("precioVenta");


        try {

            int id = Integer.parseInt(idVenta);

            juegos.setIdJuegos(id);
            juegos.setPrecio(Double.parseDouble(precio));


            return juegos;

        } catch (NumberFormatException e) {

        }
        return juegos;
    }


}

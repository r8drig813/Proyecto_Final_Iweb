package com.example.proyecto_iweb.controllers;

import java.io.*;

import com.example.proyecto_iweb.models.beans.Juegos;
import com.example.proyecto_iweb.models.daos.UsuarioCuentasDaos;
import com.example.proyecto_iweb.models.daos.UsuarioJuegosDaos;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet(name = "UsuariosJuegosServlet", value = "/UsuariosJuegosServlet")
public class UsuariosJuegosServlet extends HttpServlet {

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        response.setContentType("text/html");

        UsuarioJuegosDaos usuarioJuegosDaos = new UsuarioJuegosDaos();
        UsuarioCuentasDaos usuarioCuentasDaos = new UsuarioCuentasDaos();


        String action = request.getParameter("a") == null ? "listar" : request.getParameter("a");
        switch (action) {
            case "listar":
                request.setAttribute("lista", usuarioJuegosDaos.listarJuegos());
                //request.setAttribute("perfil", usuarioCuentasDaos.perfil());
                // request.setAttribute("lista4",usuarioJuegosDaos.listarNotificaciones());
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("usuario/indexUsuarioOficial.jsp");
                requestDispatcher.forward(request, response);
                break;
            case "listar1":
                request.setAttribute("lista", usuarioJuegosDaos.listarJuegos());
                // request.setAttribute("perfil", usuarioCuentasDaos.perfil());
                //request.setAttribute("lista4",usuarioJuegosDaos.listarNotificaciones());
                RequestDispatcher requestDispatcher1 = request.getRequestDispatcher("usuario/postearUsuariosOficial.jsp");
                requestDispatcher1.forward(request, response);
                break;
            case "verjuego":
                int juegoId = Integer.parseInt(request.getParameter("id"));
                request.setAttribute("juegos", usuarioJuegosDaos.listar(juegoId));
                //request.setAttribute("perfil", usuarioCuentasDaos.perfil());
                //request.setAttribute("lista4",usuarioJuegosDaos.listarNotificaciones());
                request.getRequestDispatcher("usuario/verJuego.jsp").forward(request, response);
                break;

            case "carrito":
                int juegoId1 = Integer.parseInt(request.getParameter("id"));
                //request.setAttribute("juegos", usuarioJuegosDaos.listar(juegoId1));
                //request.setAttribute("perfil", usuarioCuentasDaos.perfil());
                //request.setAttribute("lista4",usuarioJuegosDaos.listarNotificaciones());
                request.getRequestDispatcher("usuario/carrito.jsp").forward(request, response);
                break;

            case "vendidos":
                String idCuenta1 =request.getParameter("id");
                request.setAttribute("lista2", usuarioJuegosDaos.listarVendidos(idCuenta1));
                //request.setAttribute("perfil", usuarioCuentasDaos.perfil());
                //request.setAttribute("lista4",usuarioJuegosDaos.listarNotificaciones());
                request.getRequestDispatcher("usuario/vendidosUsuariosOficial.jsp").forward(request, response);
                break;
            case "comprados":
                String idCuenta2 = request.getParameter("id");
                request.setAttribute("lista3", usuarioJuegosDaos.listarComprados(idCuenta2));
                //request.setAttribute("perfil", usuarioCuentasDaos.perfil());
                //request.setAttribute("lista4",usuarioJuegosDaos.listarNotificaciones());
                request.getRequestDispatcher("usuario/compradosUsuariosOficial.jsp").forward(request, response);
                break;
            case  "perfil" :
                String id = request.getParameter("id");
                request.setAttribute("cuentas", usuarioCuentasDaos.listar(id));
                //request.setAttribute("perfil", usuarioCuentasDaos.perfil());
                //request.setAttribute("lista4",usuarioJuegosDaos.listarNotificaciones());
                request.getRequestDispatcher("usuario/miPerfilOficial.jsp").forward(request, response);
                break;

            case "listarJuegos":
                //request.setAttribute("lista",usuarioJuegosDaos.listarJuegosDisponibles());
                //request.setAttribute("perfil", usuarioCuentasDaos.perfil());
                //request.setAttribute("lista4",usuarioJuegosDaos.listarNotificaciones());
                request.getRequestDispatcher("admin/indexAdmin.jsp").forward(request,response);
                break;
            case "listarofertas":
                //request.setAttribute("ofertas",usuarioJuegosDaos.listarOfertas());
                //request.setAttribute("perfil", usuarioCuentasDaos.perfil());
                //request.setAttribute("lista4",usuarioJuegosDaos.listarNotificaciones());
                request.getRequestDispatcher("admin/ofertasJuegos.jsp").forward(request,response);
                break;
            case "borrar":
                String id2 = request.getParameter("id");
                usuarioJuegosDaos.borrar(id2);
                response.sendRedirect(request.getContextPath() + "/UsuariosJuegosServlet");
                break;
            case "listarNotificaciones":
                //request.setAttribute("lista2", usuarioJuegosDaos.listarVendidos());
                //request.setAttribute("lista4",usuarioJuegosDaos.listarNotificaciones());
                //request.setAttribute("perfil", usuarioCuentasDaos.perfil());
                request.getRequestDispatcher("usuario/notificacionesUsuarioOficial.jsp").forward(request,response);
                break;
            case "agregar":
                request.getRequestDispatcher("usuario/agregarjuegonuevo.jsp").forward(request, response);
                break;
            case "ofertas":
                //request.setAttribute("lista2", usuarioJuegosDaos.listarVendidos());
                //request.setAttribute("lista4",usuarioJuegosDaos.listarNotificaciones());
                //request.setAttribute("perfil", usuarioCuentasDaos.perfil());
                request.setAttribute("ofertas", usuarioJuegosDaos.listarOfertas());
                request.getRequestDispatcher("usuario/ofertasUsuarioOficial.jsp").forward(request,response);
                break;
            case "actualizarVenta":
                String id3 =request.getParameter("id");
                usuarioJuegosDaos.actualizarEstadoVenta(id3);
                response.sendRedirect(request.getContextPath() + "/UsuariosJuegosServlet?a=vendidos");
                break;

            case "eliminarVenta":
                String id4 =request.getParameter("id");
                usuarioJuegosDaos.eliminarVenta(id4);
                response.sendRedirect(request.getContextPath() + "/UsuariosJuegosServlet?a=vendidos");
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
                usuarioJuegosDaos.guardar(juegos);

                response.sendRedirect(request.getContextPath() + "/UsuariosJuegosServlet?a=listar1");
                break;
            /*case "actualizar":
                VentaUsuario ventaUsuario = parseVendidos(request);
                usuarioJuegosDaos.actualizar(ventaUsuario);
                response.sendRedirect(request.getContextPath()+ "/UsuariosJuegosServlet");
                break;*/

        }

    }

    /*public VentaUsuario parseVendidos(HttpServletRequest request)  {

        VentaUsuario ventaUsuario = new VentaUsuario();
        String idVenta = request.getParameter("idVenta") != null ? request.getParameter("idVentas") : "";
        String idEstado = request.getParameter("idEstados");
        try {
            int id = Integer.parseInt(idVenta);
            int id1 = Integer.parseInt(idEstado);
            ventaUsuario.setIdVenta(id);
            ventaUsuario.setIdEstados(id1);

            return ventaUsuario;

        } catch (NumberFormatException e) {

        }
        return ventaUsuario;
    }*/

    public Juegos parseJuegosPosteadosNuevos(HttpServletRequest request) {

        Juegos juegos = new Juegos();
        String nombre = request.getParameter("nombre");
        String precio = request.getParameter("precio");
        String consola = request.getParameter("consola");
        String genero = request.getParameter("genero");
        //String foto = request.getParameter("foto");
        String descripcion = request.getParameter("descripcion");

        try {

            juegos.setNombre(nombre);
            juegos.setPrecio(Integer.parseInt(precio));
            juegos.setDescripcion(descripcion);
            juegos.setConsola(consola);
            juegos.setGenero(genero);
            //juegos.setFoto(foto);

            return juegos;

        } catch (NumberFormatException e) {

        }
        return juegos;
    }
}

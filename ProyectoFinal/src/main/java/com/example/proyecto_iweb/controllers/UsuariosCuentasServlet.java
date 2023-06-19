package com.example.proyecto_iweb.controllers;

import java.io.*;
import java.sql.SQLException;

import com.example.proyecto_iweb.models.beans.Cuentas;
import com.example.proyecto_iweb.models.daos.UsuarioCuentasDaos;
import com.example.proyecto_iweb.models.daos.UsuarioJuegosDaos;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet(name = "UsuariosCuentasServlet", value = "/UsuariosCuentasServlet")
public class UsuariosCuentasServlet extends HttpServlet {

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        response.setContentType("text/html");

        UsuarioCuentasDaos usuarioCuentasDaos = new UsuarioCuentasDaos();
        UsuarioJuegosDaos usuarioJuegosDaos = new UsuarioJuegosDaos();
        RequestDispatcher view;

        String action = request.getParameter("a") == null ? "listar" : request.getParameter("a");

        switch (action) {
            case  "perfil" :
                String id = request.getParameter("id");
                request.setAttribute("cuentas", usuarioCuentasDaos.listar(id));
                //request.setAttribute("lista4",usuarioJuegosDaos.listarNotificaciones());
                request.getRequestDispatcher("usuario/miPerfilOficial.jsp").forward(request, response);
                break;
            case "listar":
                //request.setAttribute("listar1", usuarioJuegosDaos.listarJuegos());
                //request.setAttribute("perfil", usuarioCuentasDaos.perfil());

                request.getRequestDispatcher("usuario/indexUsuarioOficial.jsp").forward(request, response);

                break;
            case "vendidos":
                request.setAttribute("listar2", usuarioJuegosDaos.listarVendidos());
                //request.setAttribute("perfil", usuarioCuentasDaos.perfil());

                request.getRequestDispatcher("usuario/vendidosUsuariosOficial.jsp").forward(request, response);
                break;
            case "comprados":
                request.setAttribute("listar3", usuarioJuegosDaos.listarComprados());
                //request.setAttribute("perfil", usuarioCuentasDaos.perfil());

                request.getRequestDispatcher("usuario/compradosUsuariosOficial.jsp").forward(request, response);
                break;
            case"agregar":
                view = request.getRequestDispatcher("/nuevoUsuario.jsp");
                view.forward(request, response);
                break;
        }


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String action = request.getParameter("p") == null ? "guardar" : request.getParameter("p");

        UsuarioCuentasDaos usuarioCuentasDaos = new UsuarioCuentasDaos();

        switch (action) {
            case "a":
                Cuentas cuentas = parseCuentas(request);
                usuarioCuentasDaos.actualizar(cuentas);
                response.sendRedirect(request.getContextPath() + "/UsuariosJuegosServlet");
                break;
            case"guardar":

                Cuentas cuentas1= new Cuentas();
                cuentas1.setNombre(request.getParameter("nombre"));
                cuentas1.setApellido(request.getParameter("apellido"));
                cuentas1.setNickname(request.getParameter("nickname"));
                cuentas1.setDireccion(request.getParameter("direccion"));
                cuentas1.setCorreo(request.getParameter("correo"));
                cuentas1.setPasswordHashed(request.getParameter("password"));

                try {
                    usuarioCuentasDaos.guardarUsuario(cuentas1);
                    response.sendRedirect("/login");

                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }

                break;
        }


    }

    public Cuentas parseCuentas(HttpServletRequest request)  {

        Cuentas cuentas = new Cuentas();
        String idCuentas = request.getParameter("idCuentas") != null ? request.getParameter("idCuentas") : "";
        String descripcion = request.getParameter("descripcion");
        String direcion = request.getParameter("direccion");
        String correo = request.getParameter("correo");

        try {

            int id = Integer.parseInt(idCuentas);

            cuentas.setIdCuentas(id);
            cuentas.setDescripcion(descripcion);
            cuentas.setDireccion(direcion);
            cuentas.setCorreo(correo);

            return cuentas;

        } catch (NumberFormatException e) {

        }
        return cuentas;
    }
}

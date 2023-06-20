package com.example.proyecto_iweb.controllers;

import com.example.proyecto_iweb.models.beans.Juegos;
import com.example.proyecto_iweb.models.daos.AdminCuentasDaos;
import com.example.proyecto_iweb.models.daos.AdminJuegosDaos;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "AdminJuegosServlet", value = "/AdminJuegosServlet")

public class AdminJuegosServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");

        AdminJuegosDaos adminJuegosDaos = new AdminJuegosDaos();
        AdminCuentasDaos adminCuentasDaos = new AdminCuentasDaos();

        String action = request.getParameter("a") == null ? "listarJuegosDisponibles" : request.getParameter("a");

        switch (action) {
            case "listarJuegosDisponibles":
                request.setAttribute("lista", adminJuegosDaos.listarJuegosDisponibles());
                request.getRequestDispatcher("admin/indexAdmin.jsp").forward(request, response);
                break;

            case "crearJuego":
                request.setAttribute("consolas", adminJuegosDaos.consolas());
                request.setAttribute("generos", adminJuegosDaos.generos());
                request.getRequestDispatcher("admin/crearJuego.jsp").forward(request, response);
                break;

            case "editarJuego":
                String id = request.getParameter("id");
                request.setAttribute("juego", adminJuegosDaos.obtenerJuego(id));
                request.setAttribute("consolas", adminJuegosDaos.consolas());
                request.setAttribute("generos", adminJuegosDaos.generos());
                request.getRequestDispatcher("admin/editarJuego.jsp").forward(request, response);
                break;

            case "deshabilitarJuego":


                break;
        }


    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");

        String action = request.getParameter("p") == null ? "crear" : request.getParameter("p");

        AdminJuegosDaos adminJuegosDaos = new AdminJuegosDaos();

        switch (action) {
            case "crear":
                int idJuego = Integer.parseInt(request.getParameter("idJuego"));
                String nombre = request.getParameter("nombre");
                String descripcion = request.getParameter("descripcion");
                double precio = Double.parseDouble(request.getParameter("precio"));
                int stock = Integer.parseInt(request.getParameter("stock"));
                String consola = request.getParameter("consola");
                String genero = request.getParameter("genero");
                String foto = request.getParameter("foto");
                if (foto == null) {
                    foto = "img/juegos/juegoNuevo.png";
                }

                Juegos juegos = adminJuegosDaos.obtenerJuego(String.valueOf(idJuego));
                if(juegos == null){
                    adminJuegosDaos.crearJuego(nombre, descripcion, precio, stock, consola, genero, foto);
                }else {
                    //adminJuegosDaos.actualizarJuego(nombre, descripcion, precio, stock, consola, genero, foto, idJuego);
                }


                response.sendRedirect(request.getContextPath() + "/AdminJuegosServlet");
                break;

            case "a":

                break;

        }



    }
}

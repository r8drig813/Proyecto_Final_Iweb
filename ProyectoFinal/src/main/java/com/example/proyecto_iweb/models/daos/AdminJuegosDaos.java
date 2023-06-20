package com.example.proyecto_iweb.models.daos;

import com.example.proyecto_iweb.models.beans.Juegos;
import com.example.proyecto_iweb.models.dtos.Consolas;
import com.example.proyecto_iweb.models.dtos.Generos;

import java.sql.*;
import java.util.ArrayList;

public class AdminJuegosDaos  extends DaoBase{
    /** Listar todos los juegos (View: Index principal del Admin) **/
    public ArrayList<Juegos> listarJuegosDisponibles(){

        ArrayList<Juegos> lista = new ArrayList<>();
        String sql = "select * from juego";
        String url = "jdbc:mysql://localhost:3306/mydb";

        try (Connection connection = this.getConection();
             Statement stmt = connection.createStatement();
             ResultSet resultSet = stmt.executeQuery(sql)) {

            while(resultSet.next()){
                Juegos juegoDisponible = new Juegos();

                juegoDisponible.setIdJuegos(resultSet.getInt(1));
                juegoDisponible.setNombre(resultSet.getString(2));
                juegoDisponible.setDescripcion(resultSet.getString(3));
                juegoDisponible.setPrecio(resultSet.getFloat(4));
                juegoDisponible.setDescuento(resultSet.getInt(5));
                juegoDisponible.setFoto(resultSet.getString(6));
                juegoDisponible.setStock(resultSet.getInt("stock"));
                lista.add(juegoDisponible);
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return lista;
    }

    public ArrayList<Consolas> consolas(){

        ArrayList<Consolas> lista = new ArrayList<>();
        String sql = "select distinct consola from juego";

        try (Connection connection = this.getConection();
             Statement stmt = connection.createStatement();
             ResultSet resultSet = stmt.executeQuery(sql)) {

            while (resultSet.next()) {
                Consolas consolas = new Consolas();

                consolas.setNombre(resultSet.getString(1));
                lista.add(consolas);
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return lista;
    }

    public ArrayList<Generos> generos(){

        ArrayList<Generos> lista = new ArrayList<>();
        String sql = "select distinct genero from juego";

        try (Connection connection = this.getConection();
             Statement stmt = connection.createStatement();
             ResultSet resultSet = stmt.executeQuery(sql)) {

            while (resultSet.next()) {
                Generos generos = new Generos();

                generos.setNombre(resultSet.getString(1));
                lista.add(generos);
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return lista;
    }

    public void crearJuego(String nombre, String descripcion, double precio, int stock, String consola, String genero, String foto){

        String sql = "INSERT INTO juego (nombre,descripcion,precio,descuento,stock,consola,genero,foto,existente,habilitado) VALUES (?,?,?,'0',?,?,?,?,'1','1')";

        try (Connection connection = this.getConection();
             PreparedStatement pstmt = connection.prepareStatement(sql)) {

            pstmt.setString(1, nombre);
            pstmt.setString(2, descripcion);
            pstmt.setDouble(3, precio);
            pstmt.setDouble(4, stock);
            pstmt.setString(5, consola);
            pstmt.setString(6, genero);
            pstmt.setString(7, foto);

            pstmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }

    public Juegos obtenerJuego(String idJuego) {

        Juegos juegos = null;
        String sql = "SELECT * FROM juego WHERE idJuego = ?";

        try {
            try (Connection conn = this.getConection();
                 PreparedStatement pstmt = conn.prepareStatement(sql)) {
                pstmt.setString(1, idJuego);

                try (ResultSet rs = pstmt.executeQuery()) {
                    if (rs.next()) {
                        juegos = new Juegos();
                        juegos.setIdJuegos(rs.getInt(1));
                        juegos.setNombre(rs.getString(2));
                        juegos.setDescripcion(rs.getString(3));
                        juegos.setPrecio(rs.getDouble(4));
                        juegos.setDescuento(rs.getDouble(5));
                        juegos.setFoto(rs.getString(6));
                        juegos.setConsola(rs.getString(9));
                        juegos.setGenero(rs.getString(10));
                        juegos.setStock(rs.getInt(11));
                    }
                }

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return juegos;
    }

    public void actualizarJuego(String nombre, String descripcion, double precio, int stock, String consola, String genero, String foto, int idJuego){
        String sql = "UPDATE juego SET nombre = ?,descripcion = ?,precio = ?, descuento = ?, consola = ?, genero = ?, stock = ? WHERE idJuego = ?";
        try (Connection connection = this.getConection()){

            try (PreparedStatement pstmt = connection.prepareStatement(sql)){
                pstmt.setString(1, nombre);
                pstmt.setString(2, descripcion);
                pstmt.setDouble(3, precio);
                pstmt.setDouble(4, descuento);
                pstmt.setString(5, juegos.getConsola());
                pstmt.setString(6, juegos.getGenero());

                pstmt.executeUpdate();
            }


        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

}

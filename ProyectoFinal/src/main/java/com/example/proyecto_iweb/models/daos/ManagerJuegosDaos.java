package com.example.proyecto_iweb.models.daos;

import com.example.proyecto_iweb.models.beans.Juegos;

import java.sql.*;
import java.util.ArrayList;

public class ManagerJuegosDaos extends DaoBase{

    /* ------------------------------ listar Juegos---------------------------*/
    public ArrayList<Juegos> listarJuegos(){
        ArrayList<Juegos> lista = new ArrayList<>();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        String sql = "select * from juego ";
        String url = "jdbc:mysql://localhost:3306/mydb";
        try (Connection connection = DriverManager.getConnection(url, "root", "root");
             Statement stmt = connection.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while(rs.next()){
                Juegos juegos = new Juegos();
                juegos.setIdJuegos(rs.getInt(1));
                juegos.setNombre(rs.getString(2));
                juegos.setDescripcion(rs.getString(3));
                juegos.setPrecio(rs.getDouble(4));
                juegos.setDescuento(rs.getDouble(5));
                juegos.setStock(rs.getInt(11));
                juegos.setFoto(rs.getString(6));
                juegos.setExistente(rs.getBoolean(7));
                juegos.setHabilitado(rs.getBoolean(8));
                juegos.setConsola(rs.getString(9));
                juegos.setConsola(rs.getString(10));
                lista.add(juegos);
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return lista;
    }
    /* ------------------------------- barra buscadora -----------------------*/
    public ArrayList<Juegos> buscarPorTitle(String title) {
        ArrayList<Juegos> lista = new ArrayList<>();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        String sql = "select * from juego where nombre like ?";
        String url = "jdbc:mysql://localhost:3306/mydb";
        try (Connection connection = DriverManager.getConnection(url, "root", "root");
             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {

            preparedStatement.setString(1, "%" + title + "%");

            try (ResultSet rs = preparedStatement.executeQuery()) {

                while (rs.next()) {
                    Juegos juegos = new Juegos();
                    juegos.setIdJuegos(rs.getInt(1));
                    juegos.setNombre(rs.getString(2));
                    juegos.setDescripcion(rs.getString(3));
                    juegos.setPrecio(rs.getDouble(4));
                    juegos.setDescuento(rs.getDouble(5));
                    juegos.setStock(rs.getInt(11));
                    juegos.setFoto(rs.getString(6));
                    juegos.setExistente(rs.getBoolean(7));
                    juegos.setHabilitado(rs.getBoolean(8));
                    juegos.setConsola(rs.getString(9));
                    juegos.setConsola(rs.getString(10));
                    lista.add(juegos);
                }
            }


        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return lista;
    }

    /*--------------------------------- borrar juego -------------------------*/
    public void eliminarJuego(String id) {

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        String url = "jdbc:mysql://localhost:3306/mydb";
        String sql = "DELETE FROM juego WHERE idJuego = ?";
        try (Connection connection = DriverManager.getConnection(url, "root", "root");
             PreparedStatement pstmt = connection.prepareStatement(sql)) {

            pstmt.setString(1, id);

            pstmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    /*------------------------------------------------------------------------*/
}

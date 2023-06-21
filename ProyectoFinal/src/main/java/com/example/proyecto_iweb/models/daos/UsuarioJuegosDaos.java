package com.example.proyecto_iweb.models.daos;

import com.example.proyecto_iweb.models.beans.*;
import com.example.proyecto_iweb.models.dtos.Consolas;
import com.example.proyecto_iweb.models.dtos.Generos;

import java.sql.*;
import java.util.ArrayList;
import java.util.Date;

public class UsuarioJuegosDaos extends DaoBase {
    /*-------------------USUARIOS----------------------------*/

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
             ResultSet resultSet = stmt.executeQuery(sql)) {

            while(resultSet.next()){
                Juegos juegos = new Juegos();
                juegos.setIdJuegos(resultSet.getInt(1));
                juegos.setNombre(resultSet.getString(2));
                juegos.setDescripcion(resultSet.getString(3));
                juegos.setPrecio(resultSet.getDouble(4));
                juegos.setDescuento(resultSet.getDouble(5));
                juegos.setStock(resultSet.getInt(11));
                juegos.setFoto(resultSet.getString(6));
                juegos.setExistente(resultSet.getBoolean(7));
                juegos.setHabilitado(resultSet.getBoolean(8));
                juegos.setConsola(resultSet.getString(9));
                juegos.setGenero(resultSet.getString(10));
                lista.add(juegos);
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return lista;
    }

    public Juegos listar(int juegoId) {
        Juegos juegos = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        String sql = "select * from juego where idJuego = ?";
        String url = "jdbc:mysql://localhost:3306/mydb";
        try (Connection connection = DriverManager.getConnection(url, "root", "root");
             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {

            preparedStatement.setInt(1, juegoId);

            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    juegos = new Juegos();
                    juegos.setIdJuegos(resultSet.getInt(1));
                    juegos.setNombre(resultSet.getString(2));
                    juegos.setDescripcion(resultSet.getString(3));
                    juegos.setPrecio(resultSet.getDouble(4));
                    juegos.setDescuento(resultSet.getDouble(5));
                    juegos.setStock(resultSet.getInt(11));
                    juegos.setFoto(resultSet.getString(6));
                    juegos.setExistente(resultSet.getBoolean(7));
                    juegos.setHabilitado(resultSet.getBoolean(8));
                    juegos.setConsola(resultSet.getString(9));
                    juegos.setGenero(resultSet.getString(10));
                }
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return juegos;
    }

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

            try (ResultSet resultSet = preparedStatement.executeQuery()) {

                while (resultSet.next()) {
                    Juegos juegos = new Juegos();
                    juegos.setIdJuegos(resultSet.getInt(1));
                    juegos.setNombre(resultSet.getString(2));
                    juegos.setDescripcion(resultSet.getString(3));
                    juegos.setPrecio(resultSet.getDouble(4));
                    juegos.setDescuento(resultSet.getDouble(5));
                    juegos.setStock(resultSet.getInt(11));
                    juegos.setFoto(resultSet.getString(6));
                    juegos.setExistente(resultSet.getBoolean(7));
                    juegos.setHabilitado(resultSet.getBoolean(8));
                    juegos.setConsola(resultSet.getString(9));
                    juegos.setGenero(resultSet.getString(10));
                    lista.add(juegos);
                }
            }


        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return lista;
    }

    public ArrayList<Juegos> listarOfertas() {
        ArrayList<Juegos> ofertas = new ArrayList<>();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        String sql1 = "select * from juego where descuento != 0";
        String url = "jdbc:mysql://localhost:3306/mydb";
        try (Connection connection = DriverManager.getConnection(url, "root", "root");
             Statement stmt = connection.createStatement();
             ResultSet resultSet = stmt.executeQuery(sql1)) {

            while (resultSet.next()) {
                Juegos juegoOferta = new Juegos();

                // Obtenemos los valores
                juegoOferta.setIdJuegos(resultSet.getInt(1));
                juegoOferta.setNombre(resultSet.getString(2));
                juegoOferta.setPrecio(resultSet.getInt(4));
                juegoOferta.setDescuento(resultSet.getInt(5));
                juegoOferta.setStock(resultSet.getInt(11));
                juegoOferta.setFoto(resultSet.getString(6));
                ofertas.add(juegoOferta);
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return ofertas;
    }

    public ArrayList<Consolas> consolas(){

        ArrayList<Consolas> lista = new ArrayList<>();
        String sql = "select distinct consola from juego";
        String url = "jdbc:mysql://localhost:3306/mydb";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        try (Connection connection = DriverManager.getConnection(url, "root", "root");
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
        String url = "jdbc:mysql://localhost:3306/mydb";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        try (Connection connection = DriverManager.getConnection(url, "root", "root");
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

    public ArrayList<VentaUsuario> listarVendidos(String id) {

        ArrayList<VentaUsuario> lista2 = new ArrayList<>();


        String sql = "SELECT * FROM ventausuario vu\n" +
                "inner join juego j on j.idJuego = vu.idJuego\n" +
                "inner join estados e on vu.idEstados = e.idEstados\n" +
                "where  vu.idEstados != 8  and vu.idUsuario = ?";

        try (Connection conn = this.getConection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, id);

            try (ResultSet rs = pstmt.executeQuery()){
                while (rs.next()) {
                    VentaUsuario ventaUsuario = new VentaUsuario();
                    ventaUsuario.setIdVenta(rs.getInt(1));
                    ventaUsuario.setPrecioVenta(rs.getInt(4));
                    ventaUsuario.setMensajeAdmin(rs.getString(5));

                    Juegos juegos = new Juegos();
                    juegos.setIdJuegos(rs.getInt(8));
                    juegos.setNombre(rs.getString(9));
                    juegos.setFoto(rs.getString(13));
                    ventaUsuario.setJuegos(juegos);

                    Estados estados = new Estados();
                    estados.setIdEstados(rs.getInt(19));
                    estados.setEstados(rs.getString(20));
                    ventaUsuario.setEstados(estados);
                    lista2.add(ventaUsuario);
                }
            }

        } catch (SQLException ex) {
            ex.printStackTrace();

        }

        return lista2;
    }

    public ArrayList<CompraUsuario> listarComprados(String id) {

        ArrayList<CompraUsuario> lista3 = new ArrayList<>();


        String sql = "SELECT * FROM comprausuario cu\n" +
                "inner join juego j on j.idJuego = cu.idJuego\n" +
                "inner join estados e on cu.idEstados = e.idEstados\n" +
                "where cu.idUsuario =?";

        try (Connection conn = this.getConection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, id);

            try(ResultSet rs = pstmt.executeQuery()){

                while (rs.next()) {
                    CompraUsuario compraUsuario = new CompraUsuario();
                    compraUsuario.setIdCompra(rs.getInt(1));
                    compraUsuario.setCantidad(rs.getInt(4));
                    compraUsuario.setFechaCompra(rs.getDate(5));
                    compraUsuario.setDireccion(rs.getString(6));
                    compraUsuario.setPrecioCompra(rs.getDouble(8));

                    Juegos juegos = new Juegos();
                    juegos.setIdJuegos(rs.getInt(10));
                    juegos.setNombre(rs.getString(11));
                    juegos.setDescripcion(rs.getString(12));
                    juegos.setFoto(rs.getString(15));

                    compraUsuario.setJuegos(juegos);

                    Estados estados = new Estados();
                    estados.setIdEstados(rs.getInt(21));
                    estados.setEstados(rs.getString(22));
                    compraUsuario.setEstados(estados);

                    lista3.add(compraUsuario);
                }
            }


        } catch (SQLException e) {
            e.printStackTrace();
        }

        return lista3;
    }

    public ArrayList<VentaUsuario> listarNotificaciones(String id) {

        ArrayList<VentaUsuario> lista = new ArrayList<>();

        String sql = "SELECT * FROM ventausuario vu\n" +
                "inner join juego j on j.idJuego = vu.idJuego\n" +
                "inner join estados e on vu.idEstados = e.idEstados\n" +
                "where vu.idEstados != 8 and vu.idUsuario = ? and vu.mensajeAdmin is not null;";

        try (Connection conn = this.getConection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, id);

            try (ResultSet rs = pstmt.executeQuery()){
                while (rs.next()) {
                    VentaUsuario ventaUsuario = new VentaUsuario();
                    ventaUsuario.setIdVenta(rs.getInt(1));
                    ventaUsuario.setPrecioVenta(rs.getInt(4));
                    ventaUsuario.setMensajeAdmin(rs.getString(5));

                    Juegos juegos = new Juegos();
                    juegos.setIdJuegos(rs.getInt(8));
                    juegos.setNombre(rs.getString(9));
                    juegos.setFoto(rs.getString(13));
                    ventaUsuario.setJuegos(juegos);

                    Estados estados = new Estados();
                    estados.setIdEstados(rs.getInt(19));
                    estados.setEstados(rs.getString(20));
                    ventaUsuario.setEstados(estados);
                    lista.add(ventaUsuario);
                }
            }

        } catch (SQLException ex) {
            ex.printStackTrace();

        }

        return lista;
    }

    public void actualizarEstadoVenta(String idVenta) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        String url = "jdbc:mysql://localhost:3306/mydb";
        String sql = "update ventausuario set idEstados = 5 where idVenta = ?";
        try (Connection connection = DriverManager.getConnection(url, "root", "root");
             PreparedStatement pstmt = connection.prepareStatement(sql)) {

            pstmt.setInt(1, Integer.parseInt(idVenta));

            pstmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void eliminarVenta(String idVenta) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        String url = "jdbc:mysql://localhost:3306/mydb";
        String sql = "update ventausuario set idEstados = 8 where idVenta = ?";
        try (Connection connection = DriverManager.getConnection(url, "root", "root");
             PreparedStatement pstmt = connection.prepareStatement(sql)) {

            pstmt.setInt(1, Integer.parseInt(idVenta));

            pstmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void borrar(String id)  {

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        String url = "jdbc:mysql://localhost:3306/mydb";
        String sql = "UPDATE compraUsuario SET `idEstados` = '5' WHERE (`idCompra` = '1');\n";
        try (Connection connection = DriverManager.getConnection(url, "root", "root");
             PreparedStatement pstmt = connection.prepareStatement(sql)) {

            pstmt.setString(1, id);

            pstmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

   public void guardar(Juegos juegos ) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        String url = "jdbc:mysql://localhost:3306/mydb";
        String sql = "INSERT INTO juego (nombre,descripcion,precio,descuento,foto,existente,habilitado,consola,genero,stock) VALUES (?,?,?,0,?,0,0,?,?,1)";
        try (Connection connection = DriverManager.getConnection(url, "root", "root");
             PreparedStatement pstmt = connection.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS)) {

            pstmt.setString(2, juegos.getNombre());
            pstmt.setString(3,juegos.getDescripcion());
            pstmt.setDouble(4, juegos.getPrecio());
            pstmt.setString(5, juegos.getFoto());
            pstmt.setBoolean(6,juegos.isHabilitado());
            pstmt.setBoolean(7,juegos.isExistente());
            pstmt.setString(8,juegos.getConsola());
            pstmt.setString(9,juegos.getGenero());

            pstmt.executeUpdate();
            ResultSet rsKeys= pstmt.getGeneratedKeys();
            int idJuego = rsKeys.getInt(1);

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

}

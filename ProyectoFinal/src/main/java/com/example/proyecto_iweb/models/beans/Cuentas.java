package com.example.proyecto_iweb.models.beans;

import com.mysql.cj.jdbc.Blob;

public class Cuentas {

    private int idCuentas;
    private String nombre;
    private String apellido;
    private String nickname;
    private String direccion;
    private String correo;
    private String fotoNombre;
    private String fotoExtension;
    private Blob foto;
    private String descripcion;
    private Boolean desabilitado;
    private int idRol;
    private Roles roles;
    private String passwordHashed;
    private String passwordText;
    private double latitud;
    private double longitud;

    public Blob getFoto() {
        return foto;
    }


    public void setFoto(Blob foto) {
        this.foto = foto;
    }

    public String getPasswordHashed() {
        return passwordHashed;
    }

    public void setPasswordHashed(String passwordHashed) {
        this.passwordHashed = passwordHashed;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public int getIdRol() {
        return idRol;
    }

    public void setIdRol(int idRol) {
        this.idRol = idRol;
    }

    public Roles getRoles() {
        return roles;
    }

    public void setRoles(Roles roles) {
        this.roles = roles;
    }

    public int getIdCuentas() {
        return idCuentas;
    }

    public void setIdCuentas(int idCuentas) {
        this.idCuentas = idCuentas;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }


    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }


    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public Boolean getDesabilitado() {
        return desabilitado;
    }

    public void setDesabilitado(Boolean desabilitado) {
        this.desabilitado = desabilitado;
    }


    public String getFotoNombre() {
        return fotoNombre;
    }

    public void setFotoNombre(String fotoNombre) {
        this.fotoNombre = fotoNombre;
    }

    public String getFotoExtension() {
        return fotoExtension;
    }

    public void setFotoExtension(String fotoExtension) {
        this.fotoExtension = fotoExtension;
    }

    public String getPasswordText() {
        return passwordText;
    }

    public void setPasswordText(String passwordText) {
        this.passwordText = passwordText;
    }

    public double getLatitud() {
        return latitud;
    }

    public void setLatitud(double latitud) {
        this.latitud = latitud;
    }

    public double getLongitud() {
        return longitud;
    }

    public void setLongitud(double longitud) {
        this.longitud = longitud;
    }
}

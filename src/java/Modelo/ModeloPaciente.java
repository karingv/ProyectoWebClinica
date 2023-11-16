package Modelo;

import Modelo.Paciente;
import UTIL.conexionBD;
import java.util.*;
import java.sql.*;

public class ModeloPaciente {

    Connection cn = null;
    PreparedStatement pt = null;
    ResultSet rs = null;
    ArrayList<Paciente> lista = null;
    Paciente objPaciente = null;
    int contador=0;

    public boolean validarAcesso(Paciente Paciente) {
        boolean estado = false;
        try {
            cn = conexionBD.getConexionBD();
            pt = cn.prepareStatement("SELECT * FROM pacientes;");
            rs = pt.executeQuery();
            lista = new ArrayList<Paciente>();
            while (rs.next()) {
                objPaciente = new Paciente();
                objPaciente.setId_tipo(rs.getInt(11));
                objPaciente.setUsuario(rs.getString(9));
                objPaciente.setContraseña(rs.getString(10));
                lista.add(objPaciente);
            }
            pt.close();
            rs.close();
            cn.close();
        } catch (Exception e) {
        }
        for (Paciente objeto : lista) {
            if (Paciente.getId_tipo() == objeto.getId_tipo() && Paciente.getUsuario().equals(objeto.getUsuario())
                    && Paciente.getContraseña().equals(objeto.getContraseña())) {
                estado = true;
                break;
            }
        }
        return estado;
    }
    public int CodigoPaciente(String usuario){
        try {
            cn = conexionBD.getConexionBD();
            pt = cn.prepareStatement("SELECT * FROM pacientes where usuario like '"+usuario+"';");
            rs = pt.executeQuery();
            while (rs.next()) {
                objPaciente = new Paciente();
                objPaciente.setId_paciente(rs.getInt(1));
            }
            pt.close();
            rs.close();
            cn.close();
        } catch (Exception e) {
        }
        int codigo=objPaciente.getId_paciente();
        return codigo;
    }

    public ArrayList<Paciente> ListarPacientes() {
        try {
            cn = conexionBD.getConexionBD();
            pt = cn.prepareStatement("SELECT * FROM pacientes;");
            rs = pt.executeQuery();
            lista = new ArrayList<Paciente>();
            while (rs.next()) {
                objPaciente = new Paciente();
                objPaciente.setId_paciente(rs.getInt(1));
                objPaciente.setNombres(rs.getString(2));
                objPaciente.setApellidos(rs.getString(3));
                objPaciente.setDni(rs.getString(4));
                objPaciente.setFechanac(rs.getString(5));
                objPaciente.setSexo(rs.getString(6));
                objPaciente.setCelular(rs.getString(7));
                objPaciente.setCorreo(rs.getString(8));
                objPaciente.setUsuario(rs.getString(9));
                objPaciente.setContraseña(rs.getString(10));
                objPaciente.setId_tipo(rs.getInt(11));
                lista.add(objPaciente);
            }
            pt.close();
            rs.close();
            cn.close();
        } catch (Exception e) {
        }
        return lista;
    }
    public int InsertarPaciente(Paciente objPaciente){
        int estado=0;
        try {
            cn=conexionBD.getConexionBD();
            pt=cn.prepareStatement("INSERT INTO pacientes(id_paciente,nombres,apellidos,DNI,fecha_nac,sexo,celular,correo,usuario,contraseña,id_tipo) VALUES(?,?,?,?,?,?,?,?,?,?,?);");
            pt.setInt(1, contador);
            pt.setString(2, objPaciente.getNombres());
            pt.setString(3, objPaciente.getApellidos() );
            pt.setString(4, objPaciente.getDni());
            pt.setString(5, objPaciente.getFechanac() );
            pt.setString(6, objPaciente.getSexo() );
            pt.setString(7, objPaciente.getCelular() );
            pt.setString(8, objPaciente.getCorreo());
            pt.setString(9, objPaciente.getUsuario());
            pt.setString(10, objPaciente.getContraseña());
            pt.setInt(11, objPaciente.getId_tipo());
            estado=pt.executeUpdate();
            pt.close();
            cn.close();
        } catch (Exception e) {
        }
        contador++;
        return estado;
    }
     public int EliminarPaciente(Paciente objPaciente){
        int estado=0;
        try {
            cn=conexionBD.getConexionBD();
            pt=cn.prepareStatement("DELETE FROM pacientes WHERE id_paciente=?;");
            pt.setInt(1, objPaciente.getId_paciente());
            estado=pt.executeUpdate();
            pt.close();
            cn.close();
        } catch (Exception e) {
        }
        return estado;
    }
    public int ModificarPaciente(Paciente objPaciente){
        int estado=0;
        try {
            cn=conexionBD.getConexionBD();
            pt=cn.prepareStatement("UPDATE pacientes SET nombres=?, apellidos=?,DNI=?,fecha_nac=?,sexo=?,celular=?, correo=?, usuario=?,contraseña=?,id_tipo=? WHERE id_paciente='"+objPaciente.getId_paciente()+"';");
            
            pt.setString(1, objPaciente.getNombres());
            pt.setString(2, objPaciente.getApellidos());
            pt.setString(3, objPaciente.getDni());
            pt.setString(4, objPaciente.getFechanac());
            pt.setString(5, objPaciente.getSexo());
            pt.setString(6, objPaciente.getCelular());
            pt.setString(7, objPaciente.getCorreo());
            pt.setString(8, objPaciente.getUsuario());
            pt.setString(9, objPaciente.getContraseña());
            pt.setInt(10, objPaciente.getId_tipo());
            estado=pt.executeUpdate();
            pt.close();
            cn.close();
        } catch (Exception e) {
        }
        return estado;
    }
     public Paciente BuscarPacientexId(int id_paciente){
         try {
            cn = conexionBD.getConexionBD();
            pt = cn.prepareStatement("SELECT * FROM pacientes where id_paciente = '"+id_paciente+"'");
            rs = pt.executeQuery();
            while (rs.next()) {
                objPaciente = new Paciente();
                objPaciente.setId_paciente(rs.getInt(1));
                objPaciente.setNombres(rs.getString(2));
                objPaciente.setApellidos(rs.getString(3));
                objPaciente.setDni(rs.getString(4));
                objPaciente.setFechanac(rs.getString(5));
                objPaciente.setSexo(rs.getString(6));
                objPaciente.setCelular(rs.getString(7));
                objPaciente.setCorreo(rs.getString(8));
                objPaciente.setUsuario(rs.getString(9));
                objPaciente.setContraseña(rs.getString(10));
                objPaciente.setId_tipo(rs.getInt(11));;
            }
            pt.close();
            rs.close();
            cn.close();
        } catch (Exception e) {
        }
         return objPaciente;
     }
}

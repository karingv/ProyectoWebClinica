
package Modelo;

import Modelo.Medico;
import UTIL.conexionBD;
import java.util.*;
import java.sql.*;
public class ModeloMedico {
    
    Connection cn = null;
    PreparedStatement pt = null;
    ResultSet rs = null;
    ArrayList<Medico> lista = null;
    Medico objMedico = null;
    
    public ArrayList<Medico> ListarMedicos(){
        try {
            cn = conexionBD.getConexionBD();
            pt = cn.prepareStatement("SELECT * FROM medicos inner join especialidad using(id_esp)");
            rs = pt.executeQuery();
            lista = new ArrayList<Medico>();
            while (rs.next()) {
                objMedico = new Medico();
                objMedico.setId_med(rs.getInt(2));
                objMedico.setNombres(rs.getString(3));
                objMedico.setApellidos(rs.getString(4));
                objMedico.setSexo(rs.getString(5));
                objMedico.setNumcoleg(rs.getString(6));
                objMedico.setUsuario(rs.getString(7));
                objMedico.setContraseña(rs.getString(8));
                objMedico.setNomEsp(rs.getString(9));
                objMedico.setConsultorio(rs.getString(10));
                lista.add(objMedico);
            }
            pt.close();
            rs.close();
            cn.close();
        } catch (Exception e) {
        }
        return lista;
    }
    public int InsertarMedico(Medico objMedico){
        int estado=0;
        try {
            cn=conexionBD.getConexionBD();
            pt=cn.prepareStatement("INSERT INTO medicos(nombres,apellidos,sexo,numcoleg,usuario,contraseña,id_esp) VALUES(?,?,?,?,?,?,?);");
            
            pt.setString(1, objMedico.getNombres());
            pt.setString(2, objMedico.getApellidos() );
            pt.setString(3, objMedico.getSexo() );
            pt.setString(4, objMedico.getNumcoleg() );
            pt.setString(5, objMedico.getUsuario());
            pt.setString(6, objMedico.getContraseña());
            pt.setInt(7, objMedico.getId_esp());
            estado=pt.executeUpdate();
            pt.close();
            cn.close();
        } catch (Exception e) {
        }
        return estado;
    }
    public ArrayList<Medico> BuscarMedico(int esp){
        try {
            cn = conexionBD.getConexionBD();
            if(esp!=0 ){
                    pt = cn.prepareStatement("SELECT * FROM medicos inner join especialidad using(id_esp) where id_esp = '"+esp+"'");   
            }else if(esp==0){
                   pt = cn.prepareStatement("SELECT * FROM medicos inner join especialidad using(id_esp)");
            }
            rs = pt.executeQuery();
            lista = new ArrayList<Medico>();
            while (rs.next()) {
                objMedico = new Medico();
                objMedico.setId_med(rs.getInt(2));
                objMedico.setNombres(rs.getString(3));
                objMedico.setApellidos(rs.getString(4));
                objMedico.setSexo(rs.getString(5));
                objMedico.setNumcoleg(rs.getString(6));
                objMedico.setNomEsp(rs.getString(9));
                objMedico.setConsultorio(rs.getString(10));
                lista.add(objMedico);
            }
            pt.close();
            rs.close();
            cn.close();
            
        } catch (Exception e) {
        }
        return lista;
    }
    public Medico BuscarMedicoxId(int id_med){
        try {
            cn = conexionBD.getConexionBD();
            if(id_med!=0 ){
                    pt = cn.prepareStatement("SELECT * FROM medicos inner join especialidad using(id_esp) where id_med = '"+id_med+"'");   
            }else if(id_med==0){
                   pt = cn.prepareStatement("SELECT * FROM medicos inner join especialidad using(id_esp)");
            }
            rs = pt.executeQuery();
            lista = new ArrayList<Medico>();
            while (rs.next()) {
                objMedico = new Medico();
                objMedico.setId_med(rs.getInt(2));
                objMedico.setNombres(rs.getString(3));
                objMedico.setApellidos(rs.getString(4));
                objMedico.setSexo(rs.getString(5));
                objMedico.setNumcoleg(rs.getString(6));
                objMedico.setUsuario(rs.getString(7));
                objMedico.setContraseña(rs.getString(8));
                objMedico.setNomEsp(rs.getString(9));
                objMedico.setConsultorio(rs.getString(10));
                lista.add(objMedico);
            }
            pt.close();
            rs.close();
            cn.close();
            
        } catch (Exception e) {
        }
        return objMedico;
    }
    public boolean validarAcceso(Medico medico ){
        boolean estado=false;
        try {
            cn = conexionBD.getConexionBD();
            pt = cn.prepareStatement("SELECT * FROM medicos;");
            rs = pt.executeQuery();
            lista = new ArrayList<Medico>();
            while (rs.next()) {
                objMedico = new Medico();
                objMedico.setUsuario(rs.getString(6));
                objMedico.setContraseña(rs.getString(7));
                lista.add(objMedico);
            }
            pt.close();
            rs.close();
            cn.close();
        } catch (Exception e) {
        }
        for (Medico objeto : lista) {
            if (medico.getUsuario().equals(objeto.getUsuario())
                    && medico.getContraseña().equals(objeto.getContraseña())) {
                estado = true;
                break;
            }
        }
        
        return estado;
    }
    public int CodigoMedico(String usuario){
        int id_med;
        try {
            cn = conexionBD.getConexionBD();
            pt = cn.prepareStatement("SELECT id_med FROM medicos where usuario='"+usuario+"' ");
            rs = pt.executeQuery();
            while (rs.next()) {
                objMedico=new Medico();
                objMedico.setId_med(rs.getInt(1));
            }
            pt.close();
            rs.close();
            cn.close();
        } catch (Exception e) {
        }
        id_med=objMedico.getId_med();
        return id_med;
    }
    public int ModificarMedico(Medico objMedico){
        int estado=0;
        try {
            cn=conexionBD.getConexionBD();
            pt=cn.prepareStatement("UPDATE medicos SET nombres=?, apellidos=?,sexo=?, numcoleg=?, usuario=?, contraseña=? WHERE id_med='"+objMedico.getId_med()+"';");
            
            pt.setString(1, objMedico.getNombres());
            pt.setString(2, objMedico.getApellidos());
            pt.setString(3, objMedico.getSexo());
            pt.setString(4, objMedico.getNumcoleg());
            pt.setString(5, objMedico.getUsuario());
            pt.setString(6, objMedico.getContraseña());
            estado=pt.executeUpdate();
            pt.close();
            cn.close();
        } catch (Exception e) {
        }
        return estado;
    }
    public int ElminarMedico(int id_med){
        int estado=0;
        try {
            cn=conexionBD.getConexionBD();
            pt=cn.prepareStatement("DELETE FROM medicos WHERE id_med='"+id_med+"' ");
            estado=pt.executeUpdate();
            pt.close();
            cn.close();
        } catch (Exception e) {
        }
        return estado;
    }
}

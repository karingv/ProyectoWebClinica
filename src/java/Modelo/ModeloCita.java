
package Modelo;
import UTIL.conexionBD;
import java.util.*;
import java.sql.*;
import Modelo.*;

public class ModeloCita {
    Connection cn = null;
    PreparedStatement pt = null;
    ResultSet rs = null;
    ArrayList<Cita> lista = null;
    Cita objCita = null;
    int contador=0;
    
    public ArrayList<Cita> ListarCitas(){
        try {
            cn = conexionBD.getConexionBD();
            pt = cn.prepareStatement("SELECT * FROM `reservarcita` inner join especialidad using(id_esp) inner join medicos using (id_med) inner join horarios using(id_h) order by fecha asc; ");
            rs = pt.executeQuery();
            lista = new ArrayList<Cita>();
            while (rs.next()) {
                objCita = new Cita();
                objCita.setId_med(rs.getInt(2));
                objCita.setId_esp(rs.getInt(3));
                objCita.setId_rc(rs.getInt(4));
                objCita.setId_paciente(rs.getInt(5));
                objCita.setEstado(rs.getString(7));
                objCita.setEspecialidad(rs.getString(8));
                objCita.setNomMed(rs.getString(10));
                objCita.setApellMed(rs.getString(11));
                objCita.setConsultorio(rs.getString(9));
                objCita.setFecha(rs.getString(6));
                objCita.setHora(rs.getString(17));
                lista.add(objCita);
            }
            pt.close();
            rs.close();
            cn.close();
        } catch (Exception e) {
        }
        return lista;
    }
    
    public int InsertarReservaCita(Cita objCita){
        int estado=0;
        try {
            cn=conexionBD.getConexionBD();
            pt=cn.prepareStatement("INSERT INTO reservarcita(id_rc,id_paciente,fecha,id_h,id_med,id_esp,estado) VALUES(?,?,?,?,?,?,?)");
            pt.setInt(1, contador);
            pt.setInt(2, objCita.getId_paciente());
            pt.setString(3, objCita.getFecha());
            pt.setInt(4, objCita.getId_h());
            pt.setInt(5, objCita.getId_med());
            pt.setInt(6, objCita.getId_esp());
            pt.setString(7, objCita.getEstado());
            estado=pt.executeUpdate();
            pt.close();
            cn.close();
        } catch (Exception e) {
        }
        contador++;
        return estado;
    }
    public ArrayList<Cita> ListarCitasxPaciente(int id_paciente){
        try {
            cn = conexionBD.getConexionBD();
            pt = cn.prepareStatement("SELECT * FROM `reservarcita` inner join especialidad using(id_esp) inner join medicos using (id_med) inner join horarios using(id_h) WHERE id_paciente='"+id_paciente+"' ");
            rs = pt.executeQuery();
            lista = new ArrayList<Cita>();
            while (rs.next()) {
                objCita = new Cita();
                objCita.setId_rc(rs.getInt(4));
                objCita.setId_paciente(rs.getInt(5));
                objCita.setEspecialidad(rs.getString(8));
                objCita.setNomMed(rs.getString(10));
                objCita.setApellMed(rs.getString(11));
                objCita.setConsultorio(rs.getString(9));
                objCita.setFecha(rs.getString(6));
                objCita.setEstado(rs.getString(7));
                objCita.setHora(rs.getString(17));
                
                lista.add(objCita);
            }
            pt.close();
            rs.close();
            cn.close();
        } catch (Exception e) {
        }
        return lista;
    }
    public int EliminarCita(int id_rc){
        int estado=0;
        try {
            cn=conexionBD.getConexionBD();
            pt=cn.prepareStatement("DELETE FROM reservarcita WHERE id_rc='"+id_rc+"' ");
            estado=pt.executeUpdate();
            pt.close();
            cn.close();
        } catch (Exception e) {
        }
        return estado;
    }
    
   public int AtencionCita(int id_rc, String Estado){
       int estado=0;
        try {
            cn=conexionBD.getConexionBD();
            pt=cn.prepareStatement("UPDATE reservarcita set estado=? WHERE id_rc='"+id_rc+"' ");
            pt.setString(1, Estado);
            estado=pt.executeUpdate();
            pt.close();
            cn.close();
        } catch (Exception e) {
        }
        return estado;
       
   }
   public int Reprogramar(int id_rc, String fecha,int id_h){
       int estado=0;
       try {
            cn=conexionBD.getConexionBD();
            pt=cn.prepareStatement("UPDATE reservarcita set fecha=?,estado=?,id_h=? WHERE id_rc='"+id_rc+"' ");
            pt.setString(1,fecha );
            pt.setString(2, "PENDIENTE");
            pt.setInt(3, id_h);
            estado=pt.executeUpdate();
            pt.close();
            cn.close();
        } catch (Exception e) {
        }
       return estado;
   }
   
    public Cita BuscarCitasxId(int id_rc){
        try {
            cn = conexionBD.getConexionBD();
            pt = cn.prepareStatement("SELECT * FROM `reservarcita` inner join especialidad using(id_esp) inner join medicos using (id_med) inner join horarios using(id_h) WHERE id_rc='"+id_rc+"' ");
            rs = pt.executeQuery();
            while (rs.next()) {
                objCita = new Cita();
                objCita.setId_rc(rs.getInt(4));
                objCita.setId_paciente(rs.getInt(5));
                objCita.setEspecialidad(rs.getString(8));
                objCita.setNomMed(rs.getString(10));
                objCita.setApellMed(rs.getString(11));
                objCita.setConsultorio(rs.getString(9));
                objCita.setFecha(rs.getString(6));
                objCita.setHora(rs.getString(17));
                objCita.setEstado(rs.getString(7));
            }
            pt.close();
            rs.close();
            cn.close();
        } catch (Exception e) {
        }
        return objCita;
    }
    
}

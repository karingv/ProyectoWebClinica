
package Modelo;

import UTIL.conexionBD;
import java.util.ArrayList;
import Modelo.CitaxMedico;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


public class ModeloCitaxMedico {
    Connection cn = null;
    PreparedStatement pt = null;
    ResultSet rs = null;
    ArrayList<CitaxMedico> lista = null;
    CitaxMedico objCitaxMedico = null;
    int contador=0;
    
    public ArrayList<CitaxMedico> ListarCitasxMedico(int id_med){
        try {
            cn = conexionBD.getConexionBD();
            pt = cn.prepareStatement("SELECT * FROM `reservarcita` inner join pacientes using (id_paciente) inner join horarios using(id_h) WHERE id_med='"+id_med+"' order by fecha; ");
            rs = pt.executeQuery();
            lista = new ArrayList<CitaxMedico>();
            while (rs.next()) {
                objCitaxMedico = new CitaxMedico();
                objCitaxMedico.setId_rc(rs.getInt(3));
                objCitaxMedico.setNombreP(rs.getString(8));
                objCitaxMedico.setApellidoP(rs.getString(9));
                objCitaxMedico.setDniP(rs.getString(10));
                objCitaxMedico.setSexoP(rs.getString(12));
                objCitaxMedico.setFecha(rs.getString(4));
                objCitaxMedico.setHora(rs.getString(18));
                objCitaxMedico.setEstado(rs.getString(7));
                lista.add(objCitaxMedico);
            }
            pt.close();
            rs.close();
            cn.close();
        } catch (Exception e) {
        }
        return lista;
    }
}

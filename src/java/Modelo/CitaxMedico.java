
package Modelo;


public class CitaxMedico {
    int id_rc;
    int id_med;
    String nombreP;
    String apellidoP;
    String dniP;
    String sexoP;
    String fecha;
    String hora;
    String estado;

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public int getId_med() {
        return id_med;
    }

    public void setId_med(int id_med) {
        this.id_med = id_med;
    }
    

    public CitaxMedico() {
    }

    public int getId_rc() {
        return id_rc;
    }

    public void setId_rc(int id_cita) {
        this.id_rc = id_cita;
    }

    public String getNombreP() {
        return nombreP;
    }

    public void setNombreP(String nombreP) {
        this.nombreP = nombreP;
    }

    public String getApellidoP() {
        return apellidoP;
    }

    public void setApellidoP(String apellidoP) {
        this.apellidoP = apellidoP;
    }

    public String getDniP() {
        return dniP;
    }

    public void setDniP(String dniP) {
        this.dniP = dniP;
    }

    public String getSexoP() {
        return sexoP;
    }

    public void setSexoP(String sexoP) {
        this.sexoP = sexoP;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public String getHora() {
        return hora;
    }

    public void setHora(String hora) {
        this.hora = hora;
    }
    
    
}

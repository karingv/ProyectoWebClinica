
package Modelo;

public class Cita {
    int id_rc;
    int id_paciente;
    String fecha;
    int id_h;
    int id_med;
    int id_esp;
    String nomMed;
    String apellMed;
    String hora;
    String Consultorio;
    String especialidad;
    String estado;
    String dniP;

    public String getDniP() {
        return dniP;
    }

    public void setDniP(String dniP) {
        this.dniP = dniP;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public String getApellMed() {
        return apellMed;
    }

    public void setApellMed(String apellMed) {
        this.apellMed = apellMed;
    }

    public String getNomMed() {
        return nomMed;
    }

    public void setNomMed(String nomMed) {
        this.nomMed = nomMed;
    }

    public String getHora() {
        return hora;
    }

    public void setHora(String hora) {
        this.hora = hora;
    }

    public String getConsultorio() {
        return Consultorio;
    }

    public void setConsultorio(String Consultorio) {
        this.Consultorio = Consultorio;
    }

    public String getEspecialidad() {
        return especialidad;
    }

    public void setEspecialidad(String especialidad) {
        this.especialidad = especialidad;
    }

    public Cita() {
    }

    public int getId_rc() {
        return id_rc;
    }

    public void setId_rc(int id_rc) {
        this.id_rc = id_rc;
    }

    public int getId_paciente() {
        return id_paciente;
    }

    public void setId_paciente(int id_paciente) {
        this.id_paciente = id_paciente;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public int getId_h() {
        return id_h;
    }

    public void setId_h(int id_h) {
        this.id_h = id_h;
    }

    public int getId_med() {
        return id_med;
    }

    public void setId_med(int id_med) {
        this.id_med = id_med;
    }

    public int getId_esp() {
        return id_esp;
    }

    public void setId_esp(int id_esp) {
        this.id_esp = id_esp;
    }
    
}

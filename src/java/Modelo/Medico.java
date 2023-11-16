
package Modelo;

public class Medico {
    int id_med;
    String nombres;
    String apellidos;
    String sexo;
    String numcoleg;
    int id_esp;
    String nomEsp;
    String consultorio;
    String usuario;
    String contraseña;

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public String getContraseña() {
        return contraseña;
    }

    public void setContraseña(String contraseña) {
        this.contraseña = contraseña;
    }
    

    public String getNomEsp() {
        return nomEsp;
    }

    public void setNomEsp(String nomEsp) {
        this.nomEsp = nomEsp;
    }

    public String getConsultorio() {
        return consultorio;
    }

    public void setConsultorio(String consultorio) {
        this.consultorio = consultorio;
    }

    public Medico() {
    }

    public int getId_med() {
        return id_med;
    }

    public void setId_med(int id_med) {
        this.id_med = id_med;
    }

    public String getNombres() {
        return nombres;
    }

    public void setNombres(String nombres) {
        this.nombres = nombres;
    }

    public String getApellidos() {
        return apellidos;
    }

    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }

    public String getSexo() {
        return sexo;
    }

    public void setSexo(String sexo) {
        this.sexo = sexo;
    }

    public String getNumcoleg() {
        return numcoleg;
    }

    public void setNumcoleg(String numcoleg) {
        this.numcoleg = numcoleg;
    }

    public int getId_esp() {
        return id_esp;
    }

    public void setId_esp(int id_esp) {
        this.id_esp = id_esp;
    }
    
}

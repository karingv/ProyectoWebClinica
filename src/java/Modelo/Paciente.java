
package Modelo;

public class Paciente {
    int id_paciente;
    String nombres;
    String apellidos;
    String dni;
    String fechanac;
    String sexo;
    String celular;
    String correo;
    String usuario;
    String contraseña;
    int id_tipo;

    public Paciente() {
    }

    public Paciente(int id_paciente, String nombres, String apellidos, String dni, String fechanac, String sexo, String celular, String correo, String usuario, String contraseña, int id_tipo) {
        this.id_paciente = id_paciente;
        this.nombres = nombres;
        this.apellidos = apellidos;
        this.dni = dni;
        this.fechanac = fechanac;
        this.sexo = sexo;
        this.celular = celular;
        this.correo = correo;
        this.usuario = usuario;
        this.contraseña = contraseña;
        this.id_tipo = id_tipo;
    }

    public Paciente(String nombres, String apellidos, String dni, String fechanac, String sexo, String celular, String correo, String usuario, String contraseña, int id_tipo) {
        this.nombres = nombres;
        this.apellidos = apellidos;
        this.dni = dni;
        this.fechanac = fechanac;
        this.sexo = sexo;
        this.celular = celular;
        this.correo = correo;
        this.usuario = usuario;
        this.contraseña = contraseña;
        this.id_tipo = id_tipo;
    }
    
    

    public int getId_paciente() {
        return id_paciente;
    }

    public void setId_paciente(int id_paciente) {
        this.id_paciente = id_paciente;
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

    public String getDni() {
        return dni;
    }

    public void setDni(String dni) {
        this.dni = dni;
    }

    public String getFechanac() {
        return fechanac;
    }

    public void setFechanac(String fechanac) {
        this.fechanac = fechanac;
    }

    public String getSexo() {
        return sexo;
    }

    public void setSexo(String sexo) {
        this.sexo = sexo;
    }

    public String getCelular() {
        return celular;
    }

    public void setCelular(String celular) {
        this.celular = celular;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

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

    public int getId_tipo() {
        return id_tipo;
    }

    public void setId_tipo(int id_tipo) {
        this.id_tipo = id_tipo;
    }
    
    
}

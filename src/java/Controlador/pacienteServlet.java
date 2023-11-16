
package Controlador;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import javax.swing.JOptionPane;
import Modelo.*;
import javax.servlet.http.HttpSession;


public class pacienteServlet extends HttpServlet {

   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession sesion=request.getSession(true);
        String opcad = request.getParameter("op");
        String pagina = "";
        int op = Integer.parseInt(opcad);
        switch(op){
            case 1:{
                int tipo = Integer.parseInt(request.getParameter("tipousu"));
                String usuario= request.getParameter("usuario");
                String contraseña = request.getParameter("contra");
                 ModeloPaciente objPacienteModel = new ModeloPaciente();
                
                boolean estado;
                
                if(tipo==3){
                    Medico objMedico=new Medico();
                    ModeloMedico objMedicoModel=new ModeloMedico();
                    objMedico.setUsuario(usuario);
                    objMedico.setContraseña(contraseña);
                    ModeloCitaxMedico objCitaxMedico=new ModeloCitaxMedico();
                    ArrayList ListaCitas=objCitaxMedico.ListarCitasxMedico(objMedicoModel.CodigoMedico(usuario));
                    sesion.setAttribute("id_med", objMedicoModel.CodigoMedico(usuario));
                    request.setAttribute("listacitas", ListaCitas);
                    
                    estado=objMedicoModel.validarAcceso(objMedico);
                }else{
                Paciente objUsuario = new Paciente();
                objUsuario.setId_tipo(tipo);
                objUsuario.setUsuario(usuario);
                objUsuario.setContraseña(contraseña);
               
                int id_paciente=objPacienteModel.CodigoPaciente(usuario);

                estado = objPacienteModel.validarAcesso(objUsuario);
                
                sesion.setAttribute("id_paciente", id_paciente);
                }
                if (estado) {
                    if(tipo==3){
                        
                        pagina = "/PaginaPrincipalMed.jsp";
                    }else{
                       pagina = "/PaginaPrincipalLogueado.jsp";
                    }
                    request.setAttribute("tipo", tipo );
                    sesion.setAttribute("logueado", "1");
                    sesion.setAttribute("usuario_sesion", usuario);
                    sesion.setAttribute("tipo", tipo);
                } else {
                    pagina = "/login.jsp";
                    request.setAttribute("mensaje", "¡Usuario o contraseña incorrecta!");
                }
                break;
            }
            
            case 3:{
                pagina="/registrar.jsp";
                break;
             
            }
            case 4:{
                String nombres=request.getParameter("nombre");
                String apellidos=request.getParameter("apellido");
                String dni=request.getParameter("dni");
                String fechanac=request.getParameter("fechanac");
                String sexo=request.getParameter("sexo");
                String celular=request.getParameter("celular");
                String correo=request.getParameter("correo");
                String usuario=request.getParameter("usuario");
                String contraseña=request.getParameter("contraseña");
                int tipo=1;
                Paciente objPaciente = new Paciente(nombres,apellidos,dni,fechanac,sexo,celular,correo,usuario,contraseña,tipo);
                ModeloPaciente objPacienteModel = new ModeloPaciente();
                objPacienteModel.InsertarPaciente(objPaciente);
                JOptionPane.showMessageDialog(null,"Registro exitoso!!!");
                pagina="/login.jsp";
                break;
            }
            case 5:{
                int codigo=Integer.parseInt(request.getParameter("cod"));
                Paciente objPaciente=new Paciente();
                objPaciente.setId_paciente(codigo);
                ModeloPaciente objPacienteModel=new ModeloPaciente();
                objPacienteModel.EliminarPaciente(objPaciente);
                ArrayList ListaPacientes=objPacienteModel.ListarPacientes();
                request.setAttribute("listapaciente", ListaPacientes);
                JOptionPane.showMessageDialog(null, "Paciente eliminado");
                pagina ="/mantenimiento.jsp";
                break;
            }
            case 6:{
                sesion.invalidate();
                pagina="/PaginaPrincipal.jsp";
                break;
            }
            case 7:{
                int tipo=Integer.parseInt(sesion.getAttribute("tipo").toString());
                pagina = "/PaginaPrincipalLogueado.jsp";
                request.setAttribute("tipo", tipo );
                break;
            }
            case 8:{
                int cod=Integer.parseInt(request.getParameter("cod"));
                String nombres=request.getParameter("nombres");
                String apellidos=request.getParameter("apellidos");
                String dni=request.getParameter("dni");
                String fechanac=request.getParameter("fechanac");
                String sexo=request.getParameter("sexo");
                String celular=request.getParameter("celular");
                String correo=request.getParameter("correo");
                String usuario=request.getParameter("usuario");
                String contraseña=request.getParameter("contraseña");
                int tipo=Integer.parseInt(request.getParameter("tipo"));
                Paciente objPaciente=new Paciente(cod, nombres, apellidos, dni, fechanac, sexo, celular, correo, usuario, contraseña, tipo);
                request.setAttribute("datos", objPaciente);
                pagina ="/modificar.jsp"; 
                break;
            }
            case 10:{
                int cod=Integer.parseInt(request.getParameter("cod"));
                String nombres=request.getParameter("nombres");
                String apellidos=request.getParameter("apellidos");
                String dni=request.getParameter("dni");
                String fechanac=request.getParameter("fechanac");
                String sexo=request.getParameter("sexo");
                String celular=request.getParameter("celular");
                String correo=request.getParameter("correo");
                String usuario=request.getParameter("usuario");
                String contraseña=request.getParameter("contraseña");
                int tipo=Integer.parseInt(request.getParameter("tipo"));
                Paciente objPaciente=new Paciente(cod, nombres, apellidos, dni, fechanac, sexo, celular, correo, usuario, contraseña, tipo);
                ModeloPaciente objPacienteModel=new ModeloPaciente();
                objPacienteModel.ModificarPaciente(objPaciente);
                JOptionPane.showMessageDialog(null, "Usuario Modificado!!!");
                ArrayList ListaPacientes=objPacienteModel.ListarPacientes();
                request.setAttribute("listapaciente", ListaPacientes);
                pagina="/mantenimiento.jsp";
                break;
            }
            
                
        }
        
        getServletContext().getRequestDispatcher(pagina).forward(request, response);
        
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

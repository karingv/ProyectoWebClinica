
package Controlador;

import Modelo.Cita;
import Modelo.Medico;
import Modelo.ModeloCita;
import Modelo.ModeloMedico;
import Modelo.ModeloPaciente;
import Modelo.Paciente;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;


public class mantenimientoServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
       HttpSession sesion=request.getSession(true);
        String opcad = request.getParameter("op");
        int op=Integer.parseInt(opcad);
        String pagina = "";
        switch(op){
            case 1:{
                pagina="/AgregarUsuario.jsp";
                break;
            }
            case 2:{
                String nombres=request.getParameter("nombres");
                String apellidos=request.getParameter("apellidos");
                String dni=request.getParameter("dni");
                String fechanac=request.getParameter("fechanac");
                String sexo=request.getParameter("sexo");
                String celular=request.getParameter("celular");
                String correo=request.getParameter("correo");
                String usuario=request.getParameter("usuario");
                String contraseña=request.getParameter("contraseña");
                int tipo=Integer.parseInt(request.getParameter("id_tipo"));
                Paciente objPaciente = new Paciente(nombres,apellidos,dni,fechanac,sexo,celular,correo,usuario,contraseña,tipo);
                ModeloPaciente objPacienteModel = new ModeloPaciente();
                objPacienteModel.InsertarPaciente(objPaciente);
                JOptionPane.showMessageDialog(null,"Registro exitoso!!!");
                ArrayList ListaPacientes=objPacienteModel.ListarPacientes();
                request.setAttribute("listapaciente", ListaPacientes);
                pagina="/mantenimiento.jsp";
                break;
            }
            case 3:{
                ModeloPaciente objPacienteModel=new ModeloPaciente();
                ArrayList ListaPacientes=objPacienteModel.ListarPacientes();
                request.setAttribute("listapaciente", ListaPacientes);
                pagina = "/mantenimiento.jsp";

                break;
            }
            case 4:{
                int id_med=Integer.parseInt(request.getParameter("cod"));
                Medico objMedico=new Medico();
                ModeloMedico objMedicoModel=new ModeloMedico();
                objMedico=objMedicoModel.BuscarMedicoxId(id_med);
                sesion.setAttribute("id_med", id_med);
                sesion.setAttribute("nombres", objMedico.getNombres());
                sesion.setAttribute("apellidos", objMedico.getApellidos());
                sesion.setAttribute("sexo", objMedico.getSexo());
                sesion.setAttribute("numcoleg", objMedico.getNumcoleg());
                sesion.setAttribute("nomesp", objMedico.getNomEsp());
                sesion.setAttribute("usuario", objMedico.getUsuario());
                sesion.setAttribute("contraseña", objMedico.getContraseña());
                pagina="/ModificarMedico.jsp";
                break;
            }
            case 5:{
                int id_rc=Integer.parseInt(request.getParameter("id_rc"));
                ModeloCita objCitaModel=new ModeloCita();
                objCitaModel.EliminarCita(id_rc);
                ArrayList ListaCitas=objCitaModel.ListarCitas();
                request.setAttribute("listacitas", ListaCitas);
                pagina ="/historialcitas.jsp";
                break;
            }
            case 6:{
                int id_rc=Integer.parseInt(request.getParameter("id_rc"));
                ModeloCita objCitaModel=new ModeloCita();
                request.setAttribute("cita",objCitaModel.BuscarCitasxId(id_rc));
                pagina="/ReprogramarCitas.jsp";
                break;
            }
            case 7:{
                int id_rc=Integer.parseInt(request.getParameter("id_rc"));
                String fecha=request.getParameter("fecha");
                int id_h=Integer.parseInt(request.getParameter("id_h"));
                ModeloCita objCitaModel=new ModeloCita();
                objCitaModel.Reprogramar(id_rc, fecha, id_h);
                ArrayList ListaCitas=objCitaModel.ListarCitas();
                request.setAttribute("listacitas", ListaCitas);
                pagina ="/historialcitas.jsp";
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


package Controlador;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import javax.swing.JOptionPane;
import Modelo.Medico;
import Modelo.ModeloCitaxMedico;
import Modelo.ModeloMedico;
import Modelo.ModeloPaciente;
import javax.servlet.http.HttpSession;


public class medicoServlet extends HttpServlet {

   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession sesion=request.getSession(true);
        String opcad = request.getParameter("op");
        String pagina = "";
        int op = Integer.parseInt(opcad);
        switch(op){
            case 1:{
                ModeloMedico objMedicoModel=new ModeloMedico();
                ArrayList ListaMedicos=objMedicoModel.ListarMedicos();
                request.setAttribute("listamedicos", ListaMedicos);
                pagina="/VerMedicos.jsp";
                break;
            }
            case 2:{
                int esp=Integer.parseInt(request.getParameter("esp"));
                //String nombreMed=request.getParameter("nombreMed");
                ModeloMedico objMedicoModel=new ModeloMedico();
                ArrayList ListaMedicos=objMedicoModel.BuscarMedico(esp);
                request.setAttribute("listamedicos", ListaMedicos);
                pagina="/VerMedicos.jsp";
                break;
            }
            case 3:{
                int id_med=Integer.parseInt(sesion.getAttribute("id_med").toString());
                Medico objMedico=new Medico();
                ModeloMedico objMedicoModel=new ModeloMedico();
                objMedico=objMedicoModel.BuscarMedicoxId(id_med);
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
            case 4:{
                int id_med=Integer.parseInt(request.getParameter("id_med"));
                String nombres=request.getParameter("nombres");
                String apellidos=request.getParameter("apellidos");
                String sexo=request.getParameter("sexo");
                String numcoleg=request.getParameter("numcoleg");
                String usuario=request.getParameter("usuario");
                String contraseña=request.getParameter("contraseña");
                Medico objMedico=new Medico();
                objMedico.setId_med(id_med);
                objMedico.setNombres(nombres);
                objMedico.setApellidos(apellidos);
                objMedico.setSexo(sexo);
                objMedico.setNumcoleg(numcoleg);
                objMedico.setUsuario(usuario);
                objMedico.setContraseña(contraseña);
                ModeloMedico objMedicoModel=new ModeloMedico();
                ModeloCitaxMedico objCitaxMedico=new ModeloCitaxMedico();
                objMedicoModel.ModificarMedico(objMedico);
                if(sesion.getAttribute("tipo").equals(3)){
                ArrayList ListaCitas=objCitaxMedico.ListarCitasxMedico(objMedicoModel.CodigoMedico(usuario));
                request.setAttribute("listacitas", ListaCitas);
                pagina="/PaginaPrincipalMed.jsp";
                break;
                }else if(sesion.getAttribute("tipo").equals(2)){
                     ArrayList ListaMedicos=objMedicoModel.ListarMedicos();
                request.setAttribute("listamedicos", ListaMedicos);
                pagina="/VerMedicos.jsp";
                break;
                }
                
            }
            case 5:{
                pagina="/AgregarMedico.jsp";
                break;
            }
            case 6:{
                String nombres=request.getParameter("nombres");
                String apellidos=request.getParameter("apellidos");
                String sexo=request.getParameter("sexo");
                String numcoleg=request.getParameter("numcoleg");
                String usuario=request.getParameter("usuario");
                String contraseña=request.getParameter("contraseña");
                int id_med=Integer.parseInt(request.getParameter("id_esp"));
                Medico objMedico=new Medico();
                objMedico.setNombres(nombres);
                objMedico.setApellidos(apellidos);
                objMedico.setSexo(sexo);
                objMedico.setNumcoleg(numcoleg);
                objMedico.setUsuario(usuario);
                objMedico.setContraseña(contraseña);
                objMedico.setId_esp(id_med);
                ModeloMedico objMedicoModel=new ModeloMedico();
                objMedicoModel.InsertarMedico(objMedico);
                 ArrayList ListaMedicos=objMedicoModel.ListarMedicos();
                request.setAttribute("listamedicos", ListaMedicos);
                pagina="/VerMedicos.jsp";
                break;
                
            }
            case 7:{
                int id_med=Integer.parseInt(request.getParameter("cod"));
                ModeloMedico objMedicoModel=new ModeloMedico();
                objMedicoModel.ElminarMedico(id_med);
                ArrayList ListaMedicos=objMedicoModel.ListarMedicos();
                request.setAttribute("listamedicos", ListaMedicos);
                pagina="/VerMedicos.jsp";
                break;
                
            }
            
            case 8:{
                int id_med=Integer.parseInt(sesion.getAttribute("id_med").toString());
                Medico objMedico=new Medico();
                ModeloMedico objMedicoModel=new ModeloMedico();
                objMedico=objMedicoModel.BuscarMedicoxId(id_med);
                sesion.setAttribute("nombres", objMedico.getNombres());
                ModeloCitaxMedico objCitaxMedico=new ModeloCitaxMedico();
                ArrayList ListaCitas=objCitaxMedico.ListarCitasxMedico(id_med);
                request.setAttribute("listacitas", ListaCitas);
                pagina="/HistorialMedico.jsp";
                break;
            }
            case 9:{
                //Principal Medico
                int id_med=Integer.parseInt(sesion.getAttribute("id_med").toString());
                ModeloCitaxMedico objCitaxMedico=new ModeloCitaxMedico();
                ArrayList ListaCitas=objCitaxMedico.ListarCitasxMedico(id_med);
                request.setAttribute("listacitas", ListaCitas);
                pagina="/PaginaPrincipalMed.jsp";
                break;
            }
            case 10:{
                ModeloMedico objMedicoModel=new ModeloMedico();
                ArrayList ListaMedicos=objMedicoModel.ListarMedicos();
                request.setAttribute("listamedicos", ListaMedicos);
                pagina="/VerDatosMedico.jsp";
                break;
            }
            case 11:{
                ModeloPaciente objPacienteModel=new ModeloPaciente();
                ArrayList ListaPacientes=objPacienteModel.ListarPacientes();
                request.setAttribute("listapaciente", ListaPacientes);
                pagina = "/ListarUsuarios.jsp";
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

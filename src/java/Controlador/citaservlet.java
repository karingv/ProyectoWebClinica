
package Controlador;

import Modelo.ModeloCita;
import Modelo.ModeloCitaxMedico;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class citaservlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession sesion=request.getSession(true);
        String opcad = request.getParameter("op");
        int op=Integer.parseInt(opcad);
        String pagina = "";
        switch(op){
            case 1:{
                int id=Integer.parseInt(sesion.getAttribute("id_paciente").toString());
                ModeloCita objModelCita=new ModeloCita();
                ArrayList ListaCitas=objModelCita.ListarCitasxPaciente(id);
                request.setAttribute("listacitas", ListaCitas);
                //ModeloPaciente objPacienteModel=new ModeloPaciente();
                //request.setAttribute("codigo", codigo);
                pagina="/historial.jsp";
                break;
            }
            case 2:{
                int id_rc=Integer.parseInt(request.getParameter("id_rc"));
                int id_paciente=Integer.parseInt(request.getParameter("id_paciente"));
                ModeloCita objCitaModel=new ModeloCita();
                objCitaModel.EliminarCita(id_rc);
                ArrayList ListaCitas=objCitaModel.ListarCitasxPaciente(id_paciente);
                request.setAttribute("listacitas", ListaCitas);
                pagina ="/historial.jsp";
                break;
            }
            case 3:{
                String estado="ATENDIDO";
                int id_rc=Integer.parseInt(request.getParameter("id_rc"));
                ModeloCita objCitaModel=new ModeloCita();
                objCitaModel.AtencionCita(id_rc, estado);
                ModeloCitaxMedico objCitaxMedico=new ModeloCitaxMedico();
                int id_med=Integer.parseInt(sesion.getAttribute("id_med").toString());
                ArrayList ListaCitas=objCitaxMedico.ListarCitasxMedico(id_med);
                request.setAttribute("listacitas", ListaCitas);
                pagina="/PaginaPrincipalMed.jsp";
                break;
            }
            case 4:{
                String estado="NO ATENDIDO";
                int id_rc=Integer.parseInt(request.getParameter("id_rc"));
                ModeloCita objCitaModel=new ModeloCita();
                objCitaModel.AtencionCita(id_rc, estado);
                ModeloCitaxMedico objCitaxMedico=new ModeloCitaxMedico();
                int id_med=Integer.parseInt(sesion.getAttribute("id_med").toString());
                ArrayList ListaCitas=objCitaxMedico.ListarCitasxMedico(id_med);
                request.setAttribute("listacitas", ListaCitas);
                pagina="/PaginaPrincipalMed.jsp";
                break;
            }
            case 5:{
                ModeloCita objCitaModel=new ModeloCita();
                ArrayList ListaCitas=objCitaModel.ListarCitas();
                request.setAttribute("listacitas", ListaCitas);
                pagina="/historialcitas.jsp";
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

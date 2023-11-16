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

public class ReservarCitaServlet extends HttpServlet {

  
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession sesion=request.getSession(true);
        String opcad = request.getParameter("op");
        String pagina = "";
        int op = Integer.parseInt(opcad);
        switch(op){
            case 1:{
                int codigo=Integer.parseInt(request.getParameter("id_paciente"));
                int id_esp=Integer.parseInt(request.getParameter("id_esp"));
                Cita objcita=new Cita();
                objcita.setId_paciente(codigo);
                objcita.setId_esp(id_esp);
                request.setAttribute("datos", objcita);
                ModeloMedico objModelMedico=new ModeloMedico();
                ArrayList ListaMedicos=objModelMedico.BuscarMedico(id_esp);
                request.setAttribute("listamedicos", ListaMedicos);
                pagina="/reservarcita2.jsp";
                break;
            }
            case 2:{
                int id_paciente=Integer.parseInt(request.getParameter("id_paciente"));
                int id_esp=Integer.parseInt(request.getParameter("id_esp"));
                int id_med=Integer.parseInt(request.getParameter("id_med"));
                String fecha=request.getParameter("fecha");
                int id_h=Integer.parseInt(request.getParameter("hora"));
                Cita objcita=new Cita();
                objcita.setId_paciente(id_paciente);
                objcita.setFecha(fecha);
                objcita.setId_h(id_h);
                objcita.setId_med(id_med);
                objcita.setId_esp(id_esp);
                ModeloMedico objModelMedico=new ModeloMedico();
                ModeloPaciente objModelPaciente=new ModeloPaciente();
                objModelMedico.BuscarMedicoxId(id_med);
                request.setAttribute("datos", objcita );
                request.setAttribute("medico", objModelMedico.BuscarMedicoxId(id_med));
                request.setAttribute("paciente", objModelPaciente.BuscarPacientexId(id_paciente));
                pagina="/reservarcita3.jsp";
                break;
            }
            case 3:{
                int id_paciente=Integer.parseInt(request.getParameter("id_paciente"));
                int id_esp=Integer.parseInt(request.getParameter("id_esp"));
                int id_med=Integer.parseInt(request.getParameter("id_med"));
                String fecha=request.getParameter("fecha");
                int id_h=Integer.parseInt(request.getParameter("hora"));
                String estado="PENDIENTE";
                Cita objcita=new Cita();
                objcita.setId_paciente(id_paciente);
                objcita.setFecha(fecha);
                objcita.setId_h(id_h);
                objcita.setId_med(id_med);
                objcita.setId_esp(id_esp);
                objcita.setEstado(estado);
                ModeloCita objModelCita=new ModeloCita();
                objModelCita.InsertarReservaCita(objcita);
                JOptionPane.showMessageDialog(null, "Cita Reservada \n Presentarse 30 min antes");
                int tipo=Integer.parseInt(request.getParameter("tipo"));
                request.setAttribute("tipo", tipo );
                if(sesion.getAttribute("tipo").equals(1) || sesion.getAttribute("tipo").equals(2)) {
                    pagina = "/PaginaPrincipalLogueado.jsp";
                    break;
                }else if(sesion.getAttribute("tipo").equals(3)){
                    ModeloCitaxMedico objCitaxMedico=new ModeloCitaxMedico();
                    ArrayList ListaCitas=objCitaxMedico.ListarCitasxMedico(Integer.parseInt(sesion.getAttribute("id_med").toString()));
                    request.setAttribute("listacitas", ListaCitas);
                    pagina="/PaginaPrincipalMed.jsp";
                    break;
                }
                
            }
            case 4:{
                int id_paciente=Integer.parseInt(request.getParameter("id_paciente"));
                sesion.setAttribute("id_paciente", id_paciente);
                pagina="/reservarcita.jsp";
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

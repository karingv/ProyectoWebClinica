<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList" %>
<%@page import="Modelo.*" %>
<%! 
    ArrayList<Medico> ListaMedicos;
    Cita objCita;
    Medico objMedico;
    Paciente objPaciente;
%>
<%
    ListaMedicos = (ArrayList<Medico>) request.getAttribute("listamedicos");
    objCita = (Cita) request.getAttribute("datos");
    objMedico = (Medico) request.getAttribute("medico");
    objPaciente = (Paciente) request.getAttribute("paciente");
%>
<%@page session="true" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>RESERVAR CITA - PASO3</title>
        <!-- Estilos -->
        <link rel="stylesheet" href="css/PaginaPrincipal.css">
        <link rel="stylesheet" href="css/reservarcita3.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    </head>
    <script>
        function medicos() {
            document.form.action = "<%=request.getContextPath()%>/medicoServlet";
            document.form.method = "POST";
            document.form.op.value = "1";
            document.form.submit();
        }
        function salir() {
            document.form.action = "<%=request.getContextPath()%>/pacienteServlet";
            document.form.method = "POST";
            document.form.op.value = "6";
            document.form.submit();
        }
        function principal() {
            document.form.action = "<%=request.getContextPath()%>/pacienteServlet";
            document.form.method = "POST";
            document.form.op.value = "7";
            document.form.submit();
        }
        function reservar1() {
            document.form.action = "<%=request.getContextPath()%>/ReservarCitaServlet";
            document.form.method = "GET";
            document.form.op.value = "1";
            document.form.submit();
        }
        function reservarCita() {
            document.form.action = "<%=request.getContextPath()%>/ReservarCitaServlet";
            document.form.method = "GET";
            document.form.op.value = "3";
            document.form.submit();
        }
        function principalM(){
            document.form.action = "<%=request.getContextPath()%>/medicoServlet";
            document.form.method = "POST";
            document.form.op.value = "9";
            document.form.submit();
        }
        function mantenimiento() {
            document.form.action = "<%=request.getContextPath()%>/mantenimientoServlet";
            document.form.method = "POST";
            document.form.op.value = "3";
            document.form.submit();
        }
        function historial() {
            document.form.action = "<%=request.getContextPath()%>/citaservlet";
            document.form.method = "GET";
            document.form.op.value = "1";
            document.form.submit();
        }
        function historialcitas() {
            document.form.action = "<%=request.getContextPath()%>/citaservlet";
            document.form.method = "POST";
            document.form.op.value = "5";
            document.form.submit();
        }
    </script>
    <body>
        <!-- Encabezado-->
        <header class="header">
            <div class="container">
                <div class="logo"><img src="img/logo.png"></div>
                <nav class="menu">
                    <ul>
                            <li>
                                <%  if (session.getAttribute("logueado") != null) {%>
                                <a>Bienvenido: <%=session.getAttribute("usuario_sesion")%></a>
                                <ul class="menu_inside">
                                <%  if (session.getAttribute("logueado") != null && session.getAttribute("tipo").equals(2))  {%>
                                <li >  
                                    <a onclick="historialcitas()" >Historial Citas</a>            
                                </li>
                                <%} else if(session.getAttribute("tipo").equals(1)){ %>
                                <li >  
                                    <a onclick="historial()" >Historial</a>            
                                </li>
                                <% } %>
                            </ul>
                            </li>  

                            <%} else {%>
                            <li>
                                <a>¿Tienes una cuenta?</a>
                                <ul  class="menu_inside">
                                    <li >
                                        <a href="login.jsp">Iniciar sesión</a>  
                                        <form action="login.jsp" method="post"></form>             
                                    </li>
                                </ul>                                
                            </li>   
                            <% } %>
                        </ul>
                </nav>
                <div class="btn-menu"><label for="btn-menu">☰</label></div>
            </div>
            <!-- Menu lateral -->
            <input type="checkbox" id="btn-menu">
            <div class="container-menu">
                <div class="cont-menu">
                    <nav>
                        <%  if (session.getAttribute("tipo").equals(1)||session.getAttribute("tipo").equals(2)) {%>
                        <a onclick="principal()"  style="color: rgb(255,255,255)">Pagina Principal</a>
                        <%}else if(session.getAttribute("tipo").equals(3)){ %>
                        <a onclick="principalM()"  style="color: rgb(255,255,255)">Pagina Principal</a>
                        <% } %>
                        <a onclick="medicos()">Ver médicos</a>
                        <a href="especialidad.jsp">Especialidades</a>
                        <a href="nosotros.jsp">Nosotros</a>
                        <a href="contacto.jsp">Contacto</a>
                        <%  if (session.getAttribute("logueado") != null) {%>
                        <a onclick="salir()">Cerrar sesión</a>
                        <%}%>
                        <%if (session.getAttribute("tipo").equals(2)) { %>  
                            <a onclick="mantenimiento()" style="color: rgb(255,255,255)">Mantenimiento</a>
                        <% }%>
                    </nav>
                    <label for="btn-menu"><i class="fas fa-times"></i>️</label>
                </div>
            </div>
        </header>
        <br><br><br><br><br><br><br>


        <!-- Contenedor -->
        <div class="contenedor">
            <div id="menu">
                <h2>Reservar cita  -
                    <%  if (session.getAttribute("logueado") != null) {%>
                    <a><%=session.getAttribute("usuario_sesion")%></a><%}%>
                </h2><br>
                <ul>
                    <li><a href="reservarcita.jsp"><img src="img/historia-del-hospital.png">&nbsp;Paso 1</a></li>
                    <li><a onclick="reservar1()"><img src="img/doctor-hospital.png">&nbsp;Paso 2</a></li>
                    <li><a href="#" class="active"><img src="img/calendario-hospital.png">&nbsp;Paso 3</a></li>
                </ul>
            </div>

            <div id="formularios">
                <form name="form" action="" id="paso_3">
                    <input type="hidden" name="op">
                    <input type="hidden" name="id_paciente" value="<%=objCita.getId_paciente()%>">
                    <input type="hidden" name="hora" value="<%=objCita.getId_h()%>">
                    <input type="hidden" name="id_med" value="<%=objCita.getId_med()%>">
                    <input type="hidden" name="id_esp" value="<%=objCita.getId_esp()%>">
                    <input type="hidden" name="tipo" value="<%=objPaciente.getId_tipo()%>">
                    <h2>Datos de tu cita</h2>
                    <div class="datos" id="datos">

                        <div class="row">
                            <h5>Paciente: &nbsp;<input type="text" name="txtnombre" value="<%=objPaciente.getNombres()%>"></h5>                      
                        </div>
                        <div class="row">
                            <h5>Especialidad: &nbsp;<input type="text" name="txtespecialidad" value="<%=objMedico.getNomEsp()%>"></h5>                      
                        </div> 
                        <div class="row">
                            <h5>Médico: &nbsp;<input type="text" name="txtmedico" value="<%=objMedico.getNombres()%> "></h5>                      
                        </div> 
                        <div class="row">
                            <h5>Consultorio: &nbsp;<input type="text" name="txtconsultorio" value="<%=objMedico.getConsultorio()%>"></h5>                      
                        </div>
                        <div class="row">
                            <h5>Fecha: &nbsp;<input type="text" name="fecha" value="<%=objCita.getFecha()%>"></h5>                      
                        </div>
                        <div class="row">
                            <%String hora = "";
                                switch (objCita.getId_h()) {
                                    case 1:
                                        hora = "08:00 a.m.";
                                        break;
                                    case 2:
                                        hora = "10:00 a.m.";
                                        break;
                                    case 3:
                                        hora = "02:00 p.m.";
                                        break;
                                    case 4:
                                        hora = "04:00 p.m.";
                                        break;
                                }%>
                            <h5>Hora: &nbsp;<input type="text" name="txthora" value="<%=hora%>"></h5>                      
                        </div>
                    </div>
                    <div class="boton" id="boton"><input onclick="reservarCita()" type="submit" value="Reserva y paga el dia de la cita"></div>
                </form>
            </div> 
        </div>


        <!--Footer-->
        <footer>
            <div class="partFooter">
                <div class="social-media">
                    <i class="fab fa-facebook-f"></i>
                    <i class="fab fa-youtube"></i>
                </div>
                <br>
                <div class="info">
                    <i class="fas fa-phone-alt">(01) 617-1111&nbsp;|&nbsp;</i>
                    <i class="fas fa-map-marker-alt">Av. República de Panamá 3606, San Isidro 15047</i>
                </div>
            </div>
        </footer>


        <!--Scripts-->
        <script src="https://kit.fontawesome.com/1a98240850.js" crossorigin="anonymous"></script>  
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>
    </body>
</html>

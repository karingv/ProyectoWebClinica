<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList" %>
<%@page import="Modelo.Medico" %>
<%@page import="Modelo.Cita" %>
<!DOCTYPE html>
<%!
    ArrayList<Medico> ListaMedicos;
    Cita objCita;
%>
<%
    ListaMedicos = (ArrayList<Medico>) request.getAttribute("listamedicos");
    objCita = (Cita) request.getAttribute("datos");
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>RESERVAR CITA - PASO2</title>
        <!-- Estilos -->
        <link rel="stylesheet" href="css/PaginaPrincipal.css">
        <link rel="stylesheet" href="css/reservarcita2.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    </head>
    <script>
        function reservar3() {
            document.form.action = "<%=request.getContextPath()%>/ReservarCitaServlet";
            document.form.method = "GET";
            document.form.op.value = "2";
            document.form.submit();
        }

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
                            <a>Bienvenido: <%=session.getAttribute("usuario_sesion")%></a><%}%>
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
                        <a onclick="medicos()" style="color: rgb(255,255,255)">Ver médicos</a>
                        <a href="especialidad.jsp">Especialidades</a>
                        <a href="nosotros.jsp">Nosotros</a>
                        <a href="contacto.jsp">Contacto</a>
                        <%  if (session.getAttribute("logueado") != null) {%>
                        <a onclick="salir()" style="color: rgb(255,255,255)">Cerrar sesión</a>
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
                    <li><a href="#" class="active"><img src="img/doctor-hospital.png">&nbsp;Paso 2</a></li>
                    <li><a href="#"><img src="img/calendario-hospital.png">&nbsp;Paso 3</a></li>
                </ul>
            </div>
            <div id="formularios">
                <form name="form" action="reservarcita3.jsp" method="POST" id="paso_2">
                    <input type="hidden" name="op">
                    <input type="hidden" name="id_paciente" value="<%=objCita.getId_paciente()%>">
                    <input type="hidden" name="id_esp" value="<%=objCita.getId_esp()%>">
                    <h5>Selecciona un médico</h5><br>
                    <select name="id_med">
                        <option selected>[-------Seleccionar-------]</option>
                        <% for (Medico obj : ListaMedicos) {%>
                        <option value="<%=obj.getId_med()%>"><%=obj.getNombres()%>,<%=obj.getApellidos()%></option> 
                        <% }%>
                    </select><br>

                    <h5>Selecciona una fecha</h5><br>
                    <input type="date" id="start" name="fecha" value="" min="2019-01-01" max="2021-12-31"><br>

                    <input type="button" id="boton_hora" onclick="mostrar()" value="Ver horarios disponibles:"><br>
                    <div  class="hora" id="hora" style="display:none">
                        <input type="radio" name="hora"  value="1" checked>08:00 a.m.
                        <input type="radio" name="hora" value="2" >10:00 a.m.
                        <input type="radio" name="hora"  value="3">02:00 p.m.
                        <input type="radio" name="hora" value="4">04:00 p.m.
                    </div>
                    <div class="boton" id="boton"><input type="submit" onclick="reservar3()" value="Continuar"></div>
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

        <!-- JS -->
        <script src="js/jquery.js"></script> 
        <script>
                        $("#boton_hora").click(function mostrar() {
                            $("#hora").show("slow");
                        });

        </script>


        <!--Scripts-->
        <script src="https://kit.fontawesome.com/1a98240850.js" crossorigin="anonymous"></script>  
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>

    </body>
</html>

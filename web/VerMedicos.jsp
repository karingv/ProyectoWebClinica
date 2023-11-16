<%@page import="java.util.ArrayList" %>
<%@page import="Modelo.Medico" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%!  
    ArrayList<Medico> ListaMedicos;
%>
<%
    
    ListaMedicos = (ArrayList<Medico>) request.getAttribute("listamedicos");
%>

<%@page session="true" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>BUSCAR MÉDICO</title>
        <!-- Estilos -->
        <link rel="stylesheet" href="css/PaginaPrincipal.css">
        <link rel="stylesheet" href="css/VerMedicos.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    </head>
    <script>
        function agregarmedico() {
            document.form.action = "<%=request.getContextPath()%>/medicoServlet";
            document.form.method = "POST";
            document.form.op.value = "5";
            document.form.submit();
        }
        function eliminar(cod) {
            document.form.action = "<%=request.getContextPath()%>/medicoServlet";
            document.form.method = "POST";
            document.form.op.value = "7";
            document.form.cod.value = cod;
            document.form.submit();
        }
        function modificar(cod) {
            document.form.action = "<%=request.getContextPath()%>/mantenimientoServlet";
            document.form.method = "GET";
            document.form.op.value = "4";
            document.form.cod.value = cod;
            document.form.submit();
        }
        function buscar() {
            document.form.action = "<%=request.getContextPath()%>/medicoServlet";
            document.form.method = "POST";
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
        function mantenimiento() {
            document.form.action = "<%=request.getContextPath()%>/mantenimientoServlet";
            document.form.method = "POST";
            document.form.op.value = "3";
            document.form.submit();
        }
        function listarusuarios(){
            document.form.action = "<%=request.getContextPath()%>/medicoServlet";
            document.form.method = "POST";
            document.form.op.value = "11";
            document.form.submit();
        }
        function principalM(){
            document.form.action = "<%=request.getContextPath()%>/medicoServlet";
            document.form.method = "POST";
            document.form.op.value = "9";
            document.form.submit();
        }
    </script>
    <body>
        <!-- Encabezado-->
        <header class="header">
            <form>
                <div class="container">
                    <div class="logo">
                        <img src="img/logo.png"  >
                    </div>
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
                    <div class="btn-menu">
                        <label for="btn-menu">☰</label>
                    </div>
                </div>
                <!-- Menu lateral -->
                <input type="checkbox" id="btn-menu">
                <div class="container-menu">
                    <div class="cont-menu">
                        <nav>
                            <%  if (session.getAttribute("logueado") != null) {
                                   if (session.getAttribute("tipo").equals(1)){%>
                                       <a onclick="principal()" style="color: rgb(255,255,255)">Pagina Principal</a>
                                        <a href="reservarcita.jsp" style="color: rgb(255,255,255)">Reservar cita</a>
                            <%     }else if(session.getAttribute("tipo").equals(2)){ %>
                                       <a onclick="principal()" style="color: rgb(255,255,255)">Pagina Principal</a>
                                       <a onclick="listarusuarios()" style="color: rgb(255,255,255)">Reservar cita</a>
                                <% }else if(session.getAttribute("tipo").equals(3)){ %>
                                       <a onclick="principalM()" style="color: rgb(255,255,255)">Pagina Principal</a>
                                <% }
                            } else {%>
                            <a href="PaginaPrincipal.jsp">Pagina Principal</a>
                            <a href="login.jsp" style="color: rgb(255,255,255)">Reservar cita</a>
                            <%}%>
                            <a href="especialidad.jsp">Especialidades</a>
                            <a href="nosotros.jsp">Nosotros</a>
                            <a href="contacto.jsp">Contacto</a>
                            <%  if (session.getAttribute("logueado") != null) {%>
                            <a onclick="salir()" style="color: rgb(255,255,255)">Cerrar sesión</a>
                            <%}%>
                            <%if (session.getAttribute("logueado") != null && session.getAttribute("tipo").equals(2)) { %>  
                            <a onclick="mantenimiento()" style="color: rgb(255,255,255)">Mantenimiento</a>
                        <% } %>
                        </nav>
                        <label for="btn-menu">
                            <i class="fas fa-times"></i>️
                        </label>
                    </div>
                </div>
            </form>
        </header>
        <!-- Contenedor -->
        <form name="form">
            <input type="hidden" name="op">
            <input type="hidden" name="cod">
            <div class="contenedor">
                <%  if (session.getAttribute("logueado") != null && session.getAttribute("tipo").equals(2)) {%>
                <h1>Lista de Médicos</h1><br>
                      <button class="btn btn-warning style" onclick="agregarmedico()">Agregar médico</button><br>       
                <%}else {%>   
                <h1>Búsqueda de doctores</h1>
                <% }%>
                <div id="tabla1">
                    <table>
                        <tr>
                            <td>
                                <h5>Seleccione una especialidad</h5><br><br>
                                <select name="esp">
                                    <option value="0" selected>[-------Seleccionar-------]</option>
                                    <option value="1">MEDICINA INTERNA</option>
                                    <option value="2">BANCO DE SANGRE</option>
                                    <option value="3">CARDIOLOGÍA</option>
                                    <option value="4">CIRUGÍA GENERAL</option>
                                    <option value="5">DERMATOLOGIA</option>
                                    <option value="6">GASTROENTEROLOGÍA</option> 
                                    <option value="7">NEUROLOGIA</option>
                                    <option value="8">PEDIATRÍA</option>
                                    <option value="9">PSICOLOGÍA</option>
                                    <option value="10">TRAUMATOLOGÍA</option>
                                </select>
                            </td>
                        </tr>
                        <!--<tr>
                            <td>
                                <h5>Ingrese nombre del médico</h5><br><br>
                                <input type="text" name="nombreMed" value="" placeholder="Nombre médico">
                            </td>
                        </tr>-->      
                    </table>
                </div><br>

                <div class="boton">
                    <input type="submit" onclick="buscar()" value="Buscar">
                </div>
                
                <div id="tabla2">
                    <table>
                        <thead>
                            <tr>
                                <th>Código</th>
                                <th>Nombres</th>
                                <th>Apellidos</th>
                                <th>Especialidad</th>
                                <th>Sexo</th>
                                <th>Número de colegiatura</th>
                                <th>Consultorio</th>
                                <%  if (session.getAttribute("logueado") != null && session.getAttribute("tipo").equals(2)) {%>
                                <th>Modificar</th> 
                                <th>Eliminar</th>
                                <% }%>
                            </tr>
                        </thead>
                        <%
                            for (Medico obj : ListaMedicos) {
                        %>  
                        <tr>
                            <td><%=obj.getId_med()%></td>
                            <td><%=obj.getNombres()%></td>
                            <td><%=obj.getApellidos()%></td>
                            <td><%=obj.getNomEsp()%></td> 
                            <td><%=obj.getSexo()%></td>
                            <td><%=obj.getNumcoleg()%></td>
                            <td><%=obj.getConsultorio()%></td>
                            
                                <%  if (session.getAttribute("logueado") != null && session.getAttribute("tipo").equals(2)) {%>
                            <td>
                                <button class="btn btn-info" onclick="modificar(<%=obj.getId_med() %>)">Modificar</button>
                            </td>
                            <td>
                                <button class="btn btn-danger" onclick="eliminar(<%=obj.getId_med() %>)">Eliminar</button> 
                            </td>
                                <% }%>
                            
                        </tr>  
                        <% } %>
                    </table>
                </div>
            </div>
        </form>        
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

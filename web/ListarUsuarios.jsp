<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true" %>
<%@page import="java.util.ArrayList" %>
<%@page import="Modelo.*" %>
<%!
    ArrayList<Paciente> ListaPacientes;
%>
<%
    ListaPacientes = (ArrayList<Paciente>) request.getAttribute("listapaciente");

%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>PAGINA PRINCIPAL MÉDICO</title>
        <!-- Estilos -->
        <link rel="stylesheet" href="css/PaginaPrincipal.css">
        <link rel="stylesheet" href="css/mantenimiento.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    </head>
    <script>
        function modificar(){
            document.form2.action = "<%=request.getContextPath()%>/medicoServlet";
            document.form2.method = "POST";
            document.form2.op.value = "3";
            document.form2.submit();
        }
        function principal() {
            document.form.action = "<%=request.getContextPath()%>/pacienteServlet";
            document.form.method = "POST";
            document.form.op.value = "7";
            document.form.submit();
        }
        function salir() {
            document.form.action = "<%=request.getContextPath()%>/pacienteServlet";
            document.form.method = "POST";
            document.form.op.value = "6";
            document.form.submit();
        }
        function historialmedico(){
            document.form2.action = "<%=request.getContextPath()%>/medicoServlet";
            document.form2.method = "POST";
            document.form2.op.value = "8";
            document.form2.submit();
        }
        function principalM(){
            document.form2.action = "<%=request.getContextPath()%>/medicoServlet";
            document.form2.method = "POST";
            document.form2.op.value = "9";
            document.form2.submit();
        }
        function datosmedicos(){
            document.form2.action = "<%=request.getContextPath()%>/medicoServlet";
            document.form2.method = "POST";
            document.form2.op.value = "10";
            document.form2.submit();
        }
        function reservarcita(id_paciente){
            document.form2.action = "<%=request.getContextPath()%>/ReservarCitaServlet";
            document.form2.method = "POST";
            document.form2.op.value = "4";
            document.form2.id_paciente.value=id_paciente;
            document.form2.submit();
        }
        function medicos() {
            document.form.action = "<%=request.getContextPath()%>/medicoServlet";
            document.form.method = "POST";
            document.form.op.value = "1";
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
                                <a>Bienvenido: <%=session.getAttribute("usuario_sesion")%></a><% } %>
                            
                        </li>    
                    </ul>
                </nav>
                <div class="btn-menu"><label for="btn-menu">☰</label></div>
            </div>
            <!-- Menu lateral -->
            <form name="form">
                <input type="hidden"  name="op"> 
                <input type="checkbox" id="btn-menu">
                <div class="container-menu">

                    <div class="cont-menu">
                        <nav>
                            <%  if (session.getAttribute("logueado") != null && session.getAttribute("tipo").equals(2)) {%>
                            <a onclick="principal()" style="color: rgb(255,255,255)">Pagina Principal</a><% } %>
                            <a onclick="medicos()" style="color: rgb(255,255,255)">Ver médicos</a>
                            <a href="especialidad.jsp">Especialidades</a>
                            <a href="nosotros.jsp">Nosotros</a>
                            <a href="contacto.jsp">Contacto</a>
                            <a onclick="salir()" style="color: rgb(255,255,255)">Cerrar sesión</a>
                        </nav>
                        <label for="btn-menu"><i class="fas fa-times"></i>️</label>
                    </div>
                </div>
            </form>
        </header>
        <br>
        <!-- Contenedor -->
        <form name="form2">
            <input type="hidden"  name="op">
            <input type="hidden"  name="id_rc">
            <input type="hidden"  name="id_paciente">
            <div class="contenedor">   
                <h1>Reservar Cita</h1><br>
                <div>
                    <%if(session.getAttribute("tipo").equals(3)){ %>
                    <div class="row">
                        <div class="panel-body">
                            <button class="btn btn-warning style"  onclick="modificar()" >Modificar datos - Médico</button>  &nbsp; &nbsp; 
                            <button class="btn btn-warning style"  onclick="principalM()" >Citas Pendientes</button> &nbsp; &nbsp;
                            <button class="btn btn-warning style"  onclick="historialmedico()" >Historial de Citas</button> &nbsp; &nbsp;
                            <button class="btn btn-warning style"  onclick="datosmedicos()" >Ver Datos</button> &nbsp; &nbsp;
                        </div>
                    </div><% } %><br>
                    <table class="table table-striped table-bordered dt-responsive nowrap">
                        <thead style="background-color: rgb(3, 64, 150); color: white;">
                            <tr >
                                <th>Código</th>
                                <th>Nombres</th>
                                <th>Apellidos</th>
                                <th>DNI</th>
                                <th><center>Reservar Cita</center> </th>
                            </tr>
                        </thead>
                        <tbody> 
                            <%
                               for (Paciente obj : ListaPacientes) {
                               
                            %> 
                            <tr>
                                <td><%=obj.getId_paciente() %></td>
                                <td><%=obj.getNombres() %></td>
                                <td><%=obj.getApellidos() %></td>
                                <td><%=obj.getDni() %></td>
                                <td>
                                    <a class="btn btn-primary" onclick="reservarcita(<%=obj.getId_paciente() %>)">Reservar Cita</a>
                                </td>
                            </tr>
                            <%}  %>
                        </tbody> 
                    </table>
                </div>
            </div>
        </form>
        <!--Scripts-->
        <script src="https://kit.fontawesome.com/1a98240850.js" crossorigin="anonymous"></script>  
    </body>
</html>

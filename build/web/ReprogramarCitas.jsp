<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true" %>
<%@page import="java.util.ArrayList" %>
<%@page import="Modelo.*" %>
<%!
    Cita cita;
%>
<%
    cita= (Cita) request.getAttribute("cita");

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
        function listarusuarios(){
            document.form2.action = "<%=request.getContextPath()%>/medicoServlet";
            document.form2.method = "POST";
            document.form2.op.value = "11";
            document.form2.submit();
        }
        function medicos() {
            document.form.action = "<%=request.getContextPath()%>/medicoServlet";
            document.form.method = "POST";
            document.form.op.value = "1";
            document.form.submit();
        }
        function historialcitas() {
            document.form.action = "<%=request.getContextPath()%>/citaservlet";
            document.form.method = "POST";
            document.form.op.value = "5";
            document.form.submit();
        }
        function reprogramarcita(){
            document.form2.action = "<%=request.getContextPath()%>/mantenimientoServlet";
            document.form2.method = "POST";
            document.form2.op.value = "7";
            document.form2.submit();
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
                            <a onclick="historialcitas()" style="color: rgb(255,255,255)">Historial Citas</a>
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
            <input type="hidden"  name="id_rc" value="<%=cita.getId_rc() %>">
            <div class="contenedor">   
                <h1>Reprogramar Cita</h1><br>
                <div>
                    <div class="row">
                    </div><br>
                    <table class="table table-striped table-bordered dt-responsive nowrap">
                        
                        <thead >
                            <tr  >
                                <th style="background-color: rgb(3, 64, 150); color: white;">Código</th>
                                <td><%=cita.getId_rc() %></td>
                            </tr>
                            <tr>
                                <th style="background-color: rgb(3, 64, 150); color: white;">Paciente</th>
                                <td><%=cita.getId_paciente() %></td>
                            </tr>
                            <tr>
                                <th style="background-color: rgb(3, 64, 150); color: white;">Especialidad</th>
                                <td><%=cita.getEspecialidad() %></td>
                            </tr>
                            <tr>
                                <th style="background-color: rgb(3, 64, 150); color: white;" >Médico</th>
                                <td><%=cita.getNomMed()%><%=cita.getApellMed() %></td>
                            </tr>
                            <tr>
                                <th style="background-color: rgb(3, 64, 150); color: white;">Consultorio</th>
                                <td><%=cita.getConsultorio() %></td>
                             </tr>
                            <tr>
                                <th style="background-color: rgb(3, 64, 150); color: white;">Fecha</th>
                                <td><input type="date" name="fecha" value="<%=cita.getFecha() %>"></td>
                            </tr>
                            <tr>
                                <th style="background-color: rgb(3, 64, 150); color: white;">Hora</th>
                                <td><select name="id_h">
                                        <option selected="">---------------</option>
                                        <option value="1">08:00 a.m.</option>
                                        <option value="2">10:00 a.m.</option>
                                        <option value="3">02:00 p.m.</option>
                                        <option value="4">04:00 p.m.</option>
                                    </select>
                                </td>
                            </tr>
                        <th colspan="2">
                        <center><button class="btn btn-warning style"  onclick="reprogramarcita()" >Reprogramar Cita</button></center>
                        </th>
                    </thead>
                    </table>
                </div>
            </div>
        </form>
        <!--Scripts-->
        <script src="https://kit.fontawesome.com/1a98240850.js" crossorigin="anonymous"></script>  
    </body>
</html>

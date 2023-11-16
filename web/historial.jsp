<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true" %>
<%@page import="java.util.ArrayList" %>
<%@page import="Modelo.*" %>
<%!
    ArrayList<Cita> ListaCitas;
%>
<%
    ListaCitas = (ArrayList<Cita>) request.getAttribute("listacitas");

%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>HISTORIAL</title>
        <!-- Estilos -->
        <link rel="stylesheet" href="css/PaginaPrincipal.css">
        <link rel="stylesheet" href="css/VerMedicos.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    </head>
    <script>
        function eliminar(cod,id_paciente){
            document.form.action = "<%=request.getContextPath()%>/citaservlet";
            document.form.method = "GET";
            document.form.op.value = "2";
            document.form.id_rc.value=cod;
            document.form.id_paciente.value=id_paciente;
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
        
    </script>
    <body>
        <!-- Encabezado-->
        <header class="header">
            
                <div class="container">
                    <div class="logo">
                        <img src="img/logo.png"  >
                    </div>
                    <nav class="menu">
                        <ul>
                            <li>
                                <%  if (session.getAttribute("logueado") != null) {%>
                                <a>Bienvenido: <%=session.getAttribute("usuario_sesion")%></a>
                            </li>  

                            <%} %>
                        </ul>
                    </nav>
                    <div class="btn-menu">
                        <label for="btn-menu">☰</label>
                    </div>
                </div>
                <!-- Menu lateral -->
            <form>
                <input type="checkbox" id="btn-menu">
                <div class="container-menu">
                    <div class="cont-menu">
                        <nav>
                            <%  if (session.getAttribute("logueado") != null) {%>
                            <a onclick="principal()" style="color: rgb(255,255,255)">Pagina Principal</a>
                            <a href="reservarcita.jsp" style="color: rgb(255,255,255)">Reservar cita</a>
                            <%} %>
                            <a onclick="medicos()" style="color: rgb(255,255,255)">Ver médicos</a>
                            <a href="especialidad.jsp">Especialidades</a>
                            <a href="nosotros.jsp">Nosotros</a>
                            <a href="contacto.jsp">Contacto</a>
                            <%  if (session.getAttribute("logueado") != null) {%>
                            <a onclick="salir()" style="color: rgb(255,255,255)">Cerrar sesión</a>
                            <%}%>
                        </nav>
                        <label for="btn-menu">
                            <i class="fas fa-times"></i>️
                        </label>
                    </div>
                </div>
            </form>
        </header><br>
        <!-- Contenedor -->
        <form name="form">
            <input type="hidden" name="op">
            <input type="hidden" name="id_rc">
            <input type="hidden" name="id_paciente">
        <div class="contenedor">
            <h1>HISTORIAL DE CITAS</h1>
            <div id="tabla2" style="margin-left: 300px">
                <table>
                    <thead>
                        <tr>
                            <th>Especialidad</th>
                            <th>Médico</th>
                            <th>Consultorio</th>
                            <th>Fecha</th>
                            <th>Hora</th>
                            <th>Eliminar</th>
                        </tr>
                    </thead>
                    <%
                        for (Cita obj : ListaCitas) {
                            if(obj.getEstado().equals("PENDIENTE")){
                    %> 
                    <tr>
                        <td><%=obj.getEspecialidad() %></td>
                        <td><%=obj.getNomMed() %> <%=obj.getApellMed() %></td>
                        <td><%=obj.getConsultorio() %></td>
                        <td><%=obj.getFecha() %></td>
                        <td><%=obj.getHora() %></td>
                        <td><button class="btn btn-danger" onclick="eliminar('<%=obj.getId_rc() %>','<%=obj.getId_paciente() %>')">Eliminar</button></td>
                    </tr>
                    <% }} %>
                </table>
            </div>
                </div>
        </form>       

    </body>
</html>

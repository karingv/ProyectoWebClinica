<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true" %>
<%@page import="java.util.ArrayList" %>
<%@page import="Modelo.*" %>
<%!
    ArrayList<CitaxMedico> ListaCitas;
%>
<%
    ListaCitas = (ArrayList<CitaxMedico>) request.getAttribute("listacitas");

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
        function medicos() {
            document.form.action = "<%=request.getContextPath()%>/medicoServlet";
            document.form.method = "POST";
            document.form.op.value = "1";
            document.form.submit();
        }
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
        function atendido(id_rc){
            document.form2.action = "<%=request.getContextPath()%>/citaservlet";
            document.form2.method = "POST";
            document.form2.op.value = "3";
            document.form2.id_rc.value=id_rc;
            document.form2.submit();
        }
        function noatendido(id_rc){
            document.form2.action = "<%=request.getContextPath()%>/citaservlet";
            document.form2.method = "POST";
            document.form2.op.value = "4";
            document.form2.id_rc.value=id_rc;
            document.form2.submit();
        }
        function historialmedico(){
            document.form2.action = "<%=request.getContextPath()%>/medicoServlet";
            document.form2.method = "POST";
            document.form2.op.value = "8";
            document.form2.submit();
        }
        function datosmedicos(){
            document.form2.action = "<%=request.getContextPath()%>/medicoServlet";
            document.form2.method = "POST";
            document.form2.op.value = "10";
            document.form2.submit();
        }
        function listarusuarios(){
            document.form2.action = "<%=request.getContextPath()%>/medicoServlet";
            document.form2.method = "POST";
            document.form2.op.value = "11";
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
            <div class="contenedor">   
                <h1>Listado de Citas</h1><br>
                <div>
                    <div class="row">
                        <div class="panel-body">
                            <button class="btn btn-warning style"  onclick="modificar()" >Modificar datos - Médico</button>  &nbsp; &nbsp; 
                            <button class="btn btn-warning style"  onclick="historialmedico()" >Historial de Citas</button> &nbsp; &nbsp;
                            <button class="btn btn-warning style"  onclick="datosmedicos()" >Ver Datos</button> &nbsp; &nbsp;
                            <button class="btn btn-warning style"  onclick="listarusuarios()" >Reservar Cita</button>
                        </div>
                    </div><br>
                    <table class="table table-striped table-bordered dt-responsive nowrap">
                        <thead style="background-color: rgb(3, 64, 150); color: white;">
                            <tr >
                                <th>Código</th>
                                <th>Nombres</th>
                                <th>Apellidos</th>
                                <th>DNI</th>
                                <th>Sexo</th>
                                <th>Fecha</th>
                                <th>Hora</th>
                                <th>Estado</th>
                                <th><center>Atención</center> </th>
                            </tr>
                        </thead>
                        <tbody> 
                            <%
                               for (CitaxMedico obj : ListaCitas) {
                                if(obj.getEstado().equals("PENDIENTE")){
                            %> 
                            <tr>
                                <td><%=obj.getId_rc() %></td>
                                <td><%=obj.getNombreP() %></td>
                                <td><%=obj.getApellidoP() %></td>
                                <td><%=obj.getDniP() %></td>
                                <td><%=obj.getSexoP() %></td>
                                <td><%=obj.getFecha() %></td>
                                <td><%=obj.getHora() %></td>
                                <td><%=obj.getEstado() %></td>
                                <td>
                                    <a onclick="atendido(<%=obj.getId_rc() %>)" style="" ><i class="fas fa-check fa-3x" style="color: green"></i></a>&nbsp; &nbsp; &nbsp; 
                                    <a onclick="noatendido(<%=obj.getId_rc() %>)" style=""><i class="fas fa-times fa-3x" style="color: red"></i></a>
                                </td>
                            </tr>
                            <%} } %>
                        </tbody> 
                    </table>
                </div>
            </div>
        </form>
        <!--Scripts-->
        <script src="https://kit.fontawesome.com/1a98240850.js" crossorigin="anonymous"></script>  
    </body>
</html>

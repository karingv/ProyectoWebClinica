<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="java.util.ArrayList" %>
<%@page import="Modelo.Paciente" %>
<%!
    ArrayList<Paciente> ListaPaciente;
%>
<%
    ListaPaciente = (ArrayList<Paciente>) request.getAttribute("listapaciente");

%>
<%@page session="true" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>MANTENIMIENTO</title>
        <!-- Estilos -->
        <link rel="stylesheet" href="css/PaginaPrincipal.css">
        <link rel="stylesheet" href="css/mantenimiento.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    </head>
    <script>
        function nuevousuario() {
            document.form.action = "<%=request.getContextPath()%>/mantenimientoServlet";
            document.form.method = "POST";
            document.form.op.value = "1";
            document.form.submit();
        }
        function eliminar(cod) {
            document.form.action = "<%=request.getContextPath()%>/pacienteServlet";
            document.form.method = "POST";
            document.form.op.value = "5";
            document.form.cod.value = cod;
            document.form.submit();
        }
        function modificar(cod, nom, apell, dni, fechanac, sexo, celular, correo, usuario, contra, tipo) {
            document.form.action = "<%=request.getContextPath()%>/pacienteServlet";
            document.form.method = "GET";
            document.form.op.value = "8";
            document.form.cod.value = cod;
            document.form.nombres.value = nom;
            document.form.apellidos.value = apell;
            document.form.dni.value = dni;
            document.form.fechanac.value = fechanac;
            document.form.sexo.value = sexo;
            document.form.celular.value = celular;
            document.form.correo.value = correo;
            document.form.usuario.value = usuario;
            document.form.contraseña.value = contra;
            document.form.tipo.value = tipo;
            document.form.submit();
        }
        function medicos() {
            document.form.action = "<%=request.getContextPath()%>/medicoServlet";
            document.form.method = "POST";
            document.form.op.value = "1";
            document.form.submit();
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
        function listarusuarios(){
            document.form.action = "<%=request.getContextPath()%>/medicoServlet";
            document.form.method = "POST";
            document.form.op.value = "11";
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
            <form>
                <div class="container">
                    <div class="logo">
                        <img src="img/logo.png"  >
                    </div>
                    <nav class="menu">
                        <%  if (session.getAttribute("logueado") != null) {%>
                        <ul>
                            <li>
                                <a>Bienvenido: <%=session.getAttribute("usuario_sesion")%></a>
                                <ul class="menu_inside">
                                    <a onclick="historialcitas()" >Historial Citas</a>
                                </ul>
                            </li>
                        </ul>
                        <% } %>
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
                            <%  if (session.getAttribute("logueado") != null) {%>
                            <a onclick="principal()" style="color: rgb(255,255,255)">Pagina Principal</a>
                            <%}%>
                            <a onclick="listarusuarios()" style="color: rgb(255,255,255)">Reservar cita</a>
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
        </header>
        <br>
        <form name="form">
            <input type="hidden"  name="op"> 
            <input type="hidden"  name="cod" >
            <input type="hidden"  name="nombres" >
            <input type="hidden"  name="apellidos" >
            <input type="hidden"  name="dni" >
            <input type="hidden"  name="fechanac" >
            <input type="hidden"  name="sexo" >
            <input type="hidden"  name="celular" >
            <input type="hidden"  name="correo" >
            <input type="hidden"  name="usuario" >
            <input type="hidden"  name="contraseña" >
            <input type="hidden"  name="tipo" >
            <div class="contenedor">
                <h1>Lista de Usuarios</h1><br>
                <div id="">
                    <div class="row">
                        <div class="panel-body">
                            <button class="btn btn-warning style"  onclick="nuevousuario()" >Agregar usuario</button>                           
                        </div>
                    </div><br>
                    <table class="table table-striped table-bordered dt-responsive nowrap">
                        <thead style="background-color: rgb(3, 64, 150); color: white;">
                            <tr >
                                <th>Código</th>
                                <th>Nombres</th>
                                <th>Apellidos</th>
                                <th>DNI</th>
                                <th>Fecha de Nacimiento</th>
                                <th>Sexo</th>
                                <th>Celular</th>
                                <th>Correo</th>
                                <th>Tipo</th>
                                <th>Modificar</th>
                                <th>Eliminar</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                for (Paciente obj : ListaPaciente) {
                            %> 
                            <tr>
                                <td><%=obj.getId_paciente()%></td>
                                <td><%=obj.getNombres()%></td>
                                <td><%=obj.getApellidos()%></td>
                                <td><%=obj.getDni()%></td>
                                <td><%=obj.getFechanac()%></td>
                                <td><%=obj.getSexo()%></td>
                                <td><%=obj.getCelular()%></td>
                                <td><%=obj.getCorreo()%></td>
                                <% switch (obj.getId_tipo()) {
                                        case 1:%><td>Paciente</td><%;
                                        break;
                                    case 2:%><td>Administrador sistema</td><%;
                                                        break;
                                                }%>
                                <td><button class="btn btn-primary" onclick="modificar('<%=obj.getId_paciente()%>', '<%=obj.getNombres()%>', '<%=obj.getApellidos()%>', '<%=obj.getDni()%>', '<%=obj.getFechanac()%>', '<%=obj.getSexo()%>', '<%=obj.getCelular()%>', '<%=obj.getCorreo()%>', '<%=obj.getUsuario()%>', '<%=obj.getContraseña()%>', '<%=obj.getId_tipo()%>')">Modificar</button></td>
                                <td><button class="btn btn-danger" onclick="eliminar(<%=obj.getId_paciente()%>)">Eliminar</button></td>
                            </tr>
                            <% }%>
                        </tbody> 

                    </table>

                </div>


            </div>
        </form>
    </body>
</html>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Modelo.Medico" %>
<%@page session="true" %>
<!DOCTYPE html>


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>MODIFICAR MÉDICO</title>
        <link rel="stylesheet" href="css/PaginaPrincipal.css">
        <link rel="stylesheet" href="css/formulario.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    </head>
    <script>
        function modificar(){
            document.form2.action="<%=request.getContextPath()%>/medicoServlet";
            document.form2.method="GET";
            document.form2.op.value="4";
            document.form2.submit();
        }
        function medicos() {
            document.form.action = "<%=request.getContextPath()%>/medicoServlet";
            document.form.method = "POST";
            document.form.op.value = "1";
            document.form.submit();
        }
        function principalM(){
            document.form2.action = "<%=request.getContextPath()%>/medicoServlet";
            document.form2.method = "POST";
            document.form2.op.value = "9";
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
                            <% if(session.getAttribute("tipo").equals(3)) { %>
                            <a onclick="principalM()" style="color: rgb(255,255,255)">Pagina Principal Médico</a>
                            <%} %>
                            <a onclick="medicos()" style="color: rgb(255,255,255)">Ver médicos</a>
                            <a href="especialidad.jsp">Especialidades</a>
                            <a href="nosotros.jsp">Nosotros</a>
                            <a href="contacto.jsp">Contacto</a>
                        </nav>
                        <label for="btn-menu"><i class="fas fa-times"></i>️</label>
                    </div>
                </div>
            </form>
        </header>
        <br><br><br><br><br><br>
        <!-- Contenedor -->
        <div class="contenedor">
            <h1>Modificar Datos - Médico</h1>
            <hr>
            <form name="form2">
                <input type="hidden"  name="op">
                <input type="hidden"  name="id_med"  value="<%=session.getAttribute("id_med") %>">
                <div class="mb-4">
                    <label>Id:</label>
                    <input type="" class="form-control" disabled="" value="<%=session.getAttribute("id_med") %>">
                </div>
                <div class="mb-4">
                    <label>Nombres:</label>
                    <input type="" class="form-control" name="nombres" value="<%= session.getAttribute("nombres") %>">
                </div>
                <div class="mb-4">
                    <label>Apellidos:</label>
                    <input type="" class="form-control" name="apellidos" value="<%=session.getAttribute("apellidos") %>">
                </div> 
                <div class="mb-4">
                    <label>Sexo:</label>
                    <select name="sexo" class="form-select ">
                        <option <% if(session.getAttribute("sexo").equals("femenino")){
                        %>value="<%=session.getAttribute("sexo")%>" selected <% }%>>Femenino</option>
                        <option <% if(session.getAttribute("sexo").equals("masculino")){
                        %>value="<%=session.getAttribute("sexo")%>" selected <% }%>>Masculino</option>
                    </select>
                </div>
                <div class="mb-4">
                    <label>Número Colegiatura:</label>
                    <input type="" name="numcoleg" class="form-control" value="<%=session.getAttribute("numcoleg") %>">
                </div> 
                <div class="mb-4">
                    <label>Especialidad: </label>
                    <input disabled="" name="nomesp" value="<%=session.getAttribute("nomesp") %>"> 
                </div>
                <div class="mb-4">
                    <label>Usuario:</label>
                    <input type="text" name="usuario" class="form-control" value="<%=session.getAttribute("usuario") %>">
                </div>  
                <div class="mb-4">
                    <label>Contraseña:</label>
                    <input type="password" name="contraseña" class="form-control" value="<%=session.getAttribute("contraseña") %>">
                </div> 
                <button class="btn btn-warning style" type="submit "onclick="modificar()">Modificar</button>
            </form>
        </div>

    </body>
</html>

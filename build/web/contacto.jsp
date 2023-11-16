<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page session="true" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CONTACTO</title>
        <!-- Estilos -->
        <link rel="stylesheet" href="css/PaginaPrincipal.css">
        <link rel="stylesheet" href="css/contacto.css">
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
        function historial() {
            document.form.action = "<%=request.getContextPath()%>/pacienteServlet";
            document.form.method = "GET";
            document.form.op.value = "11";
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
                <form name="form">
                    <input type="hidden"  name="op"> 
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
                            <a onclick="medicos()">Ver médicos</a>
                            <a href="especialidad.jsp">Especialidades</a>
                            <a href="nosotros.jsp">Nosotros</a>
                            <%  if (session.getAttribute("logueado") != null) {%>
                            <a onclick="salir()">Cerrar sesión</a>
                            <%}%>
                            <%if (session.getAttribute("logueado") != null && session.getAttribute("tipo").equals(2)) { %>  
                            <a onclick="mantenimiento()" style="color: rgb(255,255,255)">Mantenimiento</a>
                        <% } %>
                        </nav>
                            <label for="btn-menu"><i class="fas fa-times"></i>️</label>
                        </div>
                    </div>
                </form>
        </header>
        <br>
        <!-- Contenedor -->
        <div class="contenedor">
            <h1>NOS IMPORTA MUCHO TU SALUD</h1>
            <p>Déjanos tus datos si necesitas mayor información</p>
            <div id="form">
                <div class="row">
                    <input class="form-control form-control-lg" type="text" placeholder="*Nombres completos:">
                    <input type="text" placeholder="*DNI:">
                </div>
                <div class="row">
                    <input type="email" placeholder="*E-mail:">
                    <input type="text" placeholder="*Teléfono">
                </div>
                <div class="row">
                    <textarea placeholder="*Mensaje:"></textarea>
                </div>
                <div class="boton">
                    <input type="submit" onclick="" value="Enviar">
                </div>
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

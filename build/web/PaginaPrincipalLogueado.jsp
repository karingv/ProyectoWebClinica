<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true" %>
<%!
    int tipo;
%>
<%
    if (session.getAttribute("logueado") == null){
      response.sendRedirect("login.jsp");
    }else{
    tipo = (int) request.getAttribute("tipo");
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>PAGINA PRINCIPAL CLINICA LIMATAMBO</title>
        <!-- Estilos -->
        <link rel="stylesheet" href="css/PaginaPrincipal.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    </head>
    <script>
        function mantenimiento() {
            document.form.action = "<%=request.getContextPath()%>/mantenimientoServlet";
            document.form.method = "POST";
            document.form.op.value = "3";
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
        function listarusuarios(){
            document.form.action = "<%=request.getContextPath()%>/medicoServlet";
            document.form.method = "POST";
            document.form.op.value = "11";
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
                            <%  if (session.getAttribute("logueado") != null) {%><a>Bienvenido: <%=session.getAttribute("usuario_sesion")%></a><%}%>
                            <ul class="menu_inside">
                                <%  if (session.getAttribute("logueado") != null && session.getAttribute("tipo").equals(2))  {%>
                                <li >  
                                    <a onclick="historialcitas()" >Historial Citas</a>            
                                </li>
                                <%} else{ %>
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
            <form name="form">
                <input type="hidden"  name="op"> 
                <input type="checkbox" id="btn-menu">
                <div class="container-menu">

                    <div class="cont-menu">
                        <nav>
                            <%if(session.getAttribute("tipo").equals(1)){ %>
                            <a href="reservarcita.jsp" >Reservar cita</a>
                            <%} else if(session.getAttribute("tipo").equals(2)){ %>
                            <a onclick="listarusuarios()" style="color: rgb(255,255,255)">Reservar cita</a>
                            <% } %>
                            <a onclick="medicos()" style="color: rgb(255,255,255)">Ver médicos</a>
                            <a href="especialidad.jsp">Especialidades</a>
                            <a href="nosotros.jsp" style="color: rgb(255,255,255)">Nosotros</a>
                            <a href="contacto.jsp" style="color: rgb(255,255,255)">Contacto</a>
                            <a onclick="salir()" style="color: rgb(255,255,255)">Cerrar sesión</a>
                            <%if (tipo == 2) { %>  
                            <a onclick="mantenimiento()" style="color: rgb(255,255,255)">Mantenimiento</a>
                            <% };%>
                        </nav>
                        <label for="btn-menu"><i class="fas fa-times"></i>️</label>
                    </div>
                </div>
            </form>
        </header>
        <br>
        <!-- Carrusel -->
        <div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img src="img/vacuna.jpg" class="d-block w-100" >
                    <div class="carousel-caption d-none d-md-block">
                        <h5>CENTRO DE VACUNACIÓN PARA NIÑOS Y ADULTOS</h5>
                        <p></p>
                    </div>   
                </div>
                <div class="carousel-item">
                    <img src="img/prueba.jpg" class="d-block w-100" >
                    <div class="carousel-caption d-none d-md-block">
                        <h5></h5>
                        <p></p>
                    </div>
                </div>
                <div class="carousel-item">
                    <img src="img/tecnologia.jpg" class="d-block w-100" >
                    <div class="carousel-caption d-none d-md-block">
                        <h5>TECNOLOGÍA QUE MERECES</h5>
                        <p></p>
                    </div>
                </div>
            </div>
            <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
            </button>
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
<%
    }
%>
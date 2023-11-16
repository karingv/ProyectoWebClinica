<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page session="true" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>NOSOTROS</title>
        <!-- Estilos -->
        <link rel="stylesheet" href="css/PaginaPrincipal.css">
        <link rel="stylesheet" href="css/nosotros.css">
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
                            <a href="contacto.jsp">Contacto</a>
                            <%  if (session.getAttribute("logueado") != null) {%>
                            <a onclick="salir()">Cerrar sesión</a>
                            <%}%>
                            <%if (session.getAttribute("logueado") != null && session.getAttribute("tipo").equals(2)) { %>  
                            <a onclick="mantenimiento()" style="color: rgb(255,255,255)">Mantenimiento</a>
                        <% }%>
                        </nav>
                            <label for="btn-menu"><i class="fas fa-times"></i>️</label>
                        </div>
                    </div>
                </form>
        </header>

        <!-- Contenedor -->
        <div class="contenedor">
            <h1>NOSOTROS</h1>
            <div class="texto">
                <h2>HISTORIA</h2>
                <p>Clínicas Limatambo Sede San Isidro fue creada el 30 de agosto 1990 por el Dr. Bertilo Malpartida Tello, Cirujano Cardiovascular.
                    Esta institución privada que presta servicios de salud, desarrolla actividades de atención integral a la población, en el marco de las políticas del sector salud.
                    Desde sus inicios ha tenido un crecimiento continuo en la demanda de los servicios clínicos ofrecidos, ha hecho que en la práctica haya estado en permanente expansión, 
                    incorporando año a año nueva infraestructura física, equipamiento de alta tecnología y profesionales altamente calificados en sus especialidades.</p>
            </div>
            <div class="texto">
                <h2>MISIÓN</h2>
                <p>Brindar servicios de salud accesibles con el fin de lograr el bienestar familiar de los peruanos, con una propuesta de calidad y un equipo de destacados profesionales comprometidos con nuestros pacientes.</p>
            </div>
            <div class="texto">
                <h2>VISIÓN</h2>
                <p>Ser líder en el mercado de salud con una atención centrada en el paciente.</p>
            </div>
            <div class="texto">
                <h2>Empresas Vinculadas y Alianzas Estratégicas</h2>
                <p>Tenemos convenios vigentes con las principales aseguradoras y reaseguradoras a nivel nacional.</p>
                <p><strong>SEMILLA:</strong></p>
                <p>RAZÓN SOCIAL: SOLUMAR S.A.C.</p>
                <p><strong>BABYSEC:</strong></p>
                <p>RAZÓN SOCIAL: PRODUCTOS TISSUE DEL PERU S.A.C - PROTISA-PERU</p>
                <p><strong>MATERNELLE:</strong></p>
                <p>RAZÓN SOCIAL: M PAZOS & ASOCIADOS E.I.R.L.</p>
                <p><strong>FOTO LATINO:</strong></p>
                <p>RAZÓN SOCIAL: FOTO LATINO PRODUCCIONES SOCIEDAD ANONIMA CERRADA - FOTO LATINO PRODUCCIONES S.A.C</p>
                <p><strong>SALVY NATURAL:</strong></p>
                <p>RAZÓN SOCIAL: Industria descartables del Perú S.A.C</p>
                <p><strong>ALULA S-26:</strong></p>
                <p>RAZÓN SOCIAL: ASPEN PERÚ S.A.C</p>
                <p><strong>JHONSON & JHONSON:</strong></p>
                <p>RAZÓN SOCIAL: JOHNSON & JOHNSON DEL PERU S.A</p>
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
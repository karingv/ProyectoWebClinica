<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page session="true" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ESPECIALIDADES</title>
        <!-- Estilos -->
        <link rel="stylesheet" href="css/PaginaPrincipal.css">
        <link rel="stylesheet" href="css/especialidad.css">

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
                <div class="logo"><img src="img/logo.png"></div>
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
                                <%} else if(session.getAttribute("logueado") != null && session.getAttribute("tipo").equals(1)){ %>
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
                <div class="btn-menu"><label for="btn-menu">☰</label></div>
            </div>
            <!-- Menu lateral -->
            <form name="form">
                <input type="hidden" name="op">
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
                            <a href="nosotros.jsp">Nosotros</a>
                            <a href="contacto.jsp">Contacto</a>
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
        <br><br><br><br><br><br><br>


        <div class="contenedor">
            <div class="cont-select">
                <h2>Seleccione una especialidad para mas información</h2><br>
                <select name="especialidades" id="especialidades">
                    <option value="1">Banco de Sangre</option> 
                    <option value="cardiologia">Cardiología</option>
                    <option value="cirugia-general">Cirugía General</option>
                    <option value="dermatologia">Dermatología</option>           
                    <option value="gastroenterologia">Gastroenterología</option> 
                    <option value="medicina-interna">Medicina interna</option>
                    <option value="neurologia">Neurología</option> 
                    <option value="pediatria">Pediatría</option>
                    <option value="psicologia">Psicología</option>
                    <option value="traumatologia">Traumatología</option> 
                </select>
            </div>
            <div id="1" class="espe">
                <div class="cont">
                    <div class="imagen"><img src="img/banco-de-sangre.png"></div>
                    <div class="titulo">
                        <h1 align="center">Banco de Sangre</h1><br>
                        <h3>Proveer sangre y componentes sanguíneos por medio de un soporte transfusional seguro</h3>
                    </div>
                </div>
                <div class="doc">
                    <img src="img/bancodesangre-Manrique Castagnola, Eddy Renzo-43318.jpg">
                    <p>Manrique Castagnola, Eddy Renzo<br><br> Colegiatura: 43318</p>
                    <img src="img/bancodesangre-Vives Rivero, Giovanna Rocio-51133.jpg">
                    <p>Vives Rivero, Giovanna Rocio<br><br> Colegiatura: 51133</p>
                </div>
            </div>
            <div id="cardiologia" class="espe" style="display:none;">
                <div class="cont">
                    <div class="imagen"><img src="img/cardiologia.png"></div>
                    <div class="titulo">
                        <h1 align="center">Cardiología</h1><br>
                        <h3>Atención de las enfermedades del corazón y del aparato circulatorio</h3>
                    </div>
                </div>
                <div class="doc">
                    <img src="img/cardiologia-Sánchez-Palacios Paiva, Miguel Ricardo-08353.jpg">
                    <p>Sánchez-Palacios Paiva, Miguel Ricardo<br><br> Colegiatura: 08353</p>
                </div>
            </div>
            <div id="cirugia-general" class="espe" style="display:none;">
                <div class="cont">
                    <div class="imagen"><img src="img/cirugia-general.png"></div>
                    <div class="titulo">
                        <h1 align="center">Cirugía General</h1><br>
                        <h3>Atención de patologías quirúrgicas, especialmente del sistema digestivo</h3>
                    </div>
                </div>
                <div class="doc">
                    <img src="img/cirugia-general-Freitas Alvarado, Enrique Augusto-12643.jpg">
                    <p>Freitas Alvarado, Enrique Augusto<br><br> Colegiatura: 12643</p>
                    <img src="img/cirugia-general-Salazar Minaya, Eduardo-10137.jpg">
                    <p>Salazar Minaya, Eduardo<br><br> Colegiatura: 10137</p>
                </div>
            </div>
            <div id="dermatologia" class="espe" style="display:none;">
                <div class="cont">
                    <div class="imagen"><img src="img/dermatologia.png"></div>
                    <div class="titulo">
                        <h1 align="center">Dermatología</h1><br>
                        <h3>Atención de enfermedades con manifestaciones cutáneas, primarias de la piel o las que son parte de las enfermedades sistémicas</h3>
                    </div>
                </div>
                <div class="doc">
                    <img src="img/dermatologia-Giglio Basto, Patricia Rocio-43954.jpg">
                    <p>Giglio Basto, Patricia Rocio<br><br> Colegiatura: 43954</p>
                </div>  
            </div>
            <div id="gastroenterologia" class="espe" style="display:none;">
                <div class="cont">
                    <div class="imagen"><img src="img/gastroenterologia.png"></div>
                    <div class="titulo">
                        <h1 align="center">Gastroenterología</h1><br>
                        <h3>Atención de enfermedades del aparato digestivo y órganos asociados como el páncreas y a vesícula biliar</h3>
                    </div>
                </div>
                <div class="doc">
                    <img src="img/gastroenterologia-Barriga Briceño, José Antonio-33654.jpg">
                    <p>Barriga Briceño, José Antonio<br><br> Colegiatura: 33654</p>
                </div>
            </div> 
            <div id="medicina-interna" class="espe" style="display:none;">
                <div class="cont">
                    <div class="imagen"><img src="img/medicina-interna.png"></div>
                    <div class="titulo">
                        <h1 align="center">Medicina Interna</h1><br>
                        <h3>Atención integral de problemas de salud en pacientes adultos</h3>
                    </div>
                </div>
                <div class="doc">
                    <img src="img/medicina-interna-Espinoza Alegre, Óscar Alejandro-14883.jpg">
                    <p>Espinoza Alegre, Óscar Alejandro<br><br> Colegiatura: 14883</p>
                    <img src="img/medicina-interna-Sano Ito, Roberto Alfonso-13132.jpg">
                    <p>Sano Ito, Roberto Alfonso<br><br> Colegiatura: 13132</p>
                </div>
            </div>
            <div id="neurologia" class="espe" style="display:none;">
                <div class="cont">
                    <div class="imagen"><img src="img/neurologia.png"></div>
                    <div class="titulo">
                        <h1 align="center">Neurología</h1><br>
                        <h3>Atención de enfermedades del sistema nervioso central, sistema nervioso periférico y el sistema nervioso autónomo</h3>
                    </div>
                </div>
                <div class="doc">
                    <img src="img/neurologia-Barreto Barra, Leila Axana-58306.jpg">
                    <p>Barreto Barra, Leila Axana<br><br> Colegiatura: 58306</p>
                    <img src="img/neurologia-Carrasco Macedo, Carlos Alberto-21280.jpg">
                    <p>Carrasco Macedo, Carlos Alberto<br><br> Colegiatura: 21280</p>
                </div>
            </div>       
            <div id="pediatria" class="espe" style="display:none;">
                <div class="cont">
                    <div class="imagen"><img src="img/pediatria.png"></div>
                    <div class="titulo">
                        <h1 align="center">Pediatría</h1><br>
                        <h3>Atención integral de problemas de salud en pacientes pediátricos</h3>
                    </div>
                </div>
                <div class="doc">
                    <img src="img/pediatria-Acosta Galli, María Ysabel-19052.jpg">
                    <p>Acosta Galli, María Ysabel<br><br> Colegiatura: 19052</p>
                    <img src="img/pediatria-Callalli Denegri, Luis Martin-28165.jpg">
                    <p>Callalli Denegri, Luis Martin<br><br> Colegiatura: 28165</p>
                </div>
            </div> 
            <div id="psicologia" class="espe" style="display:none;">
                <div class="cont">
                    <div class="imagen"><img src="img/psicologia.png"></div>
                    <div class="titulo">
                        <h1 align="center">Psicología</h1><br>
                        <h3>Atención de trastornos de la conducta y procesos mentales de los individuos y de grupos humanos en distintas situaciones</h3>
                    </div>
                </div>
                <div class="doc">
                    <img src="img/psicologia-Bravo De Rueda Ortega, María Del Carmen-01935.jpg">
                    <p>Bravo De Rueda Ortega, María Del Carmen<br><br> Colegiatura: 01935</p>
                    <img src="img/psicologia-Castro Ataurima, Mary Isabel-11980.jpg">
                    <p>Castro Ataurima, Mary Isabel<br><br> Colegiatura: 11980</p>
                </div>
            </div>  
            <div id="traumatologia" class="espe" style="display:none;">
                <div class="cont">
                    <div class="imagen"><img src="img/traumatologia.png"></div>
                    <div class="titulo">
                        <h1 align="center">Traumatología</h1><br>
                        <h3>Atención de enfermedades del aparato locomotor que incluye lesiones traumáticas, congénitas, especialmente aquellas que requieren manejo quirúrgico</h3>
                    </div>
                </div>
                <div class="doc">
                    <img src="img/traumatologia-Delgado Rázuri, Gustavo Dario-32640.jpg">
                    <p>Delgado Rázuri, Gustavo Dario<br><br> Colegiatura: 32640</p>
                </div>
            </div>




        </div>
        <!-- JS -->
        <script src="js/jquery.js"></script> 
        <script>
                            $("#especialidades").on('change', function () {
                                $('.espe').hide();
                                $('#' + this.value).show();
                            });
        </script>




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

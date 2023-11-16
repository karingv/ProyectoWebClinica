<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>AGREGAR MÉDICO</title>
        <!-- Estilos -->
        <link rel="stylesheet" href="css/PaginaPrincipal.css">
        <link rel="stylesheet" href="css/formulario.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    </head>
    <script>
        function agregarmedico(){
            document.form.action = "<%=request.getContextPath()%>/medicoServlet";
            document.form.method = "GET";
            document.form.op.value = "6";
            document.form.submit();
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
                        <ul>
                            <li>
                                <a>Bienvenido: <%=session.getAttribute("usuario_sesion")%></a>
                            </li>    
                        </ul>
                        <% } %>
                        </li>    
                    </ul>
                </nav>
                <div class="btn-menu"><label for="btn-menu">☰</label></div>
            </div>
            <!-- Menu lateral -->
            <form >
                <input type="hidden"  name="op"> 
                <input type="checkbox" id="btn-menu">
                <div class="container-menu">

                    <div class="cont-menu">
                        <nav>
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
            <h1>Agregar Médico</h1>
            <hr> 
            <form name="form">
                <input type="hidden"  name="op"> 
                <div class="mb-4">
                    <label>Nombres:</label>
                    <input type="" class="form-control" name="nombres">
                </div>
                <div class="mb-4">
                    <label>Apellidos:</label>
                    <input type="" class="form-control" name="apellidos">
                </div> 
                <div class="mb-4">
                    <label>Sexo:</label>
                    <select class="form-select" name="sexo">
                        <option selected>Seleccionar</option>
                        <option value="femenino">Femenino</option>
                        <option value="masculino">Masculino</option>
                    </select>
                </div>
                <div class="mb-4">
                    <label>Número Colegiatura:</label>
                    <input type="" class="form-control" name="numcoleg">
                </div> 
                <div class="mb-4">
                    <label>Especialidad: </label>
                    <select class="form-select" name="id_esp">
                        <option selected>Seleccionar</option>
                        <option value="1">MEDICINA INTERNA</option>
                        <option value="2">BANCO DE SANGRE</option>
                        <option value="3">CARDIOLOGÍA</option>
                        <option value="4">CIRUGÍA GENERAL</option>
                        <option value="5">DERMATOLOGIA</option>
                        <option value="6">GASTROENTEROLOGÍA</option> 
                        <option value="7">NEUROLOGIA</option>
                        <option value="8">PEDIATRÍA</option>
                        <option value="9">PSICOLOGÍA</option>
                        <option value="10">TRAUMATOLOGÍA</option>
                    </select>
                </div>
                <div class="mb-4">
                    <label>Usuario:</label>
                    <input type="text" class="form-control" name="usuario" >
                </div>  
                <div class="mb-4">
                    <label>Contraseña:</label>
                    <input type="password" class="form-control" name="contraseña">
                </div> 
                <button class="btn btn-warning style" type="submit "onclick="agregarmedico()">Agregar</button>
            </form>
        </div>
    </body>

</html>

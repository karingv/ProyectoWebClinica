<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>AGREGAR USUARIO</title>
        <link rel="stylesheet" href="css/PaginaPrincipal.css">
        <link rel="stylesheet" href="css/formulario.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    </head>
    <script>
        function AgregarUsuario(){
            document.form.action = "<%=request.getContextPath()%>/mantenimientoServlet";
            document.form.method = "GET";
            document.form.op.value = "2";
            document.form.submit();
        }
        function mantenimiento() {
            document.form.action = "<%=request.getContextPath()%>/mantenimientoServlet";
            document.form.method = "POST";
            document.form.op.value = "3";
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
                            <%if (session.getAttribute("logueado") != null && session.getAttribute("tipo").equals(2)) { %>  
                            <a onclick="mantenimiento()" style="color: rgb(255,255,255)">Mantenimiento</a>
                        <% } %>
                        </nav>
                        <label for="btn-menu"><i class="fas fa-times"></i>️</label>
                    </div>
                </div>
            </form>
        </header>
        <br><br><br><br><br><br>        
        <!-- Contenedor -->
        <div class="contenedor">
            <h1>Agregar Usuario</h1>
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
                    <label>DNI:</label>
                    <input type="" class="form-control" name="dni">
                </div>
                <div class="mb-4">
                    <label>Fecha Nacimiento:</label>
                    <input type="" class="form-control"placeholder="YYYY-MM-DD" name="fechanac">
                </div> 
                <div class="mb-4">
                    <label>Sexo:</label>
                    <select class="form-select"name="sexo">
                        <option selected>Seleccionar</option>
                        <option value="femenino">Femenino</option>
                        <option value="masculino">Masculino</option>
                    </select>
                </div>
                <div class="mb-4">
                    <label>Celular:</label>
                    <input type="" class="form-control" name="celular">
                </div> 
                <div class="mb-4">
                    <label>Correo:</label>
                    <input type="email" class="form-control" name="correo">
                </div>
                <div class="mb-4">
                    <label>Usuario</label>
                    <input type="" class="form-control" name="usuario">
                </div>
                <div class="mb-4">
                    <label>Contraseña:</label>
                    <input type="" class="form-control" name="contraseña">
                </div>
                <div class="mb-4">
                    <label>Tipo:</label>
                    <select class="form-select" name="id_tipo">
                        <option selected>Seleccionar</option>
                        <option value="1">Paciente</option>
                        <option value="2">Administrador</option>
                    </select>
                </div>
                <button class="btn btn-warning style" type="submit "onclick="AgregarUsuario()">Agregar</button>
            </form>
        </div>

    </body>
</html>

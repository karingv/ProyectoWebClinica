<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="en" dir="ltr">
    <head>
        <meta charset="utf-8">
        <title>Formulario Login</title>
        <link rel="stylesheet" href="css/login.css">
    </head>
    <script>
        function entrar() {
            document.form.action = "<%=request.getContextPath()%>/pacienteServlet";
            document.form.method = "POST";
            document.form.op.value = "1";
            document.form.submit();
        }
        function registrar() {
            document.form.action = "<%=request.getContextPath()%>/pacienteServlet";
            document.form.method = "POST";
            document.form.op.value = "3";
            document.form.submit();
        }
    </script>
    <body>
        <form name="form">
            <input type="hidden" name="op">
            <section class="form-login">
                <h5>INICIAR SESIÓN</h5>
                    <select class="controls"  name="tipousu"   id="tipousu" >
                        <option value="0" selected>-------------------------</option> 
                        <option value="1">PACIENTE</option> 
                        <option value="2">ADMINISTRADOR SISTEMA</option> 
                        <option value="3">MÉDICO</option> 
                    </select>
                <input class="controls" type="text" name="usuario" placeholder="Usuario" >
                <input class="controls" type="password" name="contra" placeholder="Contraseña">
                <button class="buttons" onclick="entrar()" >Ingresar</button>
                <!-- <p><a href="#">¿Olvidastes tu Contraseña?</a></p> -->
                <p><a onclick="registrar()"> ¿Es nuevo aquí? Haga su registro</a></p>
                <%   if (request.getAttribute("mensaje") != null) {%>
                <strong><br><p style="text-align: center;"><%=(String) request.getAttribute("mensaje")%></p></strong>
                <%      }%>  
            </section>
        </form>
    </body>
</html>
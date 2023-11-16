
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="en" dir="ltr">
    <head>
        <meta charset="utf-8">
        <title>FORMULARIO DE REGISTRO</title>
        <link rel="stylesheet" href="css/registrar.css">
    </head>
    <script>
        function registrar() {
            document.form.action = "<%=request.getContextPath()%>/pacienteServlet";
            document.form.method = "GET";
            document.form.op.value = "4";
            document.form.submit();
        }

    </script>
    <body>
        <form name="form">
            <input type="hidden"  name="op"> 
            <section class="form-login">
                <h5>Bienvenido a la Clínica Limatambo</h5>
                <p>Regístrate y podrás visualizar la disponibilidad de los médicos y reservar tus citas en línea.</p><br>
                <p>Recuerda que tus datos estarán resguardados por nosotros.</p><br>
                <div>
                    <input class="controls" name="nombre" type="text" placeholder="Nombre Completo">
                    <input class="controls" name="apellido" type="text" placeholder="Apellido Completo">
                    <input class="controls" name="dni" type="text" placeholder="DNI">
                    <input class="controls" name="fechanac" type="text" placeholder="Formato: dd/mm/aaaa">
                    <select class="controls" name="sexo" id="sexo"  >
                        <option value="masculino">Masculino</option>
                        <option value="femenino">Femenino</option>
                    </select>
                    <input class="controls" name="celular" type="text" placeholder="Celular">
                    <input class="controls" name="correo" type="text" placeholder="Correo Electronico">
                    <input class="controls" type="text" name="usuario"  placeholder="Usuario">
                    <input class="controls" type="password" name="contraseña" placeholder="Contraseña">
                    <input class="buttons" type="submit" onclick="registrar()" value="Registrar">
                </div>  
                <p>Al registrarte, aceptas nuestras Condiciones de uso y Política de privacidad.</p><br>
                <p>¿Ya tienes una cuenta?<a class="link" href="login.jsp"> Iniciar sesión</a></p>
            </section>
        </form>
    </body>
</html>
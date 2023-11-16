<%@page contentType="text/html" pageEncoding="UTF-8"%>
 <%@page import="Modelo.Paciente" %>
<%!
    Paciente objPaciente;
%>
<% 
   objPaciente =(Paciente)request.getAttribute("datos");
%>

<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title>MODIFICAR REGISTRO</title>
    <link rel="stylesheet" href="css/registrar.css">
  </head>
  <script>
        function modificar(cod){
            document.form.action="<%=request.getContextPath()%>/pacienteServlet";
            document.form.method="GET";
            document.form.op.value="10";
            document.form.cod.value=cod;
            document.form.submit();
        }
        
    </script>
  <body>
      <form name="form">
       <input type="hidden"  name="op"> 
       <input type="hidden"  name="cod">
       <input type="hidden" name="tipo" value="<%=objPaciente.getId_tipo() %>">
    <section class="form-login">
      <h5>Modificar Usuario</h5>
      <div>
      <input class="controls"  type="text" disabled="false" value="<%=objPaciente.getId_paciente() %>" >
      <input class="controls" name="nombres" value="<%=objPaciente.getNombres() %>" type="text" placeholder="Nombres Completo">
      <input class="controls" name="apellidos" type="text" value="<%=objPaciente.getApellidos() %>"  placeholder="Apellidos Completo">
      <input class="controls" name="dni" type="text" value="<%=objPaciente.getDni() %>" placeholder="DNI">
      <input class="controls" name="fechanac" type="text" value="<%=objPaciente.getFechanac() %>" placeholder="Formato: dd/mm/aaaa">
      <select class="controls" name="sexo"   id="sexo"  >
            <option <%if(objPaciente.getSexo()=="masculino"){%>selected="true"<%}%> value="masculino">Masculino</option>
            <option <%if(objPaciente.getSexo()=="femenino"){%>selected="true"<%}%> value="femenino">Femenino</option>
      </select>
       <input class="controls" name="celular" type="text" value="<%=objPaciente.getCelular() %>" placeholder="Celular">
      <input class="controls" name="correo" type="text" value="<%=objPaciente.getCorreo() %>" placeholder="Correo Electronico">
      <input class="controls" type="text" name="usuario" value="<%=objPaciente.getUsuario() %>" placeholder="Usuario">
      <input class="controls" type="password" name="contraseña" value="<%=objPaciente.getContraseña() %>" placeholder="Contraseña">
      <input class="buttons" type="submit" onclick="modificar('<%=objPaciente.getId_paciente() %>')" value="modificar">
      </div> 
    </section>
     </form>
  </body>
</html>
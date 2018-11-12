<%-- 
    Document   : usuarioperfil
    Created on : 12/11/2018, 05:17:33 AM
    Author     : USER END
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="usuario.usuario"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Perfil</title>
        <%!
            usuario usuario = new usuario();
        %>
        
        <%
            usuario = (usuario) session.getAttribute("usuario");
        %>
    </head>
    
    <body>

        <header>
            <h1>Bienvenido a tu perfil <%=usuario.getNombre()%></h1>
            <p>Aqui puedes consultar tu informacion que podran observar los demas usuarios.</p>
        </header>

        <article>
            <section id="informacion">
                <p> Aqui puedes observar tu informacion q veran los demas usuarios </p>
                <p>Tu nombre es: <%=usuario.getNombre()%></p>
                <p>Tu apellido es: <%=usuario.getApellido()%></p>
                <p>Tu correo es: <%=usuario.getCorreo()%></p>
            </section>
        </article>
        
        <nav>
            <a href="desconceccion">logout</a>
            <a href="index.html">Inicio</a>
        </nav>
         

    </body>
</html>

<%-- 
    Document   : login
    Created on : 30/11/2018, 09:21:15 PM
    Author     : Escuadron JAVA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Iniciar sesion</title>
        <link rel="stylesheet" href="login.css" type="text/css"/>
        <link rel="shortcut icon" href="indexLogo.png"/>

    </head>
    <body>
        <%-- CODIGO JAVA --%>
        <%
            Cookie[] cookies = request.getCookies();
            String correo = "";
            String password = "";
            for (Cookie allCookies : cookies) {
                if (allCookies.getName().equals("correo")) {
                    correo = allCookies.getValue();
                }

                if (allCookies.getName().equals("password")) {
                    password = allCookies.getValue();
                }
            }
        %>

        <div class="login-box">
            <img src="logo.jpg" class="avatar" alt="Avatar Image">
            <h1>Entra Aqui!</h1>

            <form action="LoginControlador" method="POST">
                <!--  USUARIO -->
                <label for="correo">Correo electronico</label>
                <input type="text" id="correo" name="correo" placeholder="alguien@ejemplo.com" value="<%=correo%>">

                <!-- CONTRASEÑA -->
                <label for="pass">Contraseña</label>
                <input type="password" id="pass" name="password" placeholder="Ingresa Contraseña" value="<%=password%>">

                <!-- REMEMBER ME -->
                <label>Recordarme <input type="checkbox" name="recordarme" checked></label>
                <input type="submit" value="Entrar">
            </form>
            <a href="registro.html">¿No tienes cuenta?</a>
        </div>
    </body>

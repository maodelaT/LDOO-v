<%-- 
    Document   : tec
    Created on : 30/11/2018, 07:31:14 PM
    Author     : Escuadron JAVA
--%>


<%@page import="Modelo.UsuariosPOJO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tecnologia</title>
        <link rel="shortcut icon" href="tecno.png"/>
        <link rel="stylesheet" href="designJb.css">

        <style> 
            body {
                background-image: url("fondo.png");
            }
        </style>

    </head>
    <body>
        <%! UsuariosPOJO uPOJO; %>
        <%
            try{
                if(request.getSession(false) == null){
                }else{
                    if(session.getAttribute("usuario") == null || session.getAttribute("usuario").equals("")){
                        
                    }else{
                        uPOJO = (UsuariosPOJO) session.getAttribute("usuario");
                    }
                }
            }catch(Exception ex){
                System.out.print("Ha ocurrido un error en tec.jsp " + ex.toString());
            }
            %>

        <div class="section">
            <img src="tecno.png" width="200" height="100" text-align= "left">
        </div>

        <div class="section2">

            <p>#DecideteMexico</p><br>
            <h1>¿Cual es la mejor PC?</h1>


            <%! UsuariosPOJO usPOJO;%>
            <%
                try {
                    if (request.getSession(false) == null) {
                    } else {
                        if (session.getAttribute("usuario") == null || session.getAttribute("usuario").equals("")) {
            %>
            <p>Recuerda que primero debes iniciar sesion</p>
            <%
                        } else {
                            usPOJO = (UsuariosPOJO) session.getAttribute("usuario");
            %>
            <p><%=usPOJO.getNombre()%> <%=usPOJO.getApellido()%></p>
            <%          }
                    }
                } catch (Exception e) {
                    System.out.print("Ah ocurrido un error al tratar de logearse2 " + e.toString());
                }
            %>
            <p> Estas son las opciones por las que puedes votar:
            </p><br>

            <form action="VotosControlador" method="POST">

                <p><img src="zenith.png" width="200" height="200" align="left"><Strong>PC ZENITH x3-567</Strong></p>
                <p>Memoria RAM 8 modulos de 16gb cada uno Corsair Vengance RGB (128gb total)</p>
                <p>Motherboard ASUS zenith extreme x399</p>
                <p>Procesador AMD ryzen Threadripper 1950x</p>
                <%  try {
                        if (request.getSession(false) == null) {
                        } else {
                            if (uPOJO.getVoto() == false && (session.getAttribute("usuario") == null || session.getAttribute("usuario").equals(""))) {
                            } else {
                %>
                Votar<input type="radio" name="voto" value="zenith" required><br>
                <%          }
                        }
                    } catch (Exception e) {
                        System.out.print("Ah ocurrido un error al tratar de logearse1 " + e.toString());
                    }
                %>

                <p><img src="xnor.png" width="200" height="200" align="left"><Strong>PC XnoR 7X</Strong></p>
                <p>Procesador Ryzen 5 2400G</p>
                <p>Motherboard ASUS ROG Strix X-470-1 Gaming</p>
                <p>Memoria RAM 2 modulos de 16Gb ECC (32GB total)</p>
                <%
                    try {
                        if (request.getSession(false) == null) {
                        } else {
                            if (uPOJO.getVoto() == false && (session.getAttribute("usuario") == null || session.getAttribute("usuario").equals(""))) {
                            } else {
                %>
                Votar<input type="radio" name="voto" value="xnor" required><br>
                <%          }
                        }
                    } catch (Exception e) {
                        System.out.print("Ah ocurrido un error al tratar de logearse1 " + e.toString());
                    }
                %>

                <p><img src="hubx.png" width="200" height="200" align="left"><Strong>PC Hubx Ryzen</Strong></p>
                <p>Procesador Intel core I7-8700k</p>
                <p>Memoria RAM G.skill tridentZ 4 modulos de 8gb (32GB total</p>
                <p>Motherboard ASUS ROG Maximus X Hero</p>
                <%
                    try {
                        if (request.getSession(false) == null) {
                        } else {
                            if (uPOJO.getVoto() == false && (session.getAttribute("usuario") == null || session.getAttribute("usuario").equals(""))) {
                            } else {
                %>
                Votar<input type="radio" name="voto" value="hubx" required><br>
                <%          }
                        }
                    } catch (Exception e) {
                        System.out.print("Ah ocurrido un error al tratar de logearse1 " + e.toString());
                    }
                %>

                <input type="hidden" name="accion" value="tecnologia">

                <%
                    try {
                        if (request.getSession(false) == null) {
                        } else {
                            if (uPOJO.getVoto() == false && (session.getAttribute("usuario") == null || session.getAttribute("usuario").equals(""))) {
                            } else {
                %>
                <center><input type="submit" value="Enviar"></center>
                    <%          }
                            }
                        } catch (Exception e) {
                            System.out.print("Ah ocurrido un error al tratar de logearse1 " + e.toString());
                        }
                    %>
            </form>
        </div>

        <footer id="footer" class="section">
            <h3>Derechos reservados Escuadron JAVA</h3>
        </footer>

    </body>
</html>


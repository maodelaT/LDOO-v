<%-- 
    Document   : ten
    Created on : 30/11/2018, 07:32:18 PM
    Author     : Escuadron JAVA
--%>


<%@page import="Modelo.UsuariosPOJO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tendencias</title>
        <link rel="shortcut icon" href="tende.png"/>
        <link rel="stylesheet" href="designJb.css">

        <style> 
            body {
                background-image: url("fondo.png");
            }
        </style>

    </head>
    <body>
        
        
        <div class="section">
            <img src="tende.png" width="200" height="100" text-align= "left">
        </div>

        <div class="section2">

            <p>#DecideteMexico</p><br>
            <h1>¿Cual es la mejor red social?</h1>


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

                <p><img src="FB.png" width="200" height="200" align="left"><Strong>FACEBOOK</Strong></p>
                <p>Facebook es una red social creada por Mark Zuckerberg mientras estudiaba en la universidad de Harvard.
                    Su objetivo era diseñar un espacio en el que los alumnos de dicha universidad pudieran intercambiar una
                    comunicación fluida y compartir contenido de forma sencilla a través de Internet.</p><br>
                <%
                    try {
                        if (request.getSession(false) == null) {
                        } else {
                            if (session.getAttribute("usuario") == null || session.getAttribute("usuario").equals("")) {
                            } else {
                %>
                Votar<input type="radio" name="voto" value="facebook" required><br>
                    <%          }
                            }
                        } catch (Exception e) {
                            System.out.print("Ah ocurrido un error al tratar de logearse1 " + e.toString());
                        }
                    %>


                <p><img src="YT.png" width="200" height="200" align="left"><Strong>YOUTUBE</Strong></p>
                <p>YouTube es un portal del Internet que permite a sus usuarios subir y visualizar videos.
                    Esta plataforma cuenta con un reproductor online basado en Flash, el formato desarrollado por Adobe Systems.
                    Una de sus principales innovaciones fue la facilidad para visualizar videos en streaming, es decir, 
                    sin necesidad de descargar el archivo a la computadora. Los usuarios, por lo tanto, 
                    pueden seleccionar qué video quieren ver y reproducirlo al instante.</p><br>
                <%
                    try {
                        if (request.getSession(false) == null) {
                        } else {
                            if (session.getAttribute("usuario") == null || session.getAttribute("usuario").equals("")) {
                            } else {
                %>
                Votar<input type="radio" name="voto" value="youtube" required><br>
                    <%          }
                            }
                        } catch (Exception e) {
                            System.out.print("Ah ocurrido un error al tratar de logearse1 " + e.toString());
                        }
                    %>


                <p><img src="TW.png" width="200" height="200" align="left"><Strong>TWITTER</Strong></p>
                <p>La plataforma de Twitter nació en octubre de 2006
                    como una red social con ciertas características auténticas. 
                    Entre las mismas, podemos mencionar que permite un servicio absolutamente gratuito y sin publicidades 
                    (se financia con las inversiones de empresas de capital riesgo), 
                    es muy sencillo de utilizar y estableció una nueva forma de comunicación, 
                    en la que lo público y lo privado se fusionan.</p><br>
                <%
                    try {
                        if (request.getSession(false) == null) {
                        } else {
                            if (session.getAttribute("usuario") == null || session.getAttribute("usuario").equals("")) {
                            } else {
                %>
                Votar<input type="radio" name="voto" value="twitter" required><br>
                    <%          }
                            }
                        } catch (Exception e) {
                            System.out.print("Ah ocurrido un error al tratar de logearse1 " + e.toString());
                        }
                    %>
                    
                <input type="hidden" name="accion" value="tendencias">
                
                <%
                    try {
                        if (request.getSession(false) == null) {
                        } else {
                            if (session.getAttribute("usuario") == null || session.getAttribute("usuario").equals("")) {
                            } else {
                %>
                <center><input type="submit" name="enviado" value="Enviar"></center>
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




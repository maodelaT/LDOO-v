<%-- 
    Document   : ciencia
    Created on : 30/11/2018, 06:53:00 PM
    Author     : Escuadron JAVA
--%>


<%@page import="Modelo.UsuariosPOJO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ciencia</title>
        <link rel="shortcut icon" href="ciencia.png"/>
        <link rel="stylesheet" href="designJb.css">

        <style> 
            body {
                background-image: url("fondo.png");
            }
        </style>

    </head>
    <body>


        <div class="section">
            <img src="ciencia.png" width="200" height="100" text-align= "left">
        </div>

        <div class="section2">

            <p>#DecideteMexico</p><br>
            <h1>¿Quien es el mejor cientifico?</h1>

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

                <p><img src="IN.jpg" width="200" height="200" align="left"><Strong>ISAAC NEWTON</Strong></p>
                <p>En Principia, Newton también formuló la ley de la gravitación universal. Esta ley establece que cada masa atrae a 
                    otras masas por una llamada “gravedad” y se formula de la siguiente manera:F1 = F2 = G(m1*m2/r al cuadrado)
                    Newton usó esta fórmula para explicar las trayectorias de los cometas, las mareas, 
                    la los equinoccios y otros fenómenos astrofísicos.</p><br>
                    <%                    try {
                            if (request.getSession(false) == null) {
                            } else {
                                if (session.getAttribute("usuario") == null || session.getAttribute("usuario").equals("")) {
                                } else {
                    %>
                Votar<input type="radio" name="voto" value="isaac" required><br>
                <%          }
                        }
                    } catch (Exception e) {
                        System.out.print("Ah ocurrido un error al tratar de logearse1 " + e.toString());
                    }
                %>


                <p><img src="GG.jpg" width="200" height="200" align="left"><Strong>GALILEO GALILEI</Strong></p>
                <p>La aportacion de Galileo Galilei fue el péndulo,
                    ya que éste de joven observó las campanas de la catedral de Pisa y cómo las mismas oscilaban gracias 
                    al movimiento producido por las corrientes de aire.
                    Lo creó en 1583 y haciendo pruebas con su pulso logró descubrir la “ley del péndulo”.
                    La cual es un principio que se utiliza aún en la actualidad,
                    el cual establece que sin importar la distancia a la que se aleja un péndulo de su equilibrio.
                </p><br>
                <%
                    try {
                        if (request.getSession(false) == null) {
                        } else {
                            if (session.getAttribute("usuario") == null || session.getAttribute("usuario").equals("")) {
                            } else {
                %>
                Votar<input type="radio" name="voto" value="galileo" required><br>
                <%          }
                        }
                    } catch (Exception e) {
                        System.out.print("Ah ocurrido un error al tratar de logearse1 " + e.toString());
                    }
                %>

                <p><img src="SH.jpg" width="200" height="200" align="left"><Strong>STEPHEN HAWKING</Strong></p>
                <p>Según Hawking, los efectos de las física cuántica hacen que los agujeros negros brillen como cuerpos calientes,
                    de ahí que pierdan parte de su negritud.

                    En 1976, siguiendo los enunciados de la física cuántica, concluyó en su "teoría de la radiación" 
                    que los agujeros negros son capaces de emitir energía, perder materia e incluso desaparecer.
                </p><br>
                <%
                    try {
                        if (request.getSession(false) == null) {
                        } else {
                            if (session.getAttribute("usuario") == null || session.getAttribute("usuario").equals("")) {
                            } else {
                %>
                Votar<input type="radio" name="voto" value="stephen" required><br>
                <%          }
                        }
                    } catch (Exception e) {
                        System.out.print("Ah ocurrido un error al tratar de logearse1 " + e.toString());
                    }
                %>
                <input type="hidden" name="accion" value="ciencia">
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


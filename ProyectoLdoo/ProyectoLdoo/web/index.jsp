<%-- 
    Document   : index
    Created on : 30/11/2018, 08:42:06 PM
    Author     : Escuadron JAVA
--%>

<%@page import="Modelo.UsuariosPOJO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="designJb.css">
        <title>DecideteMexico</title>
        <link rel="shortcut icon" href="indexLogo.png"/>

        <style> 
            body {
                background-image: url("fondo.png");
            }
        </style>
    </head>

    <body>
        <!-- ENCABEZADO -->
        <header id="header" class="section">
            <img  class="img-circle" src="indexLogo.png" alt="Logo de la pagina">
        </header>

        <!-- NAVEGACION EN LA PAGINA -->
        <nav id="nav" class="section">
            <table>
                <tr>
                    <td>
                        <%
                            try {
                                if (request.getSession(false) == null) {
                                } else {
                                    if (session.getAttribute("usuario") == null || session.getAttribute("usuario").equals("")) {
                        %>
                        <a href="login.jsp"><img src="login.png" width="200" height="60" alt="Iniciar Sesion"></a>
                            <%      } else { %>
                        <a href="CerrarServlet"><img src="cerrarSesion.png" width="200" height="60" alt="Cerrar sesion"/></a>

                        <%          }
                                }
                            } catch (Exception e) {
                                System.out.print("Ah ocurrido un error al tratar de logearse2 " + e.toString());
                            }
                        %>
                    </td>
                    <td><a href="registro.html"><img src="registro.png" width="200" height="60" alt="Registrate"></a></td>
                </tr>
            </table>
        </nav>

        <!-- CUERPO DE LA PAGINA -->
        <article>
            <section class="section2">
                <center><img src="wcm.png" width="400" height="100"></center>
                <p> #DecideteMéxico</p><br>
                <%! UsuariosPOJO usPOJO;%>
                <%
                            try {
                                if (request.getSession(false) == null) {
                                } else {
                                    if (session.getAttribute("usuario") == null || session.getAttribute("usuario").equals("")) {
                                    }else{
                                        usPOJO = (UsuariosPOJO) session.getAttribute("usuario");
                        %>
                        <p><%=usPOJO.getNombre()%> <%=usPOJO.getApellido()%></p>
                        <%          }
                                }
                            } catch (Exception e) {
                                System.out.print("Ah ocurrido un error al tratar de logearse2 " + e.toString());
                            }
                        %>
                
                <a href="login.jsp"><img src="PARTICIPA.png" width="400" height="100"></a>
                <p> Aqui puedes encontrar temas de tu interes y ver que es lo que las 
                    demas personas prefieren dependiendo el caso. !No esperes más, registrate y 
                    participa!
                </p><br>
                <img src="votar.jpg" width="400" height="200" align="right"> 
                <p> 
                    Para votar dentro del tema de interes es importante que elijas 
                    correctamente, debido a que solo podras votar una vez en cada uno de los contextos.
                    Si ya tienes una cuenta ingresa y comienza a votar en el tema de tu preferencia
                    en caso de que no cuentes con una puedes registrarte.
                </p><br><br><br>
            </section>

            <!-- SECCION DE VOTACIONES -->
            <section class="section2">
                <center><img src="tma.png" width="400" height="100"></center><br>
                <p>¡Da click a cualquier tema en el que estes interesado!</p>
                <table>
                    <tr>
                        <td><a href = "ciencia.jsp"><img src="ciencia.png" width="200" height="70"></a></td>
                        <td><a href = "tec.jsp"><img src="tecno.png" width="200" height="60"></a></td>
                        <td><a href = "ten.jsp"><img src="tende.png" width="200" height="60"></a></td>
                    </tr>
                    
                    <%
                            try {
                                if (request.getSession(false) == null) {
                                } else {
                                    if (session.getAttribute("usuario") == null || session.getAttribute("usuario").equals("")) {
                                        
                                    }else{
                        %>
                    
                    <tr>
                        <td><a href = "ciened.jsp"><img src="esd.png" width="200" height="70"></a></td>
                        <td><a href = "teced.jsp"><img src="esd.png" width="200" height="60"></a></td>
                        <td><a href = "tened.jsp"><img src="esd.png" width="200" height="60"></a></td>
                    </tr>
                     <tr>
                        <td><a href = "ciened.jsp">Estadisticas</a></td>
                        <td><a href = "teced.jsp">Estadisticas</a></td>
                        <td><a href = "tened.jsp">Estadisticas</a></td>
                    </tr>
                    
                    <%          }
                            }
                        } catch (Exception e) {
                            System.out.print("Ah ocurrido un error al tratar de logearse2 " + e.toString());
                        }
                    %>
                </table>
            </section>

            <!-- PIE DE PAGINA -->
            <footer id="footer" class="section">
                <h3>Derechos reservados Escuadron JAVA</h3>
            </footer>
    </body>
</html>

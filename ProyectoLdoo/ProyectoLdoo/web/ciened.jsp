<%-- 
    Document   : ciened
    Created on : 1/12/2018, 02:01:31 PM
    Author     : zenit
--%>

<%@page import="Modelo.UsuariosPOJO"%>
<%@page import="Modelo.VotosPOJO"%>
<%@page import="Modelo.VotosDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ciencia Estadisticas</title>
        <link rel="shortcut icon" href="ciencia.png"/>

        <link rel="stylesheet" href="designJb.css">

        <style> 
            body {
                background-image: url("fondo.png");
            }
        </style>

    </head>
    <body>
        <%! VotosDAO vDAO;
            VotosPOJO isaac;
            VotosPOJO galileo;
            VotosPOJO stephen;
            int total;
        %>

        <%
            vDAO = new VotosDAO();
            isaac = vDAO.getVotos("ciencia", "isaac");
            galileo = vDAO.getVotos("ciencia", "galileo");
            stephen = vDAO.getVotos("ciencia", "stephen");
            total = isaac.getVotos() + galileo.getVotos() + stephen.getVotos();
        %>

        <div class="section">
            <img src="ciencia.png" width="200" height="100" text-align= "left">
        </div>

        <div class="section2">

            <p>#DecideteMexico</p><br>
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
            <h1>¿Quien es el mejor cientifico?</h1>


            <p> Estas son los resultados hasta el momento
            </p><br>
            <center><img src="res.png" width="400" height="100"></center>        


            <p><strong>ISAAC NEWTON</Strong></p>
            <img src="IN.jpg" width="200" height="200"><br>
            <progress min="0" max="<%=total%>" value="<%=isaac.getVotos()%>"></progress>

            
            <p><Strong>GALILEO GALILEI</Strong></p>
            <img src="GG.jpg" width="200" height="200"><br>
            <progress min="0" max="<%=total%>" value="<%=galileo.getVotos()%>"></progress>

            
            <p><Strong>STEPHEN HAWKING</Strong></p>
            <img src="SH.jpg" width="200" height="200"><br>
            <progress min="0" max="<%=total%>" value="<%=stephen.getVotos()%>"></progress>



        </div>

        <footer id="footer" class="section">
            <h3>Derechos reservados Escuadron JAVA</h3>
        </footer>

    </body>
</html>

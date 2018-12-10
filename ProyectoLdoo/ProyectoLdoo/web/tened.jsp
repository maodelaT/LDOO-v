<%-- 
    Document   : tened
    Created on : 1/12/2018, 02:01:48 PM
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
        <title>Tendencias Resultados</title>
        <link rel="shortcut icon" href="tende.png"/>
        
        <link rel="stylesheet" href="designJb.css">
        
        <style> 
			body {
		    background-image: url("fondo.png");
			}
        </style>
        
    </head>
    <body>
        <%! VotosDAO vDAO;
            VotosPOJO facebook;
            VotosPOJO youtube;
            VotosPOJO twitter;
            int total;
        %>

        <%
            vDAO = new VotosDAO();
            facebook = vDAO.getVotos("tendencias", "facebook");
            twitter = vDAO.getVotos("tendencias", "twitter");
            youtube = vDAO.getVotos("tendencias", "youtube");
            total = facebook.getVotos() + twitter.getVotos() + youtube.getVotos();
        %>
        
        <div class="section">
            <img src="tende.png" width="200" height="100" text-align= "left">
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
        <h1>¿Cual es la mejor red social?</h1>
        
        
        <p> Estas son los resultados hasta el momento
        </p><br>
        <center><img src="res.png" width="400" height="100"></center>        
       
        
        <p><strong>FACEBOOK</Strong></p>
        <img src="FB.png" width="200" height="200"><br>
        <progress min="0" max="<%=total%>" value="<%=facebook.getVotos()%>"></progress>
        
        
        <p><Strong>YOUTUBE</Strong></p>
        <img src="YT.png" width="200" height="200"><br>
        <progress min="0" max="<%=total%>" value="<%=youtube.getVotos()%>"></progress>
        
        
        
        
        <p><Strong>TWITTER</Strong></p>
        <img src="TW.png" width="200" height="200"><br>
        <progress min="0" max="<%=total%>" value="<%=twitter.getVotos()%>"></progress>
        
        
        
        </div>
        
        <footer id="footer" class="section">
            <h3>Derechos reservados Escuadron JAVA</h3>
        </footer>
        
    </body>
</html>
<%-- 
    Document   : teced
    Created on : 1/12/2018, 02:01:09 PM
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
        <title>Tecnologia Resultados</title>
        <link rel="shortcut icon" href="tecno.png"/>
        
        <link rel="stylesheet" href="designJb.css">
        
        <style> 
			body {
		    background-image: url("fondo.png");
			}
        </style>
        
    </head>
    <body>
        <%! VotosDAO vDAO;
            VotosPOJO zenith;
            VotosPOJO xnor;
            VotosPOJO hubx;
            int total;
        %>

        <%
            vDAO = new VotosDAO();
            zenith = vDAO.getVotos("tecnologia", "zenith");
            xnor = vDAO.getVotos("tecnologia", "xnor");
            hubx = vDAO.getVotos("tecnologia", "hubx");
            total = zenith.getVotos() + xnor.getVotos() + hubx.getVotos();
        %>
        
        <div class="section">
            <img src="tecno.png" width="200" height="100" text-align= "left">
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
        <h1>¿Cual es la mejor PC?</h1>
        
        
        <p> Estas son los resultados hasta el momento
        </p><br>
        <center><img src="res.png" width="400" height="100"></center>        
       
        
        <p><strong>PC XnoR 7X</Strong></p>
        <img src="xnor.png" width="200" height="200"><br>
        <progress min="0" max="<%=total%>" value="<%=xnor.getVotos()%>"></progress>
        
        
        <p><Strong>PC ZENITH x3-567</Strong></p>
        <img src="zenith.png" width="200" height="200"><br>
        <progress min="0" max="<%=total%>" value="<%=zenith.getVotos()%>"></progress>
        
        
        
        
        <p><Strong>PC Hubx Ryzen</Strong></p>
        <img src="hubx.png" width="200" height="200"><br>
        <progress min="0" max="<%=total%>" value="<%=hubx.getVotos()%>"></progress>
        
        
        
        </div>
        
        <footer id="footer" class="section">
            <h3>Derechos reservados Escuadron JAVA</h3>
        </footer>
        
    </body>
</html>

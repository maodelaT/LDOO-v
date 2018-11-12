/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package control;

import usuario.usuario;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import java.util.Properties;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author USER END
 */
public class registroBD extends HttpServlet {

    private Object User;
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
            String nombre = request.getParameter("nombre");
            String apellido = request.getParameter("apellido");
            String correo = request.getParameter("correo");
            String contrasenia = request.getParameter("contrasenia");
            String recontrasenia = request.getParameter("recontrasenia");
            
            usuario user = new usuario(nombre, apellido);
            user.setCorreo(correo);
            user.setContrasenia(contrasenia);
            
            ClassLoader classLoader = Thread.currentThread().getContextClassLoader();
            Properties properties = new Properties();
            properties.load( getServletContext().getResourceAsStream( "/WEB-INF/datos.properties")); 
           
            String url = "jdbc:derby://localhost:1527/LDOO";
            String us = properties.getProperty("usuario");
            String pw = properties.getProperty("password");
            String query = "INSERT INTO Usuario (Nombre, Apellidos, Correo, Contrasenia) VALUES ("+nombre+","+apellido+","+correo+","+contrasenia+")"; 
           
            if(contrasenia.equals(recontrasenia)){
                try{
                    Connection con = DriverManager.getConnection(url, us, pw);
                    Statement stmt = con.createStatement();
                    stmt.executeUpdate(query);
                }catch(SQLException e){
                    System.out.println("Ups, hay algun error en la conexion");
                    System.out.println(e.toString());
                }
              
                HttpSession session=request.getSession();
                session.setAttribute("usuario", User);
                
                response.sendRedirect("Bien.html");
            }else{
                response.sendRedirect("Mal.html");
            }
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

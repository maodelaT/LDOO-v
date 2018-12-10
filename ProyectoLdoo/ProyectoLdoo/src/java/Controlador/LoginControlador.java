package Controlador;

import Modelo.*;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Mauricio de la Torre
 */
public class LoginControlador extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            //Declaracion de variables:
            String correo;
            String password;
            String passMD5;

            //Objetos:
            UsuariosDAO uDAO = new UsuariosDAO();

            //OBTENCION DE DATOS QUE INGRESA EL USUARIO:
            //Variables:
            correo = request.getParameter("correo");
            password = request.getParameter("password");

            //Objetos:
            UsuariosPOJO uPOJO = new UsuariosPOJO();

            //Proceso:
            passMD5 = JavaMD5Hash.md5(password);

            uPOJO.setCorreo(correo);
            uPOJO.setPassword(passMD5);

            //BUSQUEDA DE LOS DATOS EN LA BASE DE DATOS:
            //Objetos:
            Boolean esUsuario = uDAO.logear(uPOJO);

            //SABER SI EL USUARIO QUE SE QUIERE LOGEAR EXISTE EN LA BASE DE DATOS:
            if (esUsuario == true) {
                UsuariosPOJO usuario = uDAO.getUsuario(correo, passMD5);
                
                //Recordarme:
                try{
                    if(request.getParameter("recordarme").equals("on")){
                        Cookie cookieC = new Cookie("correo", correo);
                        cookieC.setMaxAge(60*60*24);
                        response.addCookie(cookieC);
                        
                        Cookie cookieP = new Cookie("password", password);
                        cookieP.setMaxAge(60*60*24);
                        response.addCookie(cookieP);
                    }
                }catch(NullPointerException e){
                    System.out.println("Check box no marcado");
                }
                
                //Sesiones:
                HttpSession session = request.getSession();
                session.setAttribute("usuario", usuario);

                //Salida:
                response.sendRedirect("index.jsp");

            } else {
                response.sendRedirect("login.jsp");
            }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
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
     *
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
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

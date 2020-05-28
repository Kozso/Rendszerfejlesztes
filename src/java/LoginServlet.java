/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author gazda
 */
@WebServlet(urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet {

    String felhasznaloka;

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
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        //request.getRequestDispatcher("index.html").include(request, response);  
        HttpSession session = request.getSession(true);
        String username = request.getParameter("felh_nev");
        String jelszo = request.getParameter("jelszo");
        
        
        RequestDispatcher dispatcher_OK = request.getRequestDispatcher("/index.jsp");
        RequestDispatcher dispatcher_NOT_OK = request.getRequestDispatcher("/Login.html");

//        String username= "napocska";
//        String jelszo = "123";
        try {
            int user_id = AuthHelper.validate(username, jelszo);
            if (user_id!=0) {
                session.setAttribute("user", username);
                session.setAttribute("user_id", user_id+"");
                dispatcher_OK.forward(request, response);

            } else {
//                session.setAttribute("user", username);
                out.print("<h1 style: text-align: center>Sorry username or password error</h1>");
                out.print(username + "" + jelszo);
                
                dispatcher_NOT_OK.include(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Hiba");
        }

        out.close();

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

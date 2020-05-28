/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import static com.sun.corba.se.spi.presentation.rmi.StubAdapter.request;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Dani
 */
@WebServlet(urlPatterns = {"/kosarbaServlet"})
public class kosarbaServlet extends HttpServlet {

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
        
        
        
//        System.out.println(request.getParameter("id"));
//        response.sendRedirect(request.getContextPath() + "/index.jsp");
        

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("Dopost kezdes");
        response.setContentType("text/html");

        //felh id beazonosítás
        HttpSession session = request.getSession(true);
//        String username = session.getAttribute("felh_nev");
//        String jelszo = request.getParameter("jelszo");
        
        
        //feltöltési adatok
        PrintWriter out = response.getWriter();
        
        
        

        int termek_id = Integer.parseInt(request.getParameter("termek_id"));
        int user_id =(int) session.getAttribute("user_id");
        
        System.out.println("ID , termek_id");
        System.out.println(user_id+" "+termek_id);
        
        RequestDispatcher dispatcher_OK = request.getRequestDispatcher("/index.jsp");
        

        try {

            Class.forName("com.mysql.jdbc.Driver");
            System.out.println("Driver is loaded");

            Connection con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/webshop_db", "root", "");
            
            System.out.println("Connection created");

            
            PreparedStatement ps_kosar = con.prepareStatement("insert into kosar(felh_id, termek_id) values (?,?)");
            ps_kosar.setInt(1, user_id);
            ps_kosar.setInt(2, termek_id);
//            PreparedStatement ps_kosar_tartalom = con.prepareStatement("insert into kosar_tartalom(termek_id,termek_nev,termek_kategoria,termek_ar ) values (?,?,?,?)");
            System.out.println("PrepareStatement OK");

            System.out.println("atment");

            System.out.println("feltoltes elott");
//            con.commit();
            ps_kosar.execute();
            System.out.println("ps_kosar OK");

            System.out.println("ps_kosar_tartalom OK");

            System.out.println("Zárva a connection és a ps");

            dispatcher_OK.forward(request, response);
            System.out.println("Inserted");
            //Feltoltés sikeres html kodot 
            ps_kosar.close();
            out.close();
            con.close();

        } catch (Exception e1) {
            System.err.println("Got an exception!");
            System.out.println(e1);

        }

    }
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

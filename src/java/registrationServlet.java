/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

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


/**
 *
 * @author gazda
 */
@WebServlet(urlPatterns = {"/registrationServlet"})
public class registrationServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if felh_nev servlet-specific error occurs
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
     * @throws ServletException if felh_nev servlet-specific error occurs
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
     * @throws ServletException if felh_nev servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("Dopost kezdes");
        response.setContentType("text/html");
        
        
        

        
        PrintWriter out = response.getWriter();
        String felh_nev = request.getParameter("felh_nev");
        String jelszo = request.getParameter("jelszo");
        String nev1 = request.getParameter("vnev");
        String nev2 = request.getParameter("knev");
        String email = request.getParameter("email");
        String tel_szam = request.getParameter("tel_szam");
        String varos = request.getParameter("varos");
        String utca = request.getParameter("utca");
        String hazszam = request.getParameter("hazszam");
        String szul_dat = request.getParameter("szuldat");
   //     String[] checkboxes = request.getParameterValues("checkboxes");
        String kat1 = request.getParameter("kat1");
        String kat2 = request.getParameter("kat2");



        try {
            RequestDispatcher dispatcher = request.getRequestDispatcher("/index.jsp");
            Class.forName("com.mysql.jdbc.Driver");
            System.out.println("Driver is loaded");

            Connection con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/webshop_db", "root", "");
            System.out.println("Connection created");

            PreparedStatement ps = con.prepareStatement("insert into felhasznalok(felh_nev, jelszo,vnev,knev ,email,tel_szam , varos , utca ,hazszam ,szuldat , kedvenc_kategoriak , kedvenc_kategoriak_2   ) values (?,?,?,?,?,?,?,?,?,?,?,?)");
            System.out.println("PrepareStatement OK");

            
            ps.setString(1, felh_nev);
            ps.setString(2, jelszo);
            ps.setString(3, nev1);
            ps.setString(4, nev2);
            ps.setString(5, email);
            ps.setString(6, tel_szam);
            ps.setString(7, varos);
            ps.setString(8, utca);
            ps.setString(9, hazszam);
            ps.setString(10, szul_dat);
            ps.setString(11, kat1);
            ps.setString(12, kat2);
            
            System.out.println("feltoltes elott");

            ps.execute();
            System.out.println("ps.Execute OK");

            
            System.out.println("Zárva a connection és a ps");
            
            dispatcher.forward(request, response);
            System.out.println("Inserted");
            ps.close();
            out.close();
            con.close();
            

        } catch (Exception e1) {
            System.err.println("Got an exception!");
            System.out.println(e1);
        }

       
    }

    /**
     * Returns felh_nev short description of the servlet.
     *
     * @return felh_nev String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

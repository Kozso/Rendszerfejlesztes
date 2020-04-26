/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import com.sun.xml.rpc.wsdl.document.schema.BuiltInTypes;
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
@WebServlet(urlPatterns = {"/hirdetesFeladasServlet"})
public class hirdetesFeladasServlet extends HttpServlet {

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
        String file1 = request.getParameter("file1");
        String file2 = request.getParameter("file2");
        String file3 = request.getParameter("file3");
        String file4 = request.getParameter("file4");
        String nev = request.getParameter("nev");
        int termek_ar = Integer.parseInt(request.getParameter("termek_ar"));
        String leiras = request.getParameter("leiras");
        String kat = request.getParameter("kategoria");
        String allapot = request.getParameter("allapot");
        String aukcio_idotartam = request.getParameter("aukcio_idotartam");
        String min_osszeg = request.getParameter("min_osszeg");

        RequestDispatcher dispatcher_OK = request.getRequestDispatcher("/index.jsp");
        RequestDispatcher dispatcher_NOT_OK = request.getRequestDispatcher("/hirdetesFeladasServlet.java");

        try {
            
            Class.forName("com.mysql.jdbc.Driver");
            System.out.println("Driver is loaded");

            Connection con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/webshop_db", "root", "");
            System.out.println("Connection created");

            PreparedStatement ps = con.prepareStatement("insert into termekek(nev, kategoria,leiras,allapot ,ar,kep1 , kep2 , kep3 ,kep4,felh_id ) values (?,?,?,?,?,?,?,?,?,1)");
            System.out.println("PrepareStatement OK");

            
            ps.setString(1, nev);
            ps.setString(2, kat);
            ps.setString(3, leiras);
            ps.setString(4, allapot);
            ps.setInt(5, termek_ar);
            ps.setString(6, file1);
            ps.setString(7, file2);
            ps.setString(8, file3);
            ps.setString(9, file4);
            
            System.out.println("feltoltes elott");

            ps.execute();
            System.out.println("ps.Execute OK");

            
            System.out.println("Zárva a connection és a ps");
            
            dispatcher_OK.forward(request, response);
            System.out.println("Inserted");
            //Feltoltés sikeres html kodot 
            ps.close();
            out.close();
            con.close();
            
            
        } catch (Exception e1) {
            System.err.println("Got an exception!");
            System.out.println(e1);
            dispatcher_NOT_OK.forward(request, response);
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

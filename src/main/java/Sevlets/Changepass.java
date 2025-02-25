/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Sevlets;

import Classes.DatabaseConnection;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author carlo
 */
public class Changepass extends HttpServlet {

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
            throws ServletException, IOException 
    {
         processRequest(request, response);
         HttpSession session = request.getSession();
         String current = request.getParameter("current");
         String new1 = request.getParameter("new1");
         String new2 = request.getParameter("new2");
            
            Connection con;
        try {
            
            if(new1.equals(new2))
            {
                    con = (Connection) DatabaseConnection.initializeDatabase();
                    Statement  st = con.createStatement();
                    String sql = "select userName from vacation.user where userName = '"+ session.getAttribute("username")+"' and password = md5('"+current+"');";
                    ResultSet rs = st.executeQuery(sql);
                
            while(rs.next()){
                if(rs.getString("userName").equals(session.getAttribute("username")))
                {
                    String sql2 = "update vacation.user set password = md5('"+new1+"') where userName = '"+rs.getString("username")+"';";
                    st.executeUpdate(sql2);
                    response.sendRedirect("Userpass.jsp?msg2=Password updated sucessfuly");
                    st.executeUpdate(sql);
                    st.close();
                    con.close(); 
                    return;
                }
                else{
                    response.sendRedirect("Userpass.jsp?msg2=Password not valid");
                    return;}
            }
            }
          
            response.sendRedirect("Userpass.jsp?msg2=Something went wrong, please try again!");
                
           
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(Changepass.class.getName()).log(Level.SEVERE, null, ex);
       
        }
            
        
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

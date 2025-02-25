/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Sevlets;

import Classes.DatabaseConnection;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.time.Year;

import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author carlo
 */
public class AvDays extends HttpServlet {

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
        SimpleDateFormat ft  = new SimpleDateFormat("yyyy-MM-dd");
        try {
            Year thisYear = Year.now();
            int daysused=0;
            Connection con = (Connection) DatabaseConnection.initializeDatabase();
            Statement st = con.createStatement();
            String sql = "SELECT SUM(days)as days FROM vacation.daysused where daysused.empID ="+request.getParameter("empid") +" and daysused.year = "+thisYear;
            String sql2 = "SELECT hireDate from vacation.employee where employee.empID="+request.getParameter("empid");
            ResultSet rs2 = st.executeQuery(sql2);
            Date date1 =null;
            
            while(rs2.next()){
            date1 = rs2.getDate("hireDate");
            
            }
            rs2 = st.executeQuery(sql);
            while(rs2.next()){
            daysused = rs2.getInt("days");
            }
            Date date2 = new Date() ;
            int days;
            long difference_In_Time = date2.getTime() - date1.getTime();
            long difference_In_Years
                = (difference_In_Time
                   / (1000l * 60 * 60 * 24 * 365));
            if(difference_In_Years >= 2 && difference_In_Years <7)
                    days= 10;
                else if (difference_In_Years>=7 && difference_In_Years<15)
                        days = 15;
                else if (difference_In_Years >=15)
                days= 20;
            else
                    days = 5;
            
           PrintWriter out = response.getWriter(); 
           int daysavailable = days-daysused;
            out.println("<p>Vacation days: "+days+"</p>");
            out.println("<p>Days used to date: "+daysused+"</p>");
            out.println("<p>Days Availabe: "+daysavailable+"</p>");
            st.close();
            rs2.close();
            con.close();
        
            
        } catch (SQLException ex) {
            Logger.getLogger(AvDays.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(AvDays.class.getName()).log(Level.SEVERE, null, ex);
        }
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

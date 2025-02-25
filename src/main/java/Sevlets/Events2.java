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
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import com.google.gson.Gson;
import java.text.SimpleDateFormat;

/**
 *
 * @author carlo
 */

class Event {
    private String title;
    private String start;
    private String end;
    private String color;
    
    Event(String title, String start, String end, String color)
    {
        this.title=title;
        this.start = start;
        this.end = end;
        this.color = color;
    }

    // Constructors, getters, and setters
}
public class Events2 extends HttpServlet {

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
        processRequest(request, response);
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();
        
        List<Event> events = new ArrayList<>();
        try {
            SimpleDateFormat ft  = new SimpleDateFormat("yyyy-MM-dd 23:59:00");
            Connection con = (Connection) DatabaseConnection.initializeDatabase();
            Statement  st = con.createStatement();
            String sql ="select dates.inDate, dates.endDate, forms.empName,forms.departament from vacation.dates, vacation.forms where forms.idForms = dates.formsid and dates.status='approved'";
            ResultSet rs = st.executeQuery(sql);

            while (rs.next()) {
                events.add(new Event(rs.getString("empName"), rs.getString("inDate"), ft.format(rs.getDate("endDate")),color(rs.getString("departament"))));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        request.setAttribute("events", events);
        String json = new Gson().toJson(events);
        out.print(json);
        out.flush();
        
        
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

    
    public String color(String department)
    {
        switch(department){
        
            case "Accounting":
                return "green";
            case "Administration": 
                 return "orange";  
            case "Drivers": 
                 return "black";
            case "Human Resources": 
                 return "red";
            case "Maintenance": 
                 return "pourple"; 
            case "Orders": 
                 return "blue"; 
            case "Purchasing": 
                 return "pink";
            case "Production": 
                 return "gold";
            case "Regulatory": 
                 return "lavender";
            case "Sales": 
                 return "beige";     
        }
        
    return "";
    
    }
}

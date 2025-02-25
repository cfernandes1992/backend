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
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author carlo
 */
public class Request extends HttpServlet {

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
        
        String name = request.getParameter("name");
        String startdate = request.getParameter("startDate");
        String endDate = request.getParameter("endDate");
        String startdate2[] = request.getParameterValues("startDate2");
        String endDate2[] = request.getParameterValues("endDate2");
        String leave = request.getParameter("leave");
        String leave2[] = request.getParameterValues("leave2");
        String department = request.getParameter("optradio");
        String comments = request.getParameter("comments");
        SimpleDateFormat ft  = new SimpleDateFormat("yyyy-MM-dd");
        String date = ft.format(new Date());
        int id=0;
        try {
            Connection con = (Connection) DatabaseConnection.initializeDatabase();
            Statement  st = con.createStatement();
            //Statement  st2 = con.createStatement();
            String sql = "insert into vacation.forms(empName,reqDate,departament,obs) values('"+name+"','"+date+"','"+department+"','"+comments+"')";
            st.execute(sql, Statement.RETURN_GENERATED_KEYS);
            ResultSet res = st.getGeneratedKeys();
            while(res.next()){
                id = res.getInt(1);
                 
            }
            if(id!=0){
                String sql2 = "insert into vacation.dates(formsId,inDate,endDate,type) values("+id+",'"+startdate+"','"+endDate+"','"+leave+"')";
                st.execute(sql2);
              if(startdate2 != null)
                {
                    for(int i=0; i < startdate2.length;i++)
                    {
                    
                    String sql3 = "insert into vacation.dates(formsId,inDate,endDate,type) values("+id+",'"+startdate2[i]+"','"+endDate2[i]+"','"+leave2[i]+"')";
                    st.execute(sql3);
                    }
                }
            }
            
            con.close();
            st.close();           
            response.sendRedirect("Newform.jsp");
            
        } catch (SQLException ex) {
            Logger.getLogger(Request.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Request.class.getName()).log(Level.SEVERE, null, ex);
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

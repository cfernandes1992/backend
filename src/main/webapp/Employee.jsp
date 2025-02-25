<%-- 
    Document   : Employee
    Created on : Feb 15, 2025, 10:25:34 AM
    Author     : carlo
--%>

<%@page import="java.util.logging.Logger"%>
<%@page import="java.util.logging.Level"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.util.Date"%>
<%@page import="java.time.Year"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="Classes.DatabaseConnection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
        <%@ include file = "Header.jsp" %>
     <%
         SimpleDateFormat ft  = new SimpleDateFormat("MM-dd-yyyy");
        Connection con = (Connection) DatabaseConnection.initializeDatabase();
        Statement  st = con.createStatement(); 
        String sql = "select * from employee";
        ResultSet rs = st.executeQuery(sql);
    %>
    <body>
        <script>
            var Msg ='<%=request.getParameter("msg3")%>';
                if (Msg !== "null") {
                     alert(Msg);
             }
          </script>
        <div class="container mt-3">
            <a href="Newemployee.jsp"
            <button type="button" class="btn btn-success">New Employee</button>
            </a>   
            <br>
            <br>
            <div style="margin-top: 10px; ">
                <label label-for="name">Search name: </label> <input type="text" id="name" class="form-control-input" onkeyup="myFunction()">
                <table id="tb_employee" class="table table-hover" style="margin-top: 20px; max-height: 100px; overflow: scroll;">
                    <thead>
                        <tr>
                          <th scope="col">Name</th>
                          <th scope="col">Hire Date</th> 
                          <th scope="col">Department</th>
                          <th scope="col">Vacation days</th>
                          <th scope="col">Used to Date</th>
                          <th scope="col">Days Available</th>
                        </tr>
                      </thead>
                      <tbody>
                          <%
                              while(rs.next())
                              {
                               int[] valores =  valor(rs.getInt("empID"));
                              %>
                              <tr>
                              <td><a href="Editemployee.jsp?empid=<%=rs.getInt("empID")%>"><%=rs.getString("name")%></a></td>
                              <td><%=ft.format(rs.getDate("hireDate"))%> </td>
                              <td><%=rs.getString("departament")%> </td>
                              <td><%=valores[0]%></td>
                              <td><%=valores[1]%></td>
                              <td><%=valores[2]%></td>
                              </tr>
                              <%}
                              st.close();
                              rs.close();
                              con.close();
                          %>
                      </tbody>  
                </table>  
            </div>
        </div>
    </body>
    
    <script>
      function myFunction() {
  // Declare variables
  var input, filter, table, tr, td, i, txtValue;
  input = document.getElementById("name");
  filter = input.value.toUpperCase();
  table = document.getElementById("tb_employee");
  tr = table.getElementsByTagName("tr");

  // Loop through all table rows, and hide those who don't match the search query
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[0];
    if (td) {
      txtValue = td.textContent || td.innerText;
      if (txtValue.toUpperCase().indexOf(filter) > -1) {
        tr[i].style.display = "";
      } else {
        tr[i].style.display = "none";
      }
    }
  }
}  
 
    </script>
    
    <%!
      public  int[] valor(int id){
       
            try {
                int[] val = new int[3] ;
            SimpleDateFormat ft  = new SimpleDateFormat("yyyy-MM-dd");
            Year thisYear = Year.now();
            int daysused=0;
            Connection con = (Connection) DatabaseConnection.initializeDatabase();
            Statement st = con.createStatement();
            String sql = "SELECT SUM(days)as days FROM vacation.daysused where daysused.empID ="+id+" and daysused.year = "+thisYear;
            String sql2 = "SELECT hireDate from vacation.employee where employee.empID="+id;
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
            
            
           int daysavailable = days-daysused;
            val[0] = days;
            val[1]=daysused;
            val[2]=daysavailable ;
            st.close();
            rs2.close();
            con.close();
            
        return val;
            
        } catch (SQLException ex) {
            
        } catch (ClassNotFoundException ex) {
           
        }
        return null;
        }   
    %>
    
</html>

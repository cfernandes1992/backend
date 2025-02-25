<%-- 
    Document   : Editdates
    Created on : Jan 20, 2025, 9:49:46 PM
    Author     : carlo
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="Classes.DatabaseConnection"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <%@ include file = "Header.jsp"%>
    <body>
        <div style="width: 80%; margin-left: 10%; margin-top: 20px;">
            <label>Employee Name: <%=request.getParameter("name")%> </label><br>
            <label>Department: <%=request.getParameter("dpt")%> </label><br>
          
             <%
            SimpleDateFormat ft  = new SimpleDateFormat("MM-dd-yyyy");
            Connection con = (Connection) DatabaseConnection.initializeDatabase();
            Statement st = con.createStatement();
            String sql = "select * from vacation.dates where id = "+request.getParameter("id");
            ResultSet rs = st.executeQuery(sql);
            while(rs.next())
            {
         %>
                        
         <form style="margin-top: 25px" method="post" action="UpdateDates">
                       
         <label>Type: </label><select name="type" id="type">
                                <option value="<%=rs.getString("type")%>" selected><%=rs.getString("type")%></option>
                                <option value="Vacation">Vacation</option>
                                <option value="Bereavement Leave">Bereavement</option>
                                <option value="Half Day">Half Day</option>
                                <option value="Jury Duty Leave">Jury Duty</option>
                                </select>
                                <input type="hidden" id="dateid" name="dateid" value="<%=request.getParameter("id")%>">
                                <div class="row" >
                                  <div class="col">
                                    <label for="startDate" class="form-label">Start Date:</label>
                                    <input type="date" class="form-control" id = "startDate" name="startDate" required value="<%=rs.getDate("inDate")%>"/>
                                </div>
                                    <div class="col">
                                       <label for="Date" class="form-label">End Date:</label> 
                                       <input type="date" class="form-control" name="endDate" required value="<%=rs.getDate("endDate")%>"/>
                                   </div>  
                                </div><br>
            <label>Current Status: <%=rs.getString("status")%></label><br>
                        <label>Update to: </label> 
                            <select name="status" id="status">
                                <option value="approved" selected>approved</option>
                                <option value="denied">denied</option>
                                <option value="pending">pending</option>                               
                            </select> <br>
                                
                              <div align="center" style="margin-top: 25px">
                                <button  type="submit" class="btn btn-success" style="width: 20%;">Save</button>
                                <button  type="button" class="btn btn-danger" onclick="deleted(<%=request.getParameter("id")%>)" style="width: 20%;">Delete</button>
                            </div>
         </form>
          <%}%> 
        </div>
    </body>
    
    <script>
        function deleted(id)
        {
            var xhttp = new XMLHttpRequest(); 
            if(confirm("Confirm Delete this request?"))
            {
                xhttp.onload = function() {
                  window.location.href = "Report.jsp";    
              };        
            xhttp.open("POST", "Deletedate?dateid="+id, true);
                xhttp.send();
                
            }
            
        }       
    </script>
</html>

<%-- 
    Document   : Editemployee
    Created on : Feb 17, 2025, 12:03:58 PM
    Author     : carlo
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="Classes.DatabaseConnection"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <%@ include file = "Header.jsp"%>
     
    
    
    <body>
        <%
         SimpleDateFormat ft  = new SimpleDateFormat("MM-dd-yyyy");
        Connection con = (Connection) DatabaseConnection.initializeDatabase();
        Statement  st = con.createStatement();
            String empID = request.getParameter("empid");
            String sql = "select * from vacation.employee where empID = "+empID;
            ResultSet rs = st.executeQuery(sql);
            while(rs.next())
            {
    %>
            <div class="container mt-3">
            <p>Employee<p>
            <form action="Updatemployee?empid=<%=empID%>" class="bg-white rounded shadow-5-strong p-5" method="post">
                <div>
                    <label for="name" class="form-label">Name:</label>
                    <input type="text" class="form-control" id="name" value="<%=rs.getString("name")%>"  name= "name" required>
                <br>
                    <label for="username" class="form-label">Hire Date:</label>
                    <input type="date" class="form-control" id="hiredate" value=<%=rs.getDate("hireDate")%> name="hiredate" required>
                <br>
                <label for="department" class="form-label">Department:</label>
                <select id="department" name="department" class="form-control">
                    <option value="<%=rs.getString("departament")%>" selected><%=rs.getString("departament")%></option>
                    <option value="Accounting">Accounting </option>
                    <option value="Administration">Administration</option>
                     <option value="Regulatory">Design</option>
                    <option value="Drivers">Drivers </option>
                    <option value="Human Resources">Human Resources </option>
                    <option value="Regulatory">Laboratory </option>
                    <option value="Maintenance">Maintenance </option>
                    <option value="Orders">Orders </option>    
                    <option value="Purchasing">Purchasing </option>
                    <option value="Production">Production </option>
                    <option value="Regulatory">Regulatory </option>
                    <option value="Sales">Sales </option>
                </select>
                <br>
                <div align="center">
                    <button  type="submit" class="btn btn-success" style="width: 20%;">Save</button>
                    <button  type="button" class="btn btn-danger" onclick="deletemp(<%=empID%>)" style="width: 20%;">Delete</button>
                </div>
                </div>
                <%}%>
            </form>            
        </div>
    </body>
       <script>
        function deletemp(id)
        {
            var xhttp = new XMLHttpRequest(); 
            if(confirm("Confirm Delete this Employee?"))
            {
                xhttp.onload = function() {
                  window.location.href = "Employee.jsp";    
              };        
            xhttp.open("POST", "DeleteEmp?empid="+id, true);
                xhttp.send();
                
            }
            
        }       
    </script>
</html>

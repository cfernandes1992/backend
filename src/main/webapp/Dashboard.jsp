<%-- 
    Document   : Dashboard
    Created on : Dec 23, 2024, 11:28:12 PM
    Author     : carlo
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="Classes.DatabaseConnection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0" >         
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">           
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/bootstrap.css">
        <link rel="stylesheet" href="css/style.css" type="text/css">
       </head>  
    <%@ include file = "Header.jsp" %>
    <%
        Connection con = (Connection) DatabaseConnection.initializeDatabase();
        Statement  st = con.createStatement(); 
            String sql = "select forms.idForms,forms.empName,forms.reqDate,forms.departament, forms.status from vacation.forms where status ='pending'";
            ResultSet rs = st.executeQuery(sql);
            int row =0;
            SimpleDateFormat ft  = new SimpleDateFormat("MM-dd-yyyy");
    %>
    <body>
        <div style="width: 80%; margin-left: 10%; margin-top: 20px;">
            <p>Pending Requests</p>
            <div>
                <table class="table table-hover" style="margin-top: 20px;">
                    <thead>
                        <tr>
                          <th scope="col">Ref</th>
                          <th scope="col">Emp. Name</th>
                          <th scope="col">Request Date</th>
                          <th scope="col">Department</th>
                          <th scope="col">Status</th>
                        </tr>
                        <tbody>
                          <%
                              while(rs.next())
                              {
                              %>
                              <tr>
                              <td><a href="Formedit.jsp?idform=<%=rs.getInt("idForms")%>" > 00<%=rs.getInt("idForms")%> </a></td> 
                              <td><%=rs.getString("empName")%> </td>
                              <td><%=ft.format(rs.getDate("reqDate"))%> </td>
                              <td><%=rs.getString("departament")%> </td>
                              <td><%=rs.getString("status")%> </td>
                              </tr>
                              <% row=1;}
                          %>
                      </tbody>
                     
                      </thead>
                      
                </table>
                       <% if(row==0)
                      {
                      %><p>There is no pending request at this time</p>
                      <%}%>
            </div>
            
        </div>  
       <script>
        function handleButtonClick(id) {
            // Accessing row data using the data-* attributes
            
            session.setAttribute("formid",id);
            
            
        }
    </script>
    </body>
</html>

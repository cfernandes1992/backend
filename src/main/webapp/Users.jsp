<%-- 
    Document   : Users
    Created on : Dec 25, 2024, 10:12:31 PM
    Author     : carlo
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="Classes.DatabaseConnection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Users</title>
    </head>
    <%@ include file = "Header.jsp" %>
    <%
        Connection con = (Connection) DatabaseConnection.initializeDatabase();
        Statement  st = con.createStatement(); 
            String sql = "select userName, name from user";
            ResultSet rs = st.executeQuery(sql);
    %>
    <body>
        <div class="container mt-3">
            <a href="Newuser.jsp"
            <button type="button" class="btn btn-success">Add User</button>
            </a>   
                <br>
            <div>
                <table class="table table-hover" style="margin-top: 20px;">
                    <thead>
                        <tr>
                          <th scope="col">Name</th>
                          <th scope="col">Username</th>                         
                        </tr>
                      </thead>
                      <tbody>
                          <%
                              while(rs.next())
                              {
                              %>
                              <tr>
                              <td><%=rs.getString("name")%> </td>
                              <td><%=rs.getString("userName")%> </td>
                              </tr>
                              <%}
                          %>
                      </tbody>  
                </table>  
            </div>
        </div>
    </body>
</html>

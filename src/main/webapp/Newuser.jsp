<%-- 
    Document   : Newuser
    Created on : Dec 25, 2024, 11:05:05 PM
    Author     : carlo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>New User</title>
    </head>
    <%@ include file = "Header.jsp"%>
    <body>
     
         <script>
            var Msg ='<%=request.getParameter("msg")%>';
                if (Msg !== "null") {
                     alert(Msg);
             }
          </script>
        
        <div class="container mt-3">
            <form action="Adduser" class="bg-white rounded shadow-5-strong p-5" method="post">
                <div>
                    <label for="name" class="form-label">Name:</label>
                    <input type="text" class="form-control" id="name" placeholder="First and Last Name" name="name" required>
                <br>
                    <label for="username" class="form-label">Username:</label>
                    <input type="text" class="form-control" id="username" placeholder="Username" name="username" required>
                <br>
                <label for="password" class="form-label">Password:</label>
                <input type="password" class="form-control" id="password" placeholder="Password" name="password" required>
                <br>
                <div align="center">
                    <button  type="submit" class="btn btn-success" style="width: 20%;">Submit</button>
                </div>
                </div>
            </form>
            
        </div>
    </body>
    <script type="text/javascript"> window.onload = alertName; </script>
</html>

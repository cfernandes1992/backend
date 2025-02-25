<%-- 
    Document   : Login
    Created on : Dec 18, 2024, 10:18:37 PM
    Author     : carlo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
     <head>
        <title>Vacation</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0" >   
        
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="css/style.css">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>        
    </head>
    <body>
        
            <%
                response.setHeader("Cache-Control", "no-cache, no-store");
            %>
         <div class = "image">
            
        </div>
        <div class="row justify-content-center" style="margin-top: 50px;">
        <div class="col-xl-5 col-md-8" align="center">
            <form action="Log" class="bg-white rounded shadow-5-strong p-5" method="post">
            <h3>Login</h3>
            <input type="text" class="form-control" id= "username" name="username" placeholder="Username" required/><br>
            <input type="password" id="password" name= "password" class="form-control" placeholder="Password" required>
            <p style="color: red;">Invalid Username or Password </p>
            <button type="submit" class="btn btn-success" style="margin-top: 20px; width: 100%;">Login</button>
           
        </form>
        </div>
        </div>
    </body>
</html>
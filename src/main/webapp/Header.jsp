<%-- 
    Document   : Header
    Created on : Dec 24, 2024, 8:14:32 PM
    Author     : carlo
--%>


<!DOCTYPE html>
<html lang="en">
        <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0" >         
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/bootstrap.css">
        <link rel="stylesheet" href="css/style.css" type="text/css">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        
       </head>  
      
    <body>
        
        <%
                if(session.getAttribute("username")==null)
                response.sendRedirect("Login.jsp");
           
            %>
            
            
        <div class = "imge">
            <div align="right" style=" color: white; "> <div onclick="userinfo()"> <img  src="img/icons8-user-34.png" alt="user" style="margin-right: 25px; margin-top: 10px; cursor: pointer;"> </div> 
                <div id="changeps" align="left"  class="user">
                 <a href="Userpass.jsp">Change Password</a><br>
                 <a href="Logout">Log out</a>
            </div>
            </div>
        </div>
       <nav class="navbar navbar-expand-lg bg-primary" data-bs-theme="dark" style="width: 100%">
        <div class="container-fluid">
             <button class="navbar-toggler collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#navbarColor01" aria-controls="navbarColor01" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
              </button>
            <div class="navbar-collapse collapse show" id="navbarColor01" style="margin-left: 20%;">          
                    <ul class="navbar-nav me-auto">
                         <li class="nav-item">
                         <a class="nav-link" href="Dashboard.jsp">Requests</a>
                         <span class="visually-hidden">(current)</span>
                         </li>
                         <li class="nav-item">
                         <a class="nav-link" href="calendar.jsp">Calendar</a>
                         </li>
                        <li class="nav-item">
                         <a class="nav-link" href="Newform.jsp">Form</a>
                       </li> 
                       <li class="nav-item">
                         <a class="nav-link" href="Employee.jsp">Employee</a>
                       </li>
                       <li class="nav-item">
                         <a class="nav-link" href="Report.jsp">Report</a>
                       </li>
                       <li class="nav-item">
                         <a class="nav-link" href="Users.jsp">Users</a>
                       </li>                      
                    </ul>
            </div>
        </div>
       </nav>
    </body>
    <script>
            var x = document.getElementById("changeps");
            function userinfo(){
                
                if (x.style.display === "none") {
                    x.style.display = "block";
                  } else {
                    x.style.display = "none";
                  }
            }
        </script>
</html>

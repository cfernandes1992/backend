<%-- 
    Document   : Userpass
    Created on : Jan 19, 2025, 10:18:50 PM
    Author     : carlo
--%>


<html>
   
     <%@ include file = "Header.jsp"%> 
     <script>
            var result ='<%=request.getParameter("msg2")%>';           
                if (result !== "null") {
                    alert(result);  
             }
          </script>
    <body>
     
       <div class="container mt-3">
            <form id="forma" action="Changepass" class="bg-white rounded shadow-5-strong p-5" method="post">
                <div>
                    <label for="current" class="form-label">Current Password:</label>
                    <input type="password" class="form-control" id="current" placeholder="Enter your current password" name="current" required>
                <br>
                <label for="new1" class="form-label">New Password:</label>
                    <input type="password" class="form-control" id="new1" placeholder="Password" name="new1" required>
                <br>
                <label for="new2" class="form-label">Confirm New Password:</label>
                <input type="password" class="form-control" id="new2" placeholder="Password" name="new2" required>
                <br>
                <div align="center">
                    <button  type="submit" class="btn btn-success" style="width: 20%;">Submit</button>
                </div>
                </div>
            </form>
            
        </div>
        
 
    </body>
<script>  
    const form = document.getElementById("forma");  
    var pw1 = document.getElementById("new1");  
    var pw2 = document.getElementById("new2");
    form.addEventListener('submit', (event) => {
     if(pw1.value !== pw2.value)  
        {   
        event.preventDefault();
        alert("Passwords do not match");
     
        }
       }); 
</script>
</html>

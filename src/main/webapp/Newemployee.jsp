<%-- 
    Document   : Newemployee
    Created on : Feb 15, 2025, 10:38:12 AM
    Author     : carlo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
     
    </head>
    <%@ include file = "Header.jsp"%>
    <body>
        
            <div class="container mt-3">
            <p>New Employee<p>
            <form action="Addemployee" class="bg-white rounded shadow-5-strong p-5" method="post">
                <div>
                    <label for="name" class="form-label">Name:</label>
                    <input type="text" class="form-control" id="name" placeholder="Last name, First name" name="name" required>
                <br>
                    <label for="username" class="form-label">Hire Date:</label>
                    <input type="date" class="form-control" id="hiredate" name="hiredate" required>
                <br>
                <label for="department" class="form-label">Department:</label>
                <select id="department" name="department" class="form-control">
                    <option value="Accounting">Accounting </option>
                    <option value="Administration"> Administration</option>
                    <option value="Drivers">Drivers </option>
                    <option value="Human Resources">Human Resources </option>
                    <option value="Maintenance">Maintenance </option>
                    <option value="Orders">Orders </option>
                    <option value="Purchasing">Purchasing </option>
                    <option value="Production">Production </option>
                    <option value="Regulatory">Regulatory </option>
                    <option value="Sales">Sales </option>
                </select>
                <br>
                <div align="center">
                    <button  type="submit" class="btn btn-success" style="width: 20%;">Submit</button>
                </div>
                </div>
            </form>
            
        </div>
    </body>
</html>

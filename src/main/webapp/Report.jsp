<%-- 
    Document   : Report
    Created on : Jan 15, 2025, 9:42:33 PM
    Author     : carlo
--%>

<%@page import="java.util.Date"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="Classes.DatabaseConnection"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>List All</title>
    </head>
    
    <body>
        <%@ include file = "Header.jsp"%>
        <div style="width: 80%; margin-left: 10%; margin-top: 20px;">
            <div class="row">
                <div class="col">
                    <label for="search">Search by: </label>
                    <select class="" name="search" id="search" onchange="show()">
                        <option></option>
                        <option value="name">Employee Name</option>
                        <option value="date">Dates</option>
                        <option value="department">Department</option>
                        <option value="status">Status</option>
                    </select>
                </div>
                <div  id="opt">                    
                </div>
                
            </div>
        
            <div>
                 <%
            SimpleDateFormat ft  = new SimpleDateFormat("MM-dd-yyyy");
            Connection con = (Connection) DatabaseConnection.initializeDatabase();
            Statement st = con.createStatement();
            String sql = "select * from vacation.dates, vacation.forms where idForms = formsId";
            ResultSet rs = st.executeQuery(sql);
         
         %>      
                <table id= "myTable" class="table table-hover" style="margin-top: 20px;">
                    <thead>
                        <tr>
                          <th scope="col">Name</th>
                          <th scope="col">Department</th>
                          <th scope="col">Req Date</th>
                          <th scope="col">Type</th>
                          <th scope="col">Start Date</th>
                          <th scope="col">End Date</th>
                          <th scope="col"># of Days</th>
                          <th scope="col">Status</th>                          
                        </tr>
                    <tbody>
                         <%
                             
                              while(rs.next())
                              {
                              %>
                              <tr>
                              <td><a href="Editdates.jsp?id=<%=rs.getInt("id")%>&dpt=<%=rs.getString("departament")%>&name=<%=rs.getString("empName")%>"><%=rs.getString("empName")%></a> </td>
                              <td><%=rs.getString("departament")%> </td>
                              <td><%=ft.format(rs.getDate("reqDate"))%> </td>
                              <td><%=rs.getString("type")%> </td>
                              <td><%=ft.format(rs.getDate("inDate"))%> </td>
                              <td><%=ft.format(rs.getDate("endDate"))%> </td>
                              <td><%=days(rs.getDate("endDate"),rs.getDate("inDate"))%></td>
                              <td><%=rs.getString("status")%></td>                                                            
                              </tr>
                              <%}
                          %>
                    </tbody>
                    </thead>
                </table>
                    
            </div>
        </div>
    </body>
    
    <script>
        function show(){
            var option = document.getElementById("search").value;
            var div = document.getElementById("opt");
            if(option ==="name")
            {
              div.innerHTML = `
                        <div class="col" >                          
                            <input id="name" onkeyup="myFunction()" type="text" class="form-control" name="name" placeholder="Enter employee name" required/> 
                        </div>` ;
            } 
            
            if(option ==="date")
            {
              div.innerHTML = `
                        <div class="row">
                        <div class="col">
                            <label for="Date" class="form-label">From:</label>
                            <input type="date" class="form-control" name="startDate" required/>
                        </div>
                        <div class="col" >
                            <label for="Date" class="form-label">To:</label>
                            <input type="date" class="form-control" name="endDate" required/> 
                        </div>
                        </div>
                    `;
            }
            if(option ==="department")
            {
              div.innerHTML = `
                        <div class="container" >                          
                            <select id="dpt" onchange="myFunction2()"  name="dpt">
                                <option value="" >All</option>
                                <option value="Accounting" >Accounting</option>
                                <option value="Administration">Administration</option>
                                <option value="Drivers" >Drivers</option>
                                <option value="Human Resources" >Human Resources</option>
                                <option value="Maintenance" >Maintenance </option>
                                <option value="Orders" >Orders </option>
                                <option value="Purchasing" >Purchasing </option>
                                <option value="Production" >Production </option>
                                <option value="Regulatory" >Regulatory</option>
                                <option value="Sales" >Sales </option>
                            </select> 
                        </div>` ;
            } 
            
            if(option === "status")
            {
              div.innerHTML = `
                        <div class="container" >                          
                            <select id="status" onchange="myFunction3()" name="status">
                                <option value="" >All</option>
                                <option value="pending" >Pending</option>
                                <option value="approved">Approved</option>
                                <option value="denied" >Denied</option>                              
                            </select> 
                        </div>` ;
            } 
        }
        
    </script>
    
<script>
function myFunction() {
  // Declare variables
  var input, filter, table, tr, td, i, txtValue;
  input = document.getElementById("name");
  filter = input.value.toUpperCase();
  table = document.getElementById("myTable");
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

function myFunction2() {
 // Declare variables
  var input, filter, table, tr, td, i, txtValue;
  input = document.getElementById("dpt");
  filter = input.value.toUpperCase();
  table = document.getElementById("myTable");
  tr = table.getElementsByTagName("tr");

  // Loop through all table rows, and hide those who don't match the search query
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[1];
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

function myFunction3() {
 // Declare variables
  var input, filter, table, tr, td, i, txtValue;
  input = document.getElementById("status");
  filter = input.value.toUpperCase();
  table = document.getElementById("myTable");
  tr = table.getElementsByTagName("tr");

  // Loop through all table rows, and hide those who don't match the search query
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[7];
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
        public int days (Date date1, Date date2)
        {
       
        long difference_In_Time = date1.getTime() - date2.getTime();
        long difference_In_Days
                = (difference_In_Time
                   / (1000 * 60 * 60 * 24))
                  % 365;
        
        int days = (int) difference_In_Days+1;
        if(days>=7)
        return days-2;

        else if(days>=14)
        return days-4;

        else if(days>=21)
        return days-6;
       
        return days;

        }
    
    %>
</html>

<%-- 
    Document   : Formedit
    Created on : Dec 29, 2024, 10:21:10 PM
    Author     : carlo
--%>

<%@page import="java.time.Period"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="Classes.DatabaseConnection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="css/style.css" type="text/css">
        <link href="https://cdn.jsdelivr.net/npm/select2@4.0.13/dist/css/select2.min.css" rel="stylesheet" />
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/select2@4.0.13/dist/js/select2.min.js"></script>
    </head>
    <%@ include file = "Header.jsp" %>
 
    <body>
         <%
            SimpleDateFormat ft  = new SimpleDateFormat("MM-dd-yyyy");
            Connection con = (Connection) DatabaseConnection.initializeDatabase();
            Statement st = con.createStatement();
            String sql = "select * from vacation.forms where idForms =  "+request.getParameter("idform");
            String sql2 = "select * from vacation.dates where formsId = "+request.getParameter("idform")+" and status='pending'";
            ResultSet rs = st.executeQuery(sql);
            
            while(rs.next())
            {
         %>
        
         <style>
        .select2-container--default .select2-selection--single .select2-selection__rendered {
            color: black !important; /* Change to your desired color */
        }
        .select2-results__option {
            color: black !important; /* Change dropdown options text color */
        }
    </style>
         
         
   <div style="width: 80%; margin-left: 10%; margin-top: 20px;">
         <div class="row">
           <div class="col">
                <label>Employee Name: <%=rs.getString("empName")%> </label><br>
                <label>Department: <%=rs.getString("departament")%> </label><br>
                <label>Date of Request: <%=ft.format(rs.getDate("reqDate"))%> </label><br>
                <label>Comments: <%=rs.getString("obs")%> </label>
            </div>
        <%}%>
        
        <div class="col" >               
                <div >
                    <select id="searchable-select" onchange ="avdays(this.value)" style="width: 180px;">
                        <option value=""></option>
                        <%
                           String sql3 = "select * from vacation.employee";
                            ResultSet rs2 = st.executeQuery(sql3);
                            while(rs2.next()){
                        %>                       
                        <option value="<%=rs2.getInt("empID")%>"><%=rs2.getString("name")%></option>                     
                        <%}%>
                    </select>
                </div>  
        </div>
        <div class="col">
            <p id="datesava">             
            </p>           
        </div>      
         </div>       
            <div>
                <table class="table table-hover" style="margin-top: 20px;">
                    <thead>
                        <tr>
                          <th scope="col">Type</th>
                          <th scope="col">Start Date</th>
                          <th scope="col">End Date</th>
                          <th scope="col"># of Days</th>
                          <th scope="col">Action</th>                          
                        </tr>
                    <tbody>
                         <%
                              rs = st.executeQuery(sql2);
                              while(rs.next())
                              {                           
                              %>
                              <tr>                             
                              <td><%=rs.getString("type")%> </td>
                              <td><%=ft.format(rs.getDate("inDate"))%> </td>
                              <td><%=ft.format(rs.getDate("endDate"))%> </td>
                              <td><%=days(rs.getDate("endDate"),rs.getDate("inDate"))%></td>
                              <td>
                                  <select name="status2" onchange="save(this.value,<%=rs.getInt("id")%>,<%=days(rs.getDate("endDate"),rs.getDate("inDate"))%>)">
                                      <option  value= "pending" selected>
                                         Pending 
                                      </option>
                                      <option value="approved">
                                          Approve
                                      </option>
                                      <option value="denied">
                                          Deny
                                      </option>
                                </select>
                              </td>
                              </tr>
                              <%}
                              st.close();
                                rs2.close();
                                con.close();
                          %>
                    </tbody>
                    </thead>
                </table>
                    <p id="txtHint"></p>
            </div>
                    <div align="center">
                        <button type="submit" onclick= "finish(<%=request.getParameter("idform")%>)" class="btn btn-success">Finish</button>
                    </div>
         </div>                    
    </body>
  <script>
    $(document).ready(function() {
        $("#searchable-select").select2({
            placeholder: "Select an employee",
            allowClear: true
        });
    });
   
</script>  
    <script>
        function save(status,id,day) {
            const xhttp = new XMLHttpRequest();
            var empid = document.getElementById("searchable-select").value;
            if(empid!==0){
            xhttp.open("GET", "Savedates?iddates="+id+"&status="+status+"&days="+day+"&empid="+empid, true);
            xhttp.send();}
          }
          
          function avdays(id) {
            var xhttp = new XMLHttpRequest();
            xhttp.onload = function() {
             document.getElementById("datesava").innerHTML = this.responseText;
            
              };
            xhttp.open("GET", "AvDays?empid="+id, true);
            xhttp.send();
        }
   
        function finish(id){
            const xhttp = new XMLHttpRequest();
            xhttp.onload = function() {
                  window.location.href = "Dashboard.jsp";    
              };
            xhttp.open("POST", "Formstatus?idform="+id, true);
            xhttp.send();
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

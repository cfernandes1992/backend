<%-- 
    Document   : Newform
    Created on : Dec 25, 2024, 9:57:22 PM
    Author     : carlo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
        <head>
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                <title>Form</title>
        </head>
     <%@ include file = "Header.jsp" %>
    <body>       
        <div class="container mt-3">
            <div class="form-check">
            <form action="Request" class="bg-white rounded shadow-5-strong p-5" method="post">
            <div class="mb-3 mt-3">
                <label for="name" class="form-label">Name:</label>
                <input type="text" class="form-control" id="name" placeholder="First and Last Name" name="name" required>
                <br>
                
                <div class="row">
                    
                     <div class="col">
                        <label for="startDate" class="form-label">Start Date:</label>
                        <input type="date" class="form-control" id = "startDate" name="startDate" required/>
                    </div>
                     <div class="col">
                        <label for="Date" class="form-label">End Date:</label> 
                        <input type="date" class="form-control" name="endDate" required/>
                    </div>
                    <div >
                        <label for="leave">Type of Leave:</label><br>
                        <select id="leave" name="leave" class="form-select" style="width: auto;">
                          <option value="Vacation">Vacation</option>
                          <option value="Bereavement Leave">Bereavement</option>
                          <option value="Half Day">Half Day</option>
                          <option value="Jury Duty Leave">Jury Duty</option>
                        </select>
                    </div>
                       <div class="container" style="margin-top: 15px;">
                          <div id="inputFields" class="container">
                        </div>
                           <div style="margin-top: 15px; width: 30%;">
                               <button type="button" class="btn btn-primary" onclick ="addFn()">Add More</button>                                
                           </div>                           
                    </div>
                    
                    <script>
                        function addFn() {
                            const divEle = document.getElementById("inputFields");
                            divEle.innerHTML += `
                        <div class="row" id="test">
                            <div class="row">
     
                        <div class="col">
                            <label for="Date" class="form-label">Start Date:</label>
                            <input type="date" class="form-control" name="startDate2" required/>
                        </div>
                        <div class="col" >
                            <label for="Date" class="form-label">End Date:</label>
                            <input type="date" class="form-control" name="endDate2" required/> 
                        </div>
                         <div class="container">
                           <label for="leave2">Type of Leave:</label><br>
                            <select id="leave2" name="leave2" class="form-select" style="width: auto;">
                              <option value="Vacation">Vacation</option>
                              <option value="Bereavement Leave">Bereavement</option>
                              <option value="Half Day">Half Day</option>
                              <option value="Jury Duty Leave">Jury Duty</option>
                            </select>
                         </div>
                        <div class="delete">
                            <button class="btn" type="button" onclick="del()"><i class="fa fa-trash"></i></button>
                        </div>    
                        </div>
                      `;
                        }
                        
                     function del(){const divEle = document.getElementById("test").remove();}   
                    </script>

                </div>
                
                <br>
                <label for="Departament" class="form-label">Department:</label>
                
                    <div class="form-check" style="margin-bottom: 10px;" >
                        <input type="radio" class="form-check-input" id="accounting" name="optradio" value="Accounting">
                        <label class="form-check-label" for="accounting">Accounting</label>
                     </div>                   
                     <div class="form-check" style="margin-bottom: 10px;">
                        <input type="radio" class="form-check-input" id="administration" name="optradio" value="Administration">
                        <label class="form-check-label" for="administration">Administration</label>
                     </div>
                <div class="form-check" style="margin-bottom: 10px;">
                        <input type="radio" class="form-check-input" id="driver" name="optradio" value="Drivers">
                        <label class="form-check-label" for="driver">Drivers</label>
                     </div>
                     <div class="form-check" style="margin-bottom: 10px;">
                        <input type="radio" class="form-check-input" id="hr" name="optradio" value="Human Resources">
                        <label class="form-check-label" for="hr">Human Resources</label>
                     </div>
                    <div class="form-check" style="margin-bottom: 10px;">
                        <input type="radio" class="form-check-input" id="maintenance" name="optradio" value="Maintenance">
                        <label class="form-check-label" for="maintenance">Maintenance</label>
                     </div>
                     <div class="form-check" style="margin-bottom: 10px;">
                        <input type="radio" class="form-check-input" id="orders" name="optradio" value="Orders">
                        <label class="form-check-label" for="orders">Orders</label>
                     </div>
                     <div class="form-check" style="margin-bottom: 10px;">
                        <input type="radio" class="form-check-input" id="purchasing" name="optradio" value="Purchasing">
                        <label class="form-check-label" for="purchasing">Purchasing</label>
                     </div>
                     <div class="form-check" style="margin-bottom: 10px;">
                        <input type="radio" class="form-check-input" id="production" name="optradio" value="Production">
                        <label class="form-check-label" for="production">Production</label>
                     </div>
                     <div class="form-check" style="margin-bottom: 10px;">
                        <input type="radio" class="form-check-input" id="regulatory" name="optradio" value="Regulatory">
                        <label class="form-check-label" for="regulatory">Regulatory</label>
                     </div>
                     <div class="form-check">
                        <input type="radio" class="form-check-input" id="sales" name="optradio" value="Sales">
                        <label class="form-check-label" for="sales">Sales</label>
                     </div>
                </div>
            <br><!-- comment -->
            <label for="comment">Comments(optional):</label>
            <textarea class="form-control" rows="3" id="comment" name="comments"></textarea>
            <br>
        
            <br>
            <br>
                <div align="center">
                    <button  type="submit" class="btn btn-success" style="width: 20%;">Submit</button>
                </div>
        </form>
        </div>
        </div>
    </body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Admin Page</title>

<%@ include file="../component/allcss.jsp" %>
<!-- Add your CSS for the cards -->
<style>
  .card {
    border: 1px solid #ddd;
    border-radius: 8px;
    padding: 19px;
    margin: 10px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    width: 250px;
    text-align: center;
    left:80px;
  }
  .card:hover {
    box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
  }
  .card a {
    text-decoration: none;
    color: #007bff;
    font-weight: bold;
  }
  
  
  
        .button-container {
            text-align: center;
            margin-top: 50px;
        }

       
        button {
            background-color: #4CAF50;
            color: white;  
            border: none;  
            padding: 15px 32px; 
            text-align: center; 
            text-decoration: none;
            display: inline-block;
            font-size: 16px; 
            margin: 10px; 
            border-radius: 5px;
            cursor: pointer; 
            transition: background-color 0.3s; 

       
        button:hover {
            background-color: #45a049;
        }

      
        a {
            text-decoration: none; 
        }
        
        
  
  
</style>
</head>
<body>
<%@ include file="component/navbar.jsp" %>


<div class="container">
  <div class="row">
    <div class="col-md-4">
      <div class="card">
        <h4>View Appointments</h4>
        <a href="viewAppointment.jsp">Click here to view appointments</a>
      </div>
    </div>

    
    <div class="col-md-4">
      <div class="card">
        <h4>View Doctors</h4>
        <a href="viewDoctor.jsp">Click here to view doctors</a>
      </div>
    </div>
    
  </div>
</div> <br><br>


<div class="container">
  <div class="row">
    <div class="col-md-4">
      <div class="card">
        <h4>New Doctor Add</h4>
        <a href="newDoctorAdd.jsp">Click here to Add New Doctor</a>
      </div>
    </div>

    
    <div class="col-md-4">
      <div class="card">
        <h4> New Appointment</h4>
        <a href="appointment.jsp">Click here to Add Appointment</a>
      </div>
    </div>
    
  </div>
</div>
<div class="button-container">
    <!-- Book Appointment Button -->
    <a href="index.jsp">
        <button type="button">back</button>
    </a>

    <!-- Admin Page Button 
    <a href="login_admin.jsp">
        <button type="button">Admin Page</button>
    </a>-->
</div>



</body>
</html>

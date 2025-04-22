

<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="conn.jsp" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Appointment</title>
<%@include file="../component/allcss.jsp"%>

<style type="text/css">
body {
    background-image: url("img/userimage.jpg");
    background-size: cover;
    background-repeat: no-repeat;
    background-position: center;
     height: 450px;
}

.paint-card {
    box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}

.container {
    width: 50%;
    margin: 50px auto;
    background-color: rgba(255, 255, 255, 0.8); 
    padding: 20px;
    border-radius: 8px;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    height: 450px; 
    overflow-y: auto; 
}

h1 {
    text-align: center;
    color: #333;
}

label {
    font-weight: bold;
    display: block;
    margin-top: 10px;
    color: #333;
}

input[type="text"],
input[type="email"],
input[type="tel"],
input[type="date"],
input[type="time"],
input[type="password"],
textarea,
select {
    width: 100%;
    padding: 10px;
    margin-top: 5px;
    border: 1px solid #ccc;
    border-radius: 4px;
    font-size: 16px;
}

textarea {
    resize: vertical;
    height: 100px;
}


select {
    background-color: #fff;
    -webkit-appearance: none;  /* Remove default styles in webkit browsers */
    -moz-appearance: none;     /* Remove default styles in Firefox */
    appearance: none;          /* Remove default styles in modern browsers */
    padding-right: 30px;       /* Space for custom arrow */
   
   
    background-repeat: no-repeat;
    background-position: right 10px center;
    background-size: 1.2em;
}

button {
    background-color: #4CAF50;
    color: white;
    padding: 12px 20px;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    font-size: 16px;
    width: 100%;
}

button:hover {
    background-color: #45a049;
}

.form-footer {
    text-align: center;
    margin-top: 20px;
}
</style>





</head>
<body>
<%@include file="component/navbar.jsp"%>





    
</head>
<body>

    <div class="container">
    <h1>Appointment Form</h1>
    <form action="appointment.jsp" method="post">
        <label for="name">Full Name</label>
        <input type="text" id="name" name="name" required>

        <label for="email">Email Address</label>
        <input type="email" id="email" name="email" required>

        <label for="phone">Phone Number</label>
        <input type="tel" id="phone" name="phone" required>

        <label for="doctor">Doctor Name</label>
        <select id="doctor" name="doctor" required>
            <option value="Dr. Pankaj Singh">Dr. Pankaj Singh</option>
            <option value="Dr.  Neha Singh">Dr.  Neha Singh</option>
            <option value="Dr. Manish Pal">Dr. Manish Pal </option>
            <option value="Dr. Yash Pal">Dr. Yash Pal</option>
            <option value="Dr. Chitra Tawde">Dr. Chitra Tawde</option>
            <option value="Dr. Krishna">Dr. Krishna </option>
        </select>

        <label for="password">Password</label>
        <input type="password" id="password" name="password" required>

        <label for="date">Appointment Date</label>
        <input type="date" id="date" name="date" required>

        <label for="time">Appointment Time</label>
        <input type="time" id="time" name="time" required>

     

        <button type="submit">Submit Appointment</button>
    </form>
    
    
    <%
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String phone = request.getParameter("phone");
    String doctor = request.getParameter("doctor");
    String password = request.getParameter("password");
    String date = request.getParameter("date");
    String time = request.getParameter("time");

    if (name == null || name.trim().isEmpty()) {
    //   out.println("<script>alert('Full Name is required');</script>");
        return;
    }

    try {
        String query = "INSERT INTO appointment (Full_Name, Email_id, Mobile_no, Doctor_name, Password, Appointment_date, Appointment_time) VALUES (?, ?, ?, ?, ?, ?, ?)";
        PreparedStatement psmt = conn.prepareStatement(query);

        psmt.setString(1, name);
        psmt.setString(2, email);
        psmt.setString(3, phone);
        psmt.setString(4, doctor);
        psmt.setString(5, password);
        psmt.setString(6, date);
        psmt.setString(7, time);

        int result = psmt.executeUpdate();

        if (result > 0) {
            out.println("<script>");
            out.println("alert('Successfully Done Appointment✅✅');");
            out.println("window.location='index.jsp';");
            out.println("</script>");
        } else {
            out.println("<p>Error in Reservation</p>");
        }

    } catch (Exception e) {
        out.println("Error: " + e.getMessage());
    }
%>

</div>
         
         
         
        
         
         
         
         
         

</body>
</html>
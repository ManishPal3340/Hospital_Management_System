<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="conn.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>View Appointment</title>

    <%@ include file="../component/allcss.jsp" %>

    <!-- Table styling -->
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
        }
        th, td {
            padding: 12px;
            text-align: left;
            border: 1px solid #ddd;
        }
        th {
            background-color: #f2f2f2;
        }
        tr:hover {
            background-color: #f5f5f5;
        }
        .btn {
            padding: 6px 12px;
            margin: 5px;
            border: none;
            cursor: pointer;
            text-align: center;
        }
        .edit-btn {
            background-color: #4CAF50;
            color: white;
        }
        .delete-btn {
            background-color: #f44336;
            color: white;
        }
        .complete-btn {
            background-color: #008CBA;
            color: white;
        }
        .search-box {
            text-align: center;
            margin: 20px;
        }
        .search-box input {
            padding: 6px;
            font-size: 16px;
            width: 30%;
            border-radius: 5px;
            border: 1px solid #ccc;
        }
        .search-box button {
            padding: 6px 12px;
            font-size: 16px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .search-box button:hover {
            background-color: #45a049;
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

<div class="search-box">
    <!-- Corrected form tag -->
    <form action="viewAppointment.jsp" method="post">
        <input type="text" name="searchQuery" placeholder="Search doctor or patient name" required>
        <button type="submit">Search</button>
    </form>
</div>

<%

    // Get the search query from the form submission
    String searchQuery = request.getParameter("searchQuery");

    try {
        String query;

        
        if (searchQuery != null && !searchQuery.isEmpty()) {
            query = "SELECT * FROM appointment WHERE Full_name LIKE ? OR Doctor_name LIKE ?";
        } else {
            query = "SELECT * FROM appointment"; 
        }

        PreparedStatement psmt = conn.prepareStatement(query);

        // If search query is provided, apply LIKE clause with wildcards
        
        
        if (searchQuery != null && !searchQuery.isEmpty()) {
            psmt.setString(1, "%" + searchQuery + "%"); 
            psmt.setString(2, "%" + searchQuery + "%"); 
        }

        ResultSet rs = psmt.executeQuery();

        boolean foundAppointment = false;

        // Start table
        out.println("<table>");
        out.println("<tr>");
        out.println("<th>ID</th>");
        out.println("<th>Patient Name</th>");
        out.println("<th>Doctor Name</th>");
        out.println("<th>Mobile No</th>");
        out.println("<th>Password</th>");
        out.println("<th>Appointment Date</th>");
        out.println("<th>Appointment Time</th>");
        out.println("<th>Actions</th>");  
        out.println("</tr>");

        
        while (rs.next()) {
            foundAppointment = true;
            int appointmentId = rs.getInt("id");
            String fullName = rs.getString("Full_name");
            String doctorName = rs.getString("Doctor_name");
            int mobileNo = rs.getInt("Mobile_no");
            String password = rs.getString("Password");
            String appointmentDate = rs.getTimestamp("Appointment_date").toString();
            String appointmentTime = rs.getTime("Appointment_time").toString();

            // Display row
            out.println("<tr>");
            out.println("<td>" + appointmentId + "</td>");
            out.println("<td>" + fullName + "</td>");
            out.println("<td>" + doctorName + "</td>");
            out.println("<td>" + mobileNo + "</td>");
            out.println("<td>" + password + "</td>");
            out.println("<td>" + appointmentDate + "</td>");
            out.println("<td>" + appointmentTime + "</td>");
            out.println("<td>");
            // Edit button
            out.println("<a href='editAppointment.jsp?id=" + appointmentId + "'><button class='btn edit-btn'>Edit</button></a>");
            // Delete button
            out.println("<a href='deleteAppointment.jsp?id=" + appointmentId + "'><button class='btn delete-btn'>Delete</button></a>");
        
            out.println("</td>");
            out.println("</tr>");
        }

       
        out.println("</table>");

     
        if (!foundAppointment) {
            out.println("<p>No appointments found.</p>");
        }

       
        rs.close();
        psmt.close();
    } catch (Exception e) {
        e.printStackTrace();
        out.println("<p>Error: " + e.getMessage() + "</p>");
    }
%>


<div class="button-container">
    <!-- Book Appointment Button -->
    <a href="appointment.jsp">
        <button type="button">Book Appointment</button>
    </a>

    <!-- Admin Page Button -->
    <a href="login_admin.jsp">
        <button type="button">login Admin  Page</button>
    </a>
    
    
    
    <!-- Admin Page Button -->
    <a href="viewAdmin.jsp">
        <button type="button">View Admin Page</button>
    </a>
</div>


</body>
</html>

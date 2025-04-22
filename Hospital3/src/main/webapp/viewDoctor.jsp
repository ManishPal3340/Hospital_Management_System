<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="conn.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Doctor</title>
<%@ include file="../component/allcss.jsp" %>

<!-- CSS Styles -->
<style type="text/css">
    body {
        font-family: Arial, sans-serif;
        background-color: #f4f4f4;
        color: #333;
    }
    h1 {
        text-align: center;
        margin-top: 20px;
        color: #007BFF;
    }
    table {
        width: 80%;
        margin: 20px auto;
        border-collapse: collapse;
        box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
    }
    th, td {
        padding: 12px;
        text-align: left;
        border: 1px solid #ddd;
    }
    th {
        background-color: #4CAF50;
        color: white;
    }
    tr:nth-child(even) {
        background-color: #f2f2f2;
    }
    tr:hover {
        background-color: #ddd;
    }
    .container {
        max-width: 90%;
        margin: 0 auto;
    }
    .search-box {
        text-align: center;
        margin: 20px;
    }
    .search-box input {
        padding: 8px;
        font-size: 16px;
        width: 30%;
        border-radius: 5px;
        border: 1px solid #ccc;
    }
    .search-box button {
        padding: 8px 16px;
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

<div class="container">
    <!-- Search Form -->
    <div class="search-box">
        <form action="viewDoctor.jsp" method="get">
            <input type="text" name="searchQuery" placeholder="Search by name or specialization" required>
            <button type="submit">Search</button>
        </form>
    </div>

    <%
    String searchQuery = request.getParameter("searchQuery"); // Get search query from form
    
    try {
        String q;
        
        // If a search query is provided, use LIKE clause; otherwise, select all doctors
        if (searchQuery != null && !searchQuery.isEmpty()) {
            q = "SELECT * FROM doctor WHERE Full_name LIKE ? OR Specialization LIKE ?";
        } else {
            q = "SELECT * FROM doctor"; // Default query to fetch all doctors
        }

        PreparedStatement psmt = conn.prepareStatement(q);

        // If searchQuery is provided, set parameters for LIKE clause
        if (searchQuery != null && !searchQuery.isEmpty()) {
            psmt.setString(1, "%" + searchQuery + "%"); // Use % for wildcard search (anywhere in the string)
            psmt.setString(2, "%" + searchQuery + "%"); // Apply the search to both Full_name and Specialization
        }

        ResultSet rs = psmt.executeQuery();

        boolean foundDoctor = false;

        out.println("<h1>Doctor Details</h1>");
        out.println("<table>");
        out.println("<tr>");
        out.println("<th>ID</th>");
        out.println("<th>Doctor Name</th>");
        out.println("<th>Email ID</th>");
        out.println("<th>Password</th>");
        out.println("<th>Specialization</th>");
        out.println("</tr>");

        while (rs.next()) {
            foundDoctor = true;
            out.println("<tr>");
            out.println("<td>" + rs.getInt("id") + "</td>");
            out.println("<td>" + rs.getString("Full_name") + "</td>");
            out.println("<td>" + rs.getString("Email_id") + "</td>");
            out.println("<td>" + rs.getString("password") + "</td>");
            out.println("<td>" + rs.getString("Specialization") + "</td>");
            out.println("</tr>");
        }

        if (!foundDoctor) {
            out.println("<tr><td colspan='5' style='text-align:center; color:red;'>No doctor found!</td></tr>");
        }

        out.println("</table>");
    } catch (Exception e) {
        out.println("<p style='color:red;'>Error: " + e.getMessage() + "</p>");
    }
    %>
    
    
    <div class="button-container">
    <!-- Book Appointment Button -->
    <a href="doctor_login.jsp">
        <button type="button">logout</button>
    </a>

    
    <a href="index.jsp">
        <button type="button">home Page</button>
    </a>
    
    
     <a href="viewAppointment.jsp">
        <button type="button">View Appointment</button>
    </a>
    
    
    <a href="viewAdmin.jsp">
        <button type="button">View Admin Page</button>
    </a>
</div>
    
    
</div>

</body>
</html>

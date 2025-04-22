<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="conn.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>View User Registration</title>

<%@ include file="../component/allcss.jsp" %>

<!-- Adding custom styles for table -->
<style>
    body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
        background-color: #f4f4f9;  
    }

    table {
        width: 80%;
        margin: 20px auto;
        border-collapse: collapse;
        box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
    }

    th, td {
        padding: 12px 15px;
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

    h1 {
        text-align: center;
        color: #333;
    }
</style>
</head>
<body>

<%@ include file="component/navbar.jsp" %>

<%
    try {
        String q = "SELECT * FROM registration";
        PreparedStatement psmt = conn.prepareStatement(q);
        ResultSet rs = psmt.executeQuery();

        boolean foundRegistration = false;

        out.println("<h1>User Registration Details</h1>");
        out.println("<table>");
        out.println("<tr>");
        out.println("<th>ID</th>");
        out.println("<th>Name</th>");
        out.println("<th>Email ID</th>");
        out.println("<th>Password</th>");
        out.println("</tr>");

        while (rs.next()) {
            foundRegistration = true;

            out.println("<tr>");
            out.println("<td>" + rs.getInt("id") + "</td>");
            out.println("<td>" + rs.getString("Full_name") + "</td>");
            out.println("<td>" + rs.getString("Email_id") + "</td>");
            out.println("<td>" + rs.getString("password") + "</td>");
            out.println("</tr>");
        }

        if (!foundRegistration) {
            out.println("<tr><td colspan='4'>No registration found.</td></tr>");
        }

        out.println("</table>");
        
        
        
        
        
        

    } catch (Exception e) {
        out.println("<p>Error occurred while fetching registration data: " + e.getMessage() + "</p>");
    }
%>

</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="conn.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Edit Appointment</title>
    <%@ include file="../component/allcss.jsp" %>

    <!-- Custom CSS for the Edit Appointment Page -->
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f7fc;
            padding: 20px;
        }

        h2 {
            text-align: center;
            color: #333;
            margin-bottom: 30px;
        }

        .container {
            max-width: 600px;
            margin: 0 auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        form {
            display: flex;
            flex-direction: column;
        }

        form div {
            margin-bottom: 15px;
        }

        label {
            font-weight: bold;
            color: #555;
        }

        input[type="text"], input[type="datetime-local"], input[type="time"] {
            width: 100%;
            padding: 10px;
            font-size: 14px;
            margin-top: 5px;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-sizing: border-box;
        }

        button {
            background-color: #4CAF50;
            color: white;
            padding: 12px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
        }

        button:hover {
            background-color: #45a049;
        }

        .back-btn {
            background-color: #f44336;
            margin-top: 20px;
            padding: 10px 15px;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            text-decoration: none;
            display: inline-block;
        }

        .back-btn:hover {
            background-color: #d32f2f;
        }
    </style>

</head>
<body>
<%@ include file="component/navbar.jsp" %>

<%
    // Get appointment ID from the request
    int appointmentId = Integer.parseInt(request.getParameter("id"));

    try {
        // Query to get the appointment details
        String query = "SELECT * FROM appointment WHERE id = ?";
        PreparedStatement psmt = conn.prepareStatement(query);
        psmt.setInt(1, appointmentId);
        ResultSet rs = psmt.executeQuery();

        if (rs.next()) {
            String fullName = rs.getString("Full_name");
            String doctorName = rs.getString("Doctor_name");
            int mobileNo = rs.getInt("Mobile_no");
            String password = rs.getString("Password");
            String appointmentDate = rs.getTimestamp("Appointment_date").toString();
            String appointmentTime = rs.getTime("Appointment_time").toString();

%>

<div class="container">
    <h2>Edit Appointment</h2>

    <form action="updateAppointment.jsp" method="post">
        <input type="hidden" name="id" value="<%= appointmentId %>">
        
        <div>
            <label>Patient Name:</label>
            <input type="text" name="fullName" value="<%= fullName %>" required>
        </div>
        
        <div>
            <label>Doctor Name:</label>
            <input type="text" name="doctorName" value="<%= doctorName %>" required>
        </div>
        
        <div>
            <label>Mobile No:</label>
            <input type="text" name="mobileNo" value="<%= mobileNo %>" required>
        </div>
        
        <div>
            <label>Password:</label>
            <input type="text" name="password" value="<%= password %>" required>
        </div>
        
        <div>
            <label>Appointment Date:</label>
            <input type="datetime-local" name="appointmentDate" value="<%= appointmentDate.substring(0, 16) %>" required>
        </div>
        
        <div>
            <label>Appointment Time:</label>
            <input type="time" name="appointmentTime" value="<%= appointmentTime.substring(0, 5) %>" required>
        </div>

        <button type="submit">Update Appointment</button>
    </form>

    <a href="viewAppointment.jsp" class="back-btn">Back to Appointments</a>
</div>

<%
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
%>

</body>
</html>

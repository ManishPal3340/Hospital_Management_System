<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="conn.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Update Appointment</title>
    <%@ include file="../component/allcss.jsp" %>

    <!-- Custom CSS for Update Appointment Page -->
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

        .alert {
            background-color: #f44336;
            color: white;
            padding: 15px;
            margin: 20px 0;
            border-radius: 4px;
            text-align: center;
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

<%
    // Get updated appointment details from the form
    int appointmentId = Integer.parseInt(request.getParameter("id"));
    String fullName = request.getParameter("fullName");
    String doctorName = request.getParameter("doctorName");
    String mobileNo = request.getParameter("mobileNo");
    String password = request.getParameter("password");
    String appointmentDate = request.getParameter("appointmentDate");
    String appointmentTime = request.getParameter("appointmentTime");

    try {
        // Update query
        String query = "UPDATE appointment SET Full_name = ?, Doctor_name = ?, Mobile_no = ?, Password = ?, Appointment_date = ?, Appointment_time = ? WHERE id = ?";
        PreparedStatement psmt = conn.prepareStatement(query);
        psmt.setString(1, fullName);
        psmt.setString(2, doctorName);
        psmt.setString(3, mobileNo);
        psmt.setString(4, password);
        psmt.setString(5, appointmentDate);
        psmt.setString(6, appointmentTime);
        psmt.setInt(7, appointmentId);

        int rowsUpdated = psmt.executeUpdate();

        if (rowsUpdated > 0) {
            out.println("<script>alert('Appointment updated successfully'); window.location='viewAppointment.jsp';</script>");
        } else {
            out.println("<script>alert('Error: Unable to update appointment'); window.location='editAppointment.jsp?id=" + appointmentId + "';</script>");
        }
    } catch (Exception e) {
        e.printStackTrace();
        out.println("<script>alert('Error: " + e.getMessage() + "'); window.location='viewAppointment.jsp';</script>");
    }
%>

</body>
</html>

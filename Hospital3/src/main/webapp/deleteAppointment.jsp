<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="conn.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Delete Appointment</title>
    <%@ include file="../component/allcss.jsp" %>
</head>
<body>

<%
    int appointmentId = Integer.parseInt(request.getParameter("id"));

    try {
        // Delete query
        String query = "DELETE FROM appointment WHERE id = ?";
        PreparedStatement psmt = conn.prepareStatement(query);
        psmt.setInt(1, appointmentId);

        int rowsDeleted = psmt.executeUpdate();

        if (rowsDeleted > 0) {
            out.println("<script>alert('Appointment deleted successfully'); window.location='viewAppointment.jsp';</script>");
        } else {
            out.println("<script>alert('Error: Unable to delete appointment'); window.location='viewAppointment.jsp';</script>");
        }
    } catch (Exception e) {
        e.printStackTrace();
        out.println("<script>alert('Error: " + e.getMessage() + "'); window.location='viewAppointment.jsp';</script>");
    }
%>

</body>
</html>

<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="conn.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Login Page</title>
<%@include file="../component/allcss.jsp"%>

<style type="text/css">
    body {
        background-image: url("img/Adminimage.jpg");
        background-size: cover;
        background-repeat: no-repeat;
        background-position: center;
        height: 650px;
    }
    .paint-card {
        box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
    }
</style>
</head>
<body>
    <%@include file="component/navbar.jsp"%>

    <div class="container p-5">
        <div class="row">
            <div class="col-md-4 offset-md-4">
                <div class="card paint-card">
                    <div class="card-body">
                        <p class="fs-4 text-center" style="font-weight: bold;">Admin Login</p>
                        <form action="login_admin.jsp" method="post">
                            <div class="mb-3">
                                <label class="form-label">Enter Name</label>
                                <input type="text" name="name" class="form-control" placeholder="Enter Full Name" required>
                            </div>

                            <div class="mb-3">
                                <label class="form-label">Enter Password</label>
                                <input type="password" name="password" class="form-control" placeholder="Password" required>
                            </div>

                            <button type="submit" class="btn bg-success text-white col-md-12">Login</button>
                            <div class="mt-3 text-center">
                                <a href="newDoctorAdd.jsp">Register New Doctor</a>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

<%
    if ("POST".equalsIgnoreCase(request.getMethod())) {
        String name = request.getParameter("name").trim();
        String password = request.getParameter("password").trim();

        try {
            String query = "SELECT * FROM doctor WHERE Full_name = ? AND Password = ?";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, name);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                String doctorName = rs.getString("Full_name");
                session.setAttribute("adminName", doctorName); // Optional: track session login
%>
                <script>
                    alert("Welcome <%= doctorName %>!");
                    window.location = "viewAdmin.jsp";
                </script>
<%
            } else {
%>
                <script>
                    alert("Incorrect username or password. Please try again.");
                </script>
<%
            }

            rs.close();
            ps.close();
        } catch (Exception e) {
            out.println("<script>alert('Error occurred: " + e.getMessage() + "');</script>");
        }
    }
%>

</body>
</html>

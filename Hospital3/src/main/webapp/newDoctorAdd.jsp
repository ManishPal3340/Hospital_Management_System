<%@ page import="java.sql.PreparedStatement" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ page isELIgnored="false" %>
<%@ include file="conn.jsp" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Doctor Registration Page</title>
    <%@ include file="../component/allcss.jsp" %>
    <style type="text/css">
        body {
            background-image: url("img/doctorimage.jpg");
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
    <%@ include file="component/navbar.jsp" %>

    <div class="container p-5">
        <div class="row">
            <div class="col-md-4 offset-md-4">
                <div class="card paint-card">
                    <div class="card-body">
                        <p class="fs-4 text-center" style="font-weight: bold;">Doctor Registration</p>
                        <form action="newDoctorAdd.jsp" method="post" autocomplete="off">
                            <!-- Full Name Field -->
                            <div class="mb-3">
                                <label class="form-label">Enter Full Name</label>
                                <input type="text" name="fullName" class="form-control" placeholder="Full Name" required>
                            </div>

                            <!-- Email Field -->
                            <div class="mb-3">
                                <label class="form-label">Enter Email</label>
                                <input type="email" name="email" class="form-control" placeholder="Email" required>
                            </div>

                            <!-- Password Field -->
                            <div class="mb-3">
                                <label class="form-label">Enter Password</label>
                                <input type="password" name="password" class="form-control" placeholder="Password" required>
                            </div>

                            <!-- Contact Number Field -->
                            <div class="mb-3">
                                <label class="form-label">Enter Contact Number</label>
                                <input type="text" name="contactNumber" class="form-control" placeholder="Contact Number" required>
                            </div>

                            <!-- Specialization Field -->
                            <div class="mb-3">
                                <label class="form-label">Specialization</label>
                                <input type="text" name="specialization" class="form-control" placeholder="Specialization" required>
                            </div>

                            <button type="submit" class="btn bg-success text-white col-md-12">Register</button>
                        </form>

                        <% 
                            // Get the form data after submission
                            String fullName = request.getParameter("fullName");
                            String email = request.getParameter("email");
                            String password = request.getParameter("password");
                            String contactNumber = request.getParameter("contactNumber");
                            String specialization = request.getParameter("specialization");
                            
                            // Process form data only when the form is submitted
                            if (fullName != null && email != null && password != null && contactNumber != null && specialization != null) {
                                try {
                                    String q = "INSERT INTO doctor (Full_name, Email_id, Password, Mobile_no, Specialization) VALUES (?, ?, ?, ?, ?)";
                                    PreparedStatement psmt = conn.prepareStatement(q);

                                    psmt.setString(1, fullName);
                                    psmt.setString(2, email);
                                    psmt.setString(3, password);
                                    psmt.setString(4, contactNumber);
                                    psmt.setString(5, specialization);

                                    int result = psmt.executeUpdate();
                                    if (result > 0) {
                                    	out.println("<script>");
                        			    out.println("alert('Successfully Done ✅✅');");
                        			    out.println("window.location='doctor_login.jsp';");
                        			    out.println("</script>");
                        				 
                                    } else {
                                        out.println("<p>Failed to register the doctor ❌❌</p>");
                                    }
                                } catch (Exception e) {
                                    out.println("Error: " + e.getMessage());
                                }
                            }
                        %>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>

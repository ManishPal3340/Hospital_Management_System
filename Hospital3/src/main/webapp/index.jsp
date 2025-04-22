<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="conn.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Global Hospital</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- Bootstrap CSS and JS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>

    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"/>

    <style>
        .paint-card {
            box-shadow: 0 0 10px rgba(0,0,0,0.3);
        }

        .doctor-card img {
            width: 100%;
            height: 300px;
            object-fit: cover;
            border-radius: 8px;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .doctor-card:hover img {
            transform: scale(1.05);
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
        }

        .doctor-card .card-body {
            padding: 10px;
        }

        .doctor-name {
            font-weight: bold;
            font-size: 18px;
        }

        .doctor-specialization {
            font-size: 14px;
            color: #666;
        }
    </style>
</head>
<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark bg-success">
    <div class="container-fluid">
        <a class="navbar-brand" href="#"><i class="fa-solid fa-house-medical"></i> Global Hospital</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item"><a class="nav-link active" href="#team">DOCTOR</a></li>
                <li class="nav-item"><a class="nav-link active" href="#about">ABOUT</a></li>
                <li class="nav-item">
                    <button type="button" class="btn btn-outline-light" data-bs-toggle="modal" data-bs-target="#loginModal">
                        Login
                    </button>
                </li>
            </ul>
        </div>
    </div>
</nav>

<!-- Login Modal -->
<div class="modal fade" id="loginModal" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Login Page</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <div class="modal-body">
                <form action="index.jsp" method="post">
                    <label>Username</label>
                    <input type="text" name="username" class="form-control" required>
                    <label>Password</label>
                    <input type="password" name="password" class="form-control" required>
                    <input type="submit" class="btn btn-primary mt-3" value="Login">
                </form>

                <%
                    String username = request.getParameter("username");
                    String password = request.getParameter("password");

                    if (username != null && password != null) {
                        try {
                            String query = "SELECT * FROM users WHERE username = ? AND password = ?";
                            PreparedStatement ps = conn.prepareStatement(query);
                            ps.setString(1, username);
                            ps.setString(2, password);
                            ResultSet rs = ps.executeQuery();

                            if (rs.next()) {
                                String role = rs.getString("role");
                                if ("admin".equals(role)) {
                                    response.sendRedirect("login_admin.jsp");
                                } else if ("user".equals(role)) {
                                    response.sendRedirect("user_login.jsp");
                                }
                            } else {
                                out.println("<p class='text-danger mt-2'>Invalid Username or Password</p>");
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

<!-- Carousel -->
<div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
    <div class="carousel-inner">
        <div class="carousel-item active">
            <img src="img/hos.jpg" class="d-block w-100" height="569px">
        </div>
        <div class="carousel-item">
            <img src="img/hos3.jpg" class="d-block w-100" height="569px">
        </div>
        <div class="carousel-item">
            <img src="img/hos2.jpg" class="d-block w-100" height="569px">
        </div>
    </div>
    <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
        <span class="carousel-control-prev-icon"></span>
    </button>
    <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
        <span class="carousel-control-next-icon"></span>
    </button>
</div>

<!-- About Section -->
<div class="container p-3" id="about">
    <p class="text-center fs-2 fw-bold">About Hospital</p>
    <div class="row">
        <div class="col-md-8 p-4">
            <div class="row g-3">
                <div class="col-md-6">
                    <div class="card paint-card"><div class="card-body">
                        <p class="fs-5 fw-bold">100% Safety</p>
                        <p>Advanced security systems ensure patient safety.</p>
                    </div></div>
                </div>
                <div class="col-md-6">
                    <div class="card paint-card"><div class="card-body">
                        <p class="fs-5 fw-bold">Clean Environment</p>
                        <p>Hygiene protocols create a comfortable healing space.</p>
                    </div></div>
                </div>
                <div class="col-md-6">
                    <div class="card paint-card"><div class="card-body">
                        <p class="fs-5 fw-bold">Friendly Doctors</p>
                        <p>Experienced and compassionate healthcare providers.</p>
                    </div></div>
                </div>
                <div class="col-md-6">
                    <div class="card paint-card"><div class="card-body">
                        <p class="fs-5 fw-bold">Medical Excellence</p>
                        <p>Cutting-edge technology across specializations.</p>
                    </div></div>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <img src="img/doct3.jpg" class="w-100" height="385px" style="object-fit: cover;">
        </div>
    </div>
</div>

<!-- Our Team -->
<div class="container p-4" id="team">
    <p class="text-center fs-2 fw-bold">Our Team</p>
    <div class="row g-4">
        <%
            String[] doctorNames = {"Dr. A. P. Singh", "Dr. Meera Desai", "Dr. Ravi Patel", "Dr. Priya Iyer"};
            String[] specializations = {"Cardiologist", "Dermatologist", "Neurologist", "Gynecologist"};
            String[] images = {"doctor1.jpg", "doctor2.jpg", "doctor3.jpg", "doctor4.jpg"};
            for (int i = 0; i < 4; i++) {
        %>
        <div class="col-md-3 col-sm-6">
            <div class="card doctor-card paint-card text-center" data-bs-toggle="modal" data-bs-target="#doctorModal<%=i%>">
                <img src="img/<%=images[i]%>" alt="<%=doctorNames[i]%>">
                <div class="card-body">
                    <p class="doctor-name"><%=doctorNames[i]%></p>
                    <p class="doctor-specialization">(<%=specializations[i]%>)</p>
                </div>
            </div>
        </div>
        <% } %>
    </div>
</div>

<!-- Doctor Detail Modals -->
<%
    String[] descriptions = {
        "Heart specialist with 20+ years of experience.",
        "Expert in skincare and cosmetic procedures.",
        "Specialist in treating neurological disorders.",
        "Women's health expert with global recognition."
    };
    String[] locations = {"Delhi", "Mumbai", "Ahmedabad", "Chennai"};

    for (int i = 0; i < 4; i++) {
%>
<div class="modal fade" id="doctorModal<%=i%>" tabindex="-1">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title"><%=doctorNames[i]%></h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>
      <div class="modal-body">
        <p><strong>Specialization:</strong> <%=specializations[i]%></p>
        <p><strong>Experience:</strong> 10-15+ years</p>
        <p><strong>Education:</strong> MBBS, MD/MS</p>
        <p><strong>Location:</strong> <%=locations[i]%>, India</p>
        <p><strong>About:</strong> <%=descriptions[i]%></p>
      </div>
    </div>
  </div>
</div>
<% } %>

<!-- Footer -->
<footer class="bg-dark text-white text-center p-3 mt-4">
    &copy; 2025 Global Hospital. All rights reserved.
</footer>

</body>
</html>

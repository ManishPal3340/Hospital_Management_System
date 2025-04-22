





<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	<%@page isELIgnored="false" %>
	
	 <%@include file="conn.jsp" %>
	
	
	
	
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sign Up</title>
<%@include file="../component/allcss.jsp"%>

<style type="text/css">

body {
	background-image: url("img/hos3.jpg");
	background-size: cover;
	background-repeat: no-repeat;
	background-position: center;
	height: 620px;
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
						<p class="fs-4 text-center" style="font-weight: bold;">User
							Registration</p>
							
							<c:if test="${not empty sucMsg }">
							<p class="text-center text-success fs-3">${sucMsg}</p>
							<c:remove var="sucMsg" scope="session"/>
							</c:if>
							
							<c:if test="${not empty errorMsg }">
							<p class="text-center text-danger fs-3">${errorMsg}</p>
							<c:remove var="errorMsg" scope="session"/>
							</c:if>
							
						<form action="signup.jsp" method="post">
							<div class="mb-3">
								<label class="form-label">Full Name</label> <input type="text"
									name="fullname" class="form-control" placeholder="Name"
									required>
							</div>

							<div class="mb-3">
								<label class="form-label">Enter Email</label> <input
									type="email" name="email" class="form-control"
									placeholder="Email" required>
							</div>

							<div class="mb-3">
								<label class="form-label">Enter Password</label> <input
									type="password" name="password" class="form-control"
									placeholder="Password" required>
							</div>

							<button type="submit" class="btn bg-success text-white col-md-12">Register</button>

						</form>
						<% 
						
						String fullname=request.getParameter("fullname");
						String email=request.getParameter("email");
						String password=request.getParameter("password");
						
						
						 if (fullname == null || fullname.trim().isEmpty()) {
							    //   out.println("<script>alert('Full Name is required');</script>");
							        return;
							    }
						
						
						try{
							
							
							String q="insert into registration(Full_name,Email_id,password)values(?,?,?)";
							PreparedStatement psmt=conn.prepareStatement(q);
							
							psmt.setString(1, fullname);
							psmt.setString(2, email);
							psmt.setString(3, password);
							
							
							int result=psmt.executeUpdate();
							
							if(result>0){
								out.println("<script>");
                			    out.println("alert('Successfully Done ✅✅');");
                			    out.println("window.location='user_login.jsp';");
                			    out.println("</script>");
							}else{
								out.println("<p>Error❌❌</p>");
							}
							
							
							
						}catch(Exception e){
							
							
							 out.println("Error: " + e.getMessage());
						
						}
						
						
						
						%>
						
						
						
					</div>
				</div>
			</div>
		</div>
	</div>
	
	
	
  

</body>
</html>>
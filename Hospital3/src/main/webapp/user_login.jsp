



<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	
	<%@ include file="conn.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Login Page</title>
<%@include file="../component/allcss.jsp"%>

<style type="text/css">
body{
background-image:url("img/userimage.jpg");
background-size: cover;
background-repeat: no-repeat;
background-position: center;
height: 450px;
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
						<p class="fs-4 text-center" style="font-weight: bold;">User Login</p>
						<form action="user_login.jsp" method="post">

							<div class="mb-3">
								<label class="form-label">Enter Name</label> <input
									type="name" name="name" class="form-control"
									placeholder="Full Name" required>
							</div>

							<div class="mb-3">
								<label class="form-label">Enter Password</label> <input
									type="password" name="password" class="form-control"
									placeholder="Password" required>
							</div>

							<button type="submit" class="btn bg-success text-white col-md-12">Login</button>
						</form>
						
						
						<br> Don't have an account?<a href="signup.jsp" class="text-decoration-none">
						  Create one</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	
	<%
	String  name=request.getParameter("name");
	String password=request.getParameter("password");
	
	
	if(name != null && password !=null){
		
		try{
			
			String q="select*from registration where Full_name=? AND  password=?";
			
			PreparedStatement psmt=conn.prepareStatement(q);
			
			psmt.setString(1,name);
			psmt.setString(2,password);
			
			ResultSet rs=psmt.executeQuery();
			
			
			
			if(rs.next()){
				
				
				String Doctorname=rs.getString("Full_name");
				out.println("<script>");
			    out.println("alert('Welcome " + Doctorname + "!');");
			    out.println("window.location='appointment.jsp';");
			    out.println("</script>");
				 
				 
			}else{
                out.println("<script>");
                out.println("alert('Incorrect username or password. Please try again.');");
                out.println("</script>");

			}
			
		}catch(Exception e){
			
		}
		
	}
	
	
	
	
	%>
	
	
	
	
	
	
	
	
	

</body>
</html>
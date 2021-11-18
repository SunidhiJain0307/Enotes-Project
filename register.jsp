<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.bg-image {
	background: url("Images/login.jpg") no-repeat;
	width: 100%;
	height: 82vh;
	background-size: cover;
}
</style>
<meta charset="ISO-8859-1">
<title>Register Page</title>
<%@include file="all_component/allcss.jsp"%>

</head>
<body>
	<%@include file="all_component/navbar.jsp"%>
	<div class="container-fluid bg-image">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card mt-4">
					<div class="card-header text-center text-white bg-custom">
					<i class="fa fa-user-plus fa-3x" aria-hidden="true"></i>
					<h4>Registration</h4>
					</div>
					
<%
String reg=(String)session.getAttribute("reg-success");
if(reg!=null){%>
<div class="alert alert-success" role="alert">
 <%=reg%> Login <a href="login.jsp">Click Here</a>
</div>	
<%
session.removeAttribute("reg-success");
}
%>

<%
String regfailed=(String)session.getAttribute("failed-msg");
if(regfailed!=null){%>
<div class="alert alert-danger" role="alert"><%=regfailed %>
</div>	
<%
session.removeAttribute("failed-msg");
}
%>
	
					<div class="card-body">
						<form action="UserServlet" method="post">
						<div class="form-group">
								<label >Full Name</label> <input
									type="text" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" name="fname" placeholder="Enter fullname">
								
							</div>
							<div class="form-group">
								<label >Email address</label> <input
									type="email" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" name="uemail" placeholder="Enter email">
								
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Password</label> <input
									type="password" class="form-control" id="exampleInputPassword1" name="upass"
									placeholder="Password">
							</div>
							
							<button type="submit" class="btn btn-primary badge-pill btn-block">Submit</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
<%@include file="all_component/footer.jsp" %>
</body>
</html>
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

<title>Login Page</title>
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
						<h4>Login</h4>
					</div>
					<%
					String loginfailed = (String) session.getAttribute("failed-login");
					if (loginfailed != null) {
					%>
					<div class="alert alert-danger" role="alert"><%=loginfailed%>
					</div>
					<%
					session.removeAttribute("failed-login");
					}
					%>

                   <%
                   String withoutLogin=(String)session.getAttribute("Login-error");
                   if(withoutLogin!=null){%>
                   <div class="alert alert-danger" role="alert"><%=withoutLogin %></div>
                   
                	   
                <%  
                session.removeAttribute("Login-error");
                   }
                   %>
                   
                   <%
                   String logoutmsg=(String)session.getAttribute("logout-msg");
                   if(logoutmsg !=null){%>
                   <div class="alert alert-danger" role="alert"><%=logoutmsg %></div>
                	   
                  <%
                  session.removeAttribute("logout-msg");
                   }
                   %>
                   
					<div class="card-body">
						<form action="loginServlet" method="post">

							<div class="form-group">
								<label>Email address</label> <input type="email"
									class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" name="uemail"
									placeholder="Enter email">

							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Password</label> <input
									type="password" class="form-control" id="exampleInputPassword1"
									placeholder="Password" name="upass">
							</div>

							<button type="submit"
								class="btn btn-primary badge-pill btn-block">Login</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="all_component/footer.jsp"%>

</body>
</html>
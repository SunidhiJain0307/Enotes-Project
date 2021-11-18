<%@page import="com.User.Post"%>
<%@page import="java.util.List"%>
<%@page import="com.Db.DBConnect"%>
<%@page import="com.DAO.PostDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%
UserDetails user3 = (UserDetails) session.getAttribute("userD");

if (user3 == null) {
	response.sendRedirect("login.jsp");
	session.setAttribute("Login-error", "Please Login");
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Show Notes</title>
<%@include file="all_component/allcss.jsp"%>
</head>
<body>

	<%@include file="all_component/navbar.jsp"%>
	
	<%
	String updateMsg=(String)session.getAttribute("updateMsg");
	if(updateMsg!=null){%>
	    <div class="alert alert-success" role="alert"><%=updateMsg%></div>
	
	<%
	session.removeAttribute("updateMsg");
	}
	%>
	<%
	String deletefailed=(String)session.getAttribute("deletefailed");
	if(deletefailed!=null){%>
	    <div class="alert alert-danger" role="alert"><%=deletefailed%></div>
	
	<%
	session.removeAttribute("deletefailed");
	}
	%>
	
	<div class="container">
		<h2 class="text-center">All Notes</h2>
		<div class="row">
			<div class="col-md-12">
				<%
				if (user3 != null) {
					PostDAO db = new PostDAO(DBConnect.dbConnect());
					List<Post> post = db.getData(user3.getId());
					for (Post p : post) {
				%>
				<div class="card mt-3">
					<img alt="" src="Images/study_notes.jpg"
						class="card-img-top mt-2 mx-auto" style="max-width: 100px;">

					<div class="card-body p-4">

						<h5 class="card-title"><%=p.getTitle() %></h5>
						<p><%=p.getContent() %></p>

						<p>
							<b class="text-success">Published by: <%=user3.getName() %> </b> <br></br> <b
								class="text-primary"></b>
						</p>
						<p>
							<b class="text-success">Published Date: <%=p.getDate() %> </b> <br></br> <b
								class="text-success"></b>
						</p>
						<div class="container text-center mt-2">
							<a href="deleteServlet?note_id=<%=p.getId() %>" class="btn btn-danger">Delete</a>
							<a href="edit.jsp?note_id=<%=p.getId() %>" class="btn btn-primary">Edit</a>
						</div>
					</div>
				</div>

				<%
				}
				}
				%>

			</div>
		</div>

	</div>

	<%@include file="all_component/footer.jsp"%>
</body>
</html>
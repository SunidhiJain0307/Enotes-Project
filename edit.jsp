<%@page import="com.User.Post"%>
<%@page import="com.Db.DBConnect"%>
<%@page import="com.DAO.PostDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%
UserDetails user4 = (UserDetails) session.getAttribute("userD");

if (user4 == null) {
	response.sendRedirect("login.jsp");
	session.setAttribute("Login-error", "Please Login");
}
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Page</title>
<%@include file="all_component/allcss.jsp"%>
</head>
<body>
	<%
	Integer noteid = Integer.parseInt(request.getParameter("note_id"));
	PostDAO post=new PostDAO(DBConnect.dbConnect());
	Post p=(Post)post.getDataById(noteid);
	
	%>
	<div class="container-fluid">
		<%@include file="all_component/navbar.jsp"%>
		<h1 class="text-center mt-3">Edit Your Notes</h1>

		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<form action="NotesEditServlet" method="post">

						<input type="hidden" value="<%=noteid%>" name="noteid">
						<div class="form-group">


							<label for="exampleInputEmail1">Enter Title</label> <input
								type="text" class="form-control" id="exampleInputEmail1"
								aria-describedby="emailHelp" name="title" required="required" value="<%=p.getTitle() %>">

						</div>

						<div class="form-group">
							<label for="exampleInputEmail1">Enter Content</label>
							<textarea rows="10" cols="" class="form-control" name="content"
								required="required" ><%=p.getContent() %></textarea>


						</div>
						<div class="container text-center">

							<button type="submit" class="btn btn-primary">Edit Notes</button>
						</div>
					</form>
				</div>
			</div>

		</div>

	</div>


	<%@include file="all_component/footer.jsp"%>
</body>
</html>
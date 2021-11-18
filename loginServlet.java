package com.Servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.UserDAO;
import com.Db.DBConnect;
import com.User.UserDetails;

@WebServlet("/loginServlet")
public class loginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		response.setContentType("text/html");
		
		String email=request.getParameter("uemail");
		String password=request.getParameter("upass");
		
		UserDetails u=new UserDetails();
		u.setEmail(email);
		u.setPassword(password);
		
		UserDAO dao=new UserDAO(DBConnect.dbConnect());
		UserDetails user=dao.loginUser(u);
		HttpSession session;
		if(user!=null) {
			session=request.getSession();
			session.setAttribute("userD", user);
			response.sendRedirect("home.jsp");
			
		}
		else {
			session=request.getSession();
			session.setAttribute("failed-login", "Invalid username or password.");
			response.sendRedirect("login.jsp");
			}
		
	}

}

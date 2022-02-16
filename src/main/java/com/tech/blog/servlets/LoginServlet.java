package com.tech.blog.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.Message;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;

public class LoginServlet extends HttpServlet {
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		String email = request.getParameter("user_email");
		String password = request.getParameter("user_password");
		
		UserDao dao = new UserDao(ConnectionProvider.getConnection());
		User user = dao.getUserByEmailAndPassword(email, password);
		
		if(user == null) {
			// login error
			//out.println("<h1>Invalid Details</h1>");
			Message msg = new Message("Invalid details","error","alert-danger");
			HttpSession s = request.getSession();
			s.setAttribute("msg", msg);
			response.sendRedirect("login_page.jsp");
		}else {
			// login successful
			HttpSession s = request.getSession();
			s.setAttribute("currentUser", user);
			response.sendRedirect("profile.jsp");
		}
		
	}
}
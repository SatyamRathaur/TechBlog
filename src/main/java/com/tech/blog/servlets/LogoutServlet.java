package com.tech.blog.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tech.blog.entities.Message;

public class LogoutServlet extends HttpServlet {
	 public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		 
			HttpSession s = request.getSession();
			s.removeAttribute("currentUser");
			
			Message m = new Message("Logout Successfully!","success","alert-success");
			s.setAttribute("msg", m);
			response.sendRedirect("login_page.jsp");
	 }

}

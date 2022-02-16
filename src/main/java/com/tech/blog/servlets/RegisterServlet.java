package com.tech.blog.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;

@MultipartConfig
public class RegisterServlet extends HttpServlet {
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException{
		
		
		String check = request.getParameter("check");
		
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		if(check == null) {
			out.println("Please agree terms and conditions");
		}else {
			
			String name = request.getParameter("user_name");
			String email = request.getParameter("user_email");
			String password = request.getParameter("user_password");
			String gender = request.getParameter("gender");
			String about = request.getParameter("about");
			
			// creating user object and set values
			User user = new User(name,email,password,gender,about);
			
			// creating UserDao object 
			UserDao dao = new UserDao(ConnectionProvider.getConnection());
			boolean f = dao.saveUser(user);
			
			if(f) {
				out.println("done");
			}else {
				out.println("error");
			}
			
			
		}
	}
}

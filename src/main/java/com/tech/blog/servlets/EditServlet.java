package com.tech.blog.servlets;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.Message;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;
import com.tech.blog.helper.Helper;

@MultipartConfig
public class EditServlet extends HttpServlet {
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();

		// fetching data from edit form
		String name = request.getParameter("user_name");
		String email = request.getParameter("user_email");
		String password = request.getParameter("user_password");
		String about = request.getParameter("about");
		Part part = request.getPart("image");
		String imageName = part.getSubmittedFileName();

		// Get current user form session
		HttpSession s = request.getSession();
		User user = (User) s.getAttribute("currentUser");
		user.setName(name);
		user.setEmail(email);
		user.setPassword(password);
		user.setAbout(about);
		user.setProfile(imageName);

		// updating data in database

		UserDao dao = new UserDao(ConnectionProvider.getConnection());
		boolean f = dao.update(user);

		if (f) {

			String path = "C:\\Users\\SATYAM RATHAUR\\eclipse-workspace\\TechBlog\\src\\main\\webapp\\pics" + File.separator + user.getProfile();

			//Helper.deleteImage(path);
			if (Helper.saveImage(part.getInputStream(), path)) {
				
				Message msg = new Message("Updated Successfully...","success","alert-success");
				s.setAttribute("msg", msg);
				
			} else {
				Message msg = new Message("Error profile picture not updated try again!","error","alert-danger");
				s.setAttribute("msg", msg);
			}

		} else {
			out.println("error try again");
			Message msg = new Message("Error try again!","error","alert-danger");
			s.setAttribute("msg", msg);
			
		}
		response.sendRedirect("profile.jsp");
	}
}

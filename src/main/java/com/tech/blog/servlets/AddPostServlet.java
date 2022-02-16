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

import com.tech.blog.dao.PostDao;
import com.tech.blog.entities.Post;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;
import com.tech.blog.helper.Helper;

@MultipartConfig
public class AddPostServlet extends HttpServlet {
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		int cId = Integer.parseInt(request.getParameter("cId"));
		String title = request.getParameter("post_title");
		String content = request.getParameter("post_content");
		String code = request.getParameter("post_code");
		Part part = request.getPart("post_pic");
		String pic = part.getSubmittedFileName();
		
		// Getting user id of current user from session
		HttpSession s = request.getSession();
		User user = (User) s.getAttribute("currentUser");
		int userId = user.getId();
		
		Post post = new Post(cId,title,content,code,pic,null,userId);
		PostDao postDao = new PostDao(ConnectionProvider.getConnection());
		boolean ans = postDao.savePost(post);
		
		if(ans) {
			
			String path = "C:\\Users\\SATYAM RATHAUR\\eclipse-workspace\\TechBlog\\src\\main\\webapp\\post_pics" + File.separator + pic;
			Helper.saveImage(part.getInputStream(),path);
			out.println("done");
			
		}else {
			out.println("error");
		}
		
	}
}

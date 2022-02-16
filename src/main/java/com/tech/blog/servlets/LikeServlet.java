package com.tech.blog.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tech.blog.dao.LikeDao;
import com.tech.blog.helper.ConnectionProvider;

public class LikeServlet extends HttpServlet {
	public void doGet(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		String operation = request.getParameter("operation");
		int pid = Integer.parseInt(request.getParameter("pid"));
		int uid = Integer.parseInt(request.getParameter("uid"));
		
		/*
		 * out.println("data from server"); out.println(operation); out.println(pid);
		 * out.println(uid);
		 */
		
		LikeDao likeDao = new LikeDao(ConnectionProvider.getConnection());
		boolean f = likeDao.insertLike(pid, uid);
		out.println(f);
	}
}

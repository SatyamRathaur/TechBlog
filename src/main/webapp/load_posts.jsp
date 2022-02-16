<!-- This is load post page... -->


<%@page import="com.tech.blog.entities.User"%>
<%@page import="com.tech.blog.dao.LikeDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>


<div class="row">

	<%
		User user = (User) session.getAttribute("currentUser");
	
	%>

	<%
	PostDao d = new PostDao(ConnectionProvider.getConnection());
	ArrayList<Post> posts = null;
	
	 int cId = Integer.parseInt(request.getParameter("cId"));

	if (cId == 0) {
		posts = d.getAllPost();
	} else {
		posts = d.getAllPostByCategoryId(cId);
	}
	if(posts.size()==0){
		out.println("<h2 class='display-3 text-center'>No post in this category<h2>");
		return;
	}
	for (Post p : posts) {
	%>
	<div class="col-md-6 mt-3">
		<div class="card">
			<img class="card-img-top" alt="Card img cap" Style="height:350px;" src="post_pics/<%=p.getpPic()%>">
			<p><b>Title</b> :<%=p.getpTitle()%></p>
			<p><b>Content</b> :<%=p.getpContent()%></p>
			
		</div>
		<div class="card-footer primary-background text-center">
		
			<%
				LikeDao likeDao = new LikeDao(ConnectionProvider.getConnection());
			%>
		
			<a href="#" onclick="doLike(<%= p.getpId() %>,<%= user.getId() %>)"  class="btn btn-outline-light btn-sm "><i class="fa fa-thumbs-o-up"><span class="like-counter"><%=likeDao.countLikesByPostId(p.getpId()) %></span></i></a>
			<a href="#"  class="btn btn-outline-light btn-sm "><i class="fa fa-commenting-o"><span>20</span></i></a>
			<a href="showPost_page.jsp?post_id=<%= p.getpId() %>"  class="btn btn-outline-light btn-sm ">Read More</a>
			
			
		</div>
	</div>
	<%
	}
	%>
</div>
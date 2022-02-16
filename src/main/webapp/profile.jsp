<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.tech.blog.entities.User"%>
<%@ page errorPage="error_page.jsp"%>
<%@ page import="com.tech.blog.entities.Message"%>
<%@ page import="com.tech.blog.dao.PostDao"%>
<%@ page import="com.tech.blog.helper.ConnectionProvider"%>
<%@ page import="com.tech.blog.entities.Post"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.tech.blog.entities.Category"%>


<%
User user = (User) session.getAttribute("currentUser");
if (user == null) {
	response.sendRedirect("login_page.jsp");
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Profile Page</title>

<!--  CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="css/mystyle.css" rel="stylesheet" type="text/css" />
<style>
.banner-background {
	clip-path: polygon(30% 0%, 67% 0, 100% 0, 100% 96%, 59% 100%, 26% 97%, 0 100%, 0 0);
}


body{
 background-color:#e2f9e2;
}


</style>

</head>
<body>
	<!--  Navigation bar -->

	<nav class="navbar navbar-expand-lg navbar-dark primary-background">
		<a class="navbar-brand" href="index.jsp"> <span class="fa fa-edit"></span>Tech
			Blog
		</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link" href="#"><span
						class="fa fa-cogs"></span>Code With Satyam<span class="sr-only">(current)</span></a>
				</li>

				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> <span class="fa fa-caret-square-o-down"></span>
						Catagories
				</a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<a class="dropdown-item" href="#">Programing</a> <a
							class="dropdown-item" href="#">Project Implementation</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="#">Data Structure</a>
					</div></li>

				<li class="nav-item"><a class="nav-link" href="#"><span
						class="fa fa-phone-square"></span>Contact</a></li>

				<li class="nav-item"><a class="nav-link" href="#"
					data-toggle="modal" data-target="#post-modal"><span
						class="fa fa-pencil-square"></span>Add Post</a></li>


			</ul>
			<ul class="navbar-nav mr-right">
				<li class="nav-item"><a class="nav-link" href="#!"
					data-toggle="modal" data-target="#profile-modal"><span
						class="fa fa-user"></span><%=user.getName()%></a></li>
				<li class="nav-item"><a class="nav-link" href="LogoutServlet"
					method="Post"><span class="fa fa-sign-out"></span>Logout</a></li>

			</ul>
		</div>
	</nav>

	<!-- End of Navigation Bar -->

	<%
	Message m = (Message) session.getAttribute("msg");
	if (m != null) {
	%>

	<div class="alert <%=m.getCssStyle()%>" role="alert">
		<%=m.getContent()%>
	</div>

	<%
	session.removeAttribute("msg");
	}
	%>


	<!-- Start Main body -->
	<main>
		<div class="container">
		
			<div class="row mt-4">
			
				<div class="col-md-4">
					<div class="list-group">
						<a href="#" id="allPost" onclick="getPosts(0,this)" class=" c-link list-group-item list-group-item-action active">All
							Categories </a>
						<%
						PostDao p = new PostDao(ConnectionProvider.getConnection());
						ArrayList<Category> list1 = p.getAllCategories();
						for (Category x : list1) 
						{
							
							%>
							<a href="#" onclick="getPosts(<%= x.getcId() %>,this)" class=" c-link list-group-item list-group-item-action"><%= x.getcName() %></a>
									
							<% 
						}
						%>
						

					</div>
				</div>

				<div class="col-md-8">
					<!-- post -->
					<!-- <div class="container text-center" id="loader">
						<i class="fa fa-refresh fa-spin fa-5x"></i>
						<h3 class="mt-2">Loading...</h3>
					</div> -->
					
					<div class="container-fluid" id="post-container">
					
					</div>
					
				</div>

			</div>

		</div>

	</main>

	<!-- End of Main body -->


	<!-- Profile Modal -->

	<div class="modal fade" id="profile-modal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header primary-background text-white ">
					<h3 class="modal-title" id="exampleModalLabel">Profile</h3>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="container text-center">
						<img src="pics/<%=user.getProfile()%>" class="img-fluid"
							style="border-radius: 50%; max-width: 200px;">
					</div>
					<br>

					<!-- Details -->
					<div id="profile-details">
						<table class="table">

							<tbody>
								<tr>
									<th scope="row">Name :</th>
									<td><%=user.getName()%></td>

								</tr>
								<tr>
									<th scope="row">Id :</th>
									<td><%=user.getId()%></td>

								</tr>
								<tr>
									<th scope="row">Email :</th>
									<td><%=user.getEmail()%></td>

								</tr>
								<tr>
									<th scope="row">Gender :</th>
									<td><%=user.getGender()%></td>

								</tr>
								<tr>
									<th scope="row">About :</th>
									<td><%=user.getAbout()%></td>

								</tr>
								<tr>
									<th scope="row">Registered on :</th>
									<td><%=user.getDateTime().toString()%></td>

								</tr>

							</tbody>
						</table>
					</div>

					<!-- profile edit -->
					<div id="profile-edit" style="display: none;">
						<h2>Edit Details</h2>
						<form action="EditServlet" method="POST"
							enctype="multipart/form-data">
							<table class="table">
								<tr>
									<td>Id :</td>
									<td><%=user.getId()%></td>
								</tr>
								<tr>
									<td>Name :</td>
									<td><input type="text" class="form-control"
										value="<%=user.getName()%>" name="user_name"></td>
								</tr>
								<tr>
									<td>Email :</td>
									<td><input type="email" class="form-control"
										value="<%=user.getEmail()%>" name="user_email"></td>
								</tr>
								<tr>
									<td>Password :</td>
									<td><input type="password" class="form-control"
										value="<%=user.getPassword()%>" name="user_password"></td>
								</tr>
								<tr>
									<td>Gender :</td>
									<td><%=user.getGender()%></td>
								</tr>
								<tr>
									<td>New Profile :</td>
									<td><input type="file" name="image" class="form-control"></td>
								</tr>
								<tr>
									<td>About :</td>
									<td><textarea rows="3" class="form-control" name="about"><%=user.getAbout()%>
							  	</textarea></td>
								</tr>
								<tr>
									<td>Registered on :</td>
									<td><%=user.getDateTime()%></td>
								</tr>


							</table>
							<div class="container text-center">
								<button type="submit" class="btn btn-outline-primary">Save</button>
							</div>
						</form>
					</div>


				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" id="close-button"
						data-dismiss="modal">Close</button>
					<button id="edit-profile-button" type="button"
						class="btn btn-primary">Edit</button>
				</div>
			</div>
		</div>
	</div>

	<!-- End of profile modal -->


	<!-- Add Post Modal -->

	<div class="modal fade" id="post-modal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Enter Post
						Details</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">

					<form id="add-post-form" action="AddPostServlet" method="POST">
						<div class="form-group">
							<label>Select Post Category</label> <br> <select
								class="form-control" name="cId">
								<%
								PostDao postDao = new PostDao(ConnectionProvider.getConnection());
								ArrayList<Category> list = postDao.getAllCategories();
								for (Category c : list) {
								%>
								<option value="<%=c.getcId()%>"><%=c.getcName()%></option>
								<%
								}
								%>
							</select>
						</div>

						<div class="form-group">
							<input type="text" placeholder="Enter Title" name="post_title"
								class="form-control">
						</div>

						<div class="form-group">
							<textarea name="post_content" rows="3" class="form-control"
								placeholder="Enter Post Content"></textarea>
						</div>
						<div class="form-group">
							<textarea name="post_code" rows="3" class="form-control"
								placeholder="Enter code (if any)"></textarea>
						</div>

						<div class="form-group">
							<label>Select Picture</label> <br> <input name="post_pic"
								type="file">
						</div>

						<div class="container text-center">
							<button type="submit" class="btn btn-outline-primary">Post</button>
						</div>

					</form>

				</div>

			</div>
		</div>
	</div>

	<!-- End of Add Post Modal -->


	<!-- JavaScript -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"
		integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
	<script src="js/myjs.js" type="text/javascript"></script>

	<script>
		$(document).ready(function() {
			let editStatus = false;

			$('#edit-profile-button').click(function() {

				if (!editStatus) {
					$("#profile-details").hide()
					$("#profile-edit").show();
					editStatus = true;
					$(this).text("back")
				} else {
					$("#profile-details").show()
					$("#profile-edit").hide();
					editStatus = false;
					$(this).text("Edit")
				}

			})
		})
	</script>

	<!-- Add Post JavaScript -->

	<script>
		$(document)
				.ready(
						function(e) {

							$("#add-post-form")
									.on(
											"submit",
											function(event) {
												//this code is get called when form is submitted
												event.preventDefault();

												console
														.log("you have clicked on submit")

												let form = new FormData(this);
												//now requesting to server
												$
														.ajax({
															url : "AddPostServlet",
															type : "POST",
															data : form,
															success : function(
																	data,
																	textStatus,
																	jqXHR) {
																// success
																console
																		.log(data);
																if (data.trim() === "done") {
																	swal(
																			"Good job!",
																			"Post saved successfully...",
																			"success");
																} else {
																	swal(
																			"Error!",
																			"Something went wrong try again!",
																			"error");
																}
															},
															error : function(
																	jqXHR,
																	textStatus,
																	errorThrown) {
																//error
															},
															processData : false,
															contentType : false
														})
											})

						})
	</script>

	<!-- End of Add post JavaScript -->
	
	
	<!-- Loading Post using ajax -->
	<script>
		
		function getPosts(catId,temp){
			$("#loader").show();
			$("#post-container").hide();
			$(".c-link").removeClass('active')
			$.ajax({
				url: "load_posts.jsp",
				data: {cId: catId},
				success: function (data, textStatus, jqXHR) {
					console.log(data);
					$("#loader").hide();
					$("#post-container").show();
					$("#post-container").html(data)
					$(temp).addClass('active')
				}
			})
		}	
	
		$(document).ready(function(e){
			let allPostRef = $('#allPost')
		      getPosts(0,allPostRef)
			
		})
	
	</script>

	<!-- End of Loading Post -->


</body>
</html>
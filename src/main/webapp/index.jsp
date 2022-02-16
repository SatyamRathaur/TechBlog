<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Jsp Page</title>

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
</style>

</head>
<body>
	<!-- Navigation Bar -->
	<%@ include file="normal_navbar.jsp"%>

	<!-- Banner -->
	<div class="container-fluid m-0 p-0 banner-background">
		<div class="jumbotron primary-background text-white">
			<div class="container">
				<h3 class="display-3">Welcome To TechBlog</h3>
				<p>Welcome to the technical blog, world of technology.A
					programming language is any set of rules that converts strings, or
					graphical program elements in the case of visual programming
					languages, to various kinds of machine code output.</p>

				<p>Most programming languages consist of instructions for
					computers. There are programmable machines that use a set of
					specific instructions, rather than general programming languages.</p>
				<button class="btn btn-outline-light btn-lg">
					<span class="fa fa-user-plus"></span>Start its Free!
				</button>
				<a href="login_page.jsp" class="btn btn-outline-light btn-lg"> <span
					class="fa fa-user-circle fa-spin"></span> Login
				</a>
			</div>

		</div>
	</div>

	<div class="container">
		<div class="row mb-2">
			<div class="col-md-4">
				<div class="card">
					<div class="card-body">
						<h5 class="card-title">Java Programming</h5>
						<p class="card-text">Java is a powerful general-purpose
							programming language. It is used to develop desktop and mobile
							applications, big data processing, embedded systems, and so on.
							According to Oracle, the company that owns Java, Java runs on 3
							billion devices worldwide, which makes Java one of the most
							popular programming languages.</p>
						<a href="#" class="btn primary-background text-white">Read
							more</a>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="card">
					<div class="card-body">
						<h5 class="card-title">Python Programming</h5>
						<p class="card-text">Python is a powerful general-purpose
							programming language. It is used in web development, data
							science, creating software prototypes, and so on. Fortunately for
							beginners, Python has simple easy-to-use syntax. This makes
							Python an excellent language to learn to program for beginners.It
							is easy to learn and syntax is simple and clean.</p>
						<a href="#" class="btn primary-background text-white">Read
							more</a>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="card">
					<div class="card-body">
						<h5 class="card-title">Android Development</h5>
						<p class="card-text">This Specialization enables learners to
							successfully apply core Java programming languages features &
							software patterns needed to develop maintainable mobile apps
							comprised of core Android components, as well as fundamental Java
							I/O & persistence mechanisms. The Capstone project will do wonders
							to the users.</p>
						<a href="#" class="btn primary-background text-white">Read
							more</a>
					</div>
				</div>
			</div>

		</div>
		<div class="row">
			<div class="col-md-4">
				<div class="card">
					<div class="card-body">
						<h5 class="card-title">Web Development</h5>
						<p class="card-text">Some quick example text to build on the
							card title and make up the bulk of the card's content.</p>
						<a href="#" class="btn primary-background text-white">Read
							more</a>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="card">
					<div class="card-body">
						<h5 class="card-title">Spring Framework</h5>
						<p class="card-text">Some quick example text to build on the
							card title and make up the bulk of the card's content.</p>
						<a href="#" class="btn primary-background text-white">Read
							more</a>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="card">
					<div class="card-body">
						<h5 class="card-title">React JS</h5>
						<p class="card-text">Some quick example text to build on the
							card title and make up the bulk of the card's content.</p>
						<a href="#" class="btn primary-background text-white">Read
							more</a>
					</div>
				</div>
			</div>

		</div>

	</div>



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
	<script src="js/myjs.js" type="text/javascript"></script>

</body>
</html>
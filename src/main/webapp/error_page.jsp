<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
<%@page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Error something went wrong!</title>

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
	<div class="container text-center">
		<img alt="" src="img/error.png" class="img-fluid">
		<h3 class="display-3">Sorry! Something went wrong...</h3>
		<%= exception %>
		<a href="index.jsp" class="btn primary-background text-white btn-lg mt-3">Home</a>
	
	</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>"${thiscity.name}" Details</title>
	<style>
		*{margin: 0px;
			padding: 0px;
			font-family:monospace;
			color: black;}
        .container {position: relative; 
            margin: auto 25%;}
        .header { position: relative; 
            margin: auto 5%; 
			width: auto;
        	display: flex;
        	flex-direction: row;
        	align-items: center;
        	justify-content: space-between;
        	padding: 10px;
        	background-color: #EEEDE7}
        .bfooter {width: auto;
        	display: flex;
        	flex-direction: row;
        	align-items: center;
        	justify-content: space-around;
        	padding: 10px;}	
	</style>
	<!-- Bootstrap CSS -->
	<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
	<script src="/webjars/jquery/jquery.min.js"></script>
	<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="header">		
		<a class="btn btn-light" href="/dashboard" role="button">Home</a>
		<a class="btn btn-light" href="/newCity" role="button">Add a New City</a>
		<a class="btn btn-light" href="/newActivity" role="button">Add an Activity</a>
		<a class="btn btn-light" href="/chatgpt" role="button">Need a Recommendation? (ChatGpt)</a>
		<a class="btn btn-danger" href="/logout" role="button">Logout</a>
	</div><p/><p/>
	
	<div class="container">
		<h3>City Name: <c:out value="${thiscity.name}"/></h3><p/>
		
		<c:if test="${thiscity.user.id == user.id}">
			<h3>Posted By: You</h3><p/>
		</c:if>
		<c:if test="${!(thiscity.user.id == user.id)}">
			<h3>Posted By: <c:out value="${thiscity.user.first_name} "/></h3><br>
		</c:if><p/>
		
		<h3>Location: <c:out value="${thiscity.location}"/></h3><p/>
		<div>
			<h3>Review: </h3>
			<h4><c:out value="${thiscity.review}"/></h4>
		</div><p/>
		
		<h3>Activities: <a class="btn btn-success" href="/activities" role="button" style="margin:10px;"><c:out value="${thiscity.activities.length()}" /></a></h3><p/>
		
		<h3>Stars: <c:out value="${thiscity.stars}"/></h3><p/>
		
		<c:if test="${thiscity.user.id == user.id}">
			<div class="bfooter" style="border-top: 2px solid black">
				<a class="btn btn-info" href="/${thiscity.id}/edit" role="button">Edit</a>
				<a class="btn btn-warning" href="/${thiscity.id}/delete" role="button">Delete</a>
			</div>
		</c:if><p/>
		
	</div>

</body>
</html>
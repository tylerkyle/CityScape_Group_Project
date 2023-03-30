<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Create a New City</title>

	<!-- Bootstrap CSS -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
	<script src="/webjars/jquery/jquery.min.js"></script>
	<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
	<link rel="stylesheet" type="text/css" href="/css/main.css">
</head>
<body id="bodycontainer">

	<div id="header">
		<h3>CityScape</h3>
		<div id="div-menu">
			<a href="${pageContext.servletContext.contextPath}/home"><button class="menu-btn">Home</button></a>
			<a href="${pageContext.servletContext.contextPath}/city/add"><button class="menu-btn">New City</button></a>
			<a href="${pageContext.servletContext.contextPath}/activity/add"><button class="menu-btn">Add Activity</button></a>
			<a href="${pageContext.servletContext.contextPath}/chatgpt"><button class="menu-btn">Need Recommendations?</button></a>
		</div>
		<div>
			<a href="${pageContext.servletContext.contextPath}/logout"><button>Log Out</button></a>
		</div>
	</div>
	
	<div id="actcontainer">
		<div>
			<h2>New City</h2>
		</div>
		<div>
			<form:form id="new-form" action="/city/new" method="post" style="align-content:left" modelAttribute="city">
	            
	            <div class="div-form">
	                <form:errors path="user" class="text-danger"></form:errors>
	               	<form:input path="user" type="hidden" value="${user.id}"></form:input>
	            </div>
	            
	            <div class="div-form">
	                <form:label class="act-label" path="name">Name: </form:label>
                	<form:errors path="name" class="text-danger"></form:errors>
                	<form:input path="name" type="text" class="form-control col-sm-3" placeholder="Enter the city name here..."/>
	            </div><p/>
	            
	            <div class="div-form">
	                <form:label class="act-label" path="reviews">Review: </form:label>
                	<form:errors path="reviews" class="text-danger"></form:errors><br>
                	<form:textarea path="reviews" rows="10" cols="32" placeholder="Enter your review here..."/>
	            </div><p/>
           
	            <div class="div-form">
	                <form:label class="act-label" path="stars">Stars: </form:label>
	                	<form:errors path="stars" class="text-danger"></form:errors><br>
	                	<input type="number" min="0" max="5" step="0.5" />
	            </div><p/>
	            <div class="div-form">
	            	<button type='submit' class="btn btn-primary" value='Submit' style="text-align:center">Add City</button>
	            </div>
	        </form:form>
        </div>
	</div>
</body>
</html>
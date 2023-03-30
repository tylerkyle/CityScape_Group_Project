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
</head>
<body id="bodycontainer">

	<div id="header">
		<h3>CityScape</h3>
		<div id="div-menu">
			<a href="${pageContext.servletContext.contextPath}/dashboard"><button class="menu-btn">Home</button></a>
			<a href="${pageContext.servletContext.contextPath}/newCity"><button class="menu-btn">New City</button></a>
			<a href="${pageContext.servletContext.contextPath}/newActivity"><button class="menu-btn">Add Activity</button></a>
			<a href="${pageContext.servletContext.contextPath}/chatgpt"><button class="menu-btn">Need Recommendations?</button></a>
		</div>
		<div>
			<a href="${pageContext.servletContext.contextPath}/logout"><button class="menu-btn">Log Out</button></a>
		</div>
	</div>
	
	<div class="maincontainer">
		<form:form action="/city/new" id="new-form" method="post" style="align-content:left" modelAttribute="city">
            
            <div class="form-group form-inline">
                <form:errors path="user" class="text-danger"></form:errors>
               	<form:input path="user" type="hidden" value="${user.id}"></form:input>
            </div>
            
            <div class="form-group form-inline">
                <form:label path="name">
                	<form:errors path="name" class="text-danger"></form:errors>
                	Name: <form:input path="name" type="text" class="form-control col-sm-3" style="margin-left: 20px" placeholder="Enter the city name here..."/>
                </form:label>
            </div><p/>
            
            <div class="form-group form-inline">
                <form:label path="review">
                	<form:errors path="review" class="text-danger"></form:errors>
                	Review: <form:textarea path="description" rows="20" cols="32" style="margin-left: 20px" placeholder="Enter your review here..."/>
                </form:label>
            </div><p/>
            
            <div class="form-group form-inline">
                <form:label path="stars">
                	<form:errors path="stars" class="text-danger"></form:errors>
                	Stars: <input type="number" min="0" max="5" step="0.5" />
                </form:label>
            </div><p/>
            
            <button type='submit' class="btn btn-primary" value='Submit' style="text-align:center">Submit</button>
        </form:form>
	</div>
</body>
</html>
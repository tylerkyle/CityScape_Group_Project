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
	</style>
	<!-- Bootstrap CSS -->
	<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
	<script src="/webjars/jquery/jquery.min.js"></script>
	<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="header">		
		<a class="btn btn-light" href="/dashboard" role="button">Home</a>
		<a class="btn btn-light" href="/chatgpt" role="button">Need a Recommendation? (ChatGpt)</a>
		<a class="btn btn-danger" href="/logout" role="button">Logout</a>
	</div><p/><p/>
	
	<div class="container">
		<form:form action="/cities/new" method="post" style="align-content:left" modelAttribute="city">
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
                <form:label path="location">
                	<form:errors path="location" class="text-danger"></form:errors>
                	Location: <form:input path="location" type="text" class="form-control col-sm-3" style="margin-left: 20px" placeholder="Enter the location.."/>
                </form:label>   
            </div><p/>
            
            <div class="form-group form-inline">
                <form:label path="review">
                	<form:errors path="review" class="text-danger"></form:errors>
                	Review: <form:textarea path="description" class="form-control col-sm-3" style="margin-left: 20px" placeholder="Enter your review here..."/>
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
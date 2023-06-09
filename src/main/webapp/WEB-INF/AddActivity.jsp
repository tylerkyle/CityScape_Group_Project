<!doctype html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- c:out ; c:forEach etc. --> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- form:form -->
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true" %>
<html lang="en">
<head>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
	<link rel="stylesheet" type="text/css" href="/css/main.css">
	<meta charset="UTF-8" />
	<title>Add Activity</title>

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
			<h2>New Activity</h2>
		</div>
		<div>
			<form:form id="new-form" action="/activity/create" method="post" modelAttribute="activity">
				<div class="div-form">
					<form:label class="act-label" path="name"> Name:</form:label>
					<form:input type="text" path="name"/>
					<form:errors path="name"/>
				</div>
				<div class="div-form">							
					<form:label class="act-label" path="price">Price:</form:label>
					<form:input type="text" path="price"/>
					<form:errors path="price"/>
				</div>
				<div class="div-form">
					<form:label class="act-label" path="description">Description:</form:label>
					<form:textarea rows="2" cols="24" path="description"></form:textarea>
					<form:errors path="description"/>
				</div>
				<div>
					<input type="hidden" path="user_id" value="${user.id}"/>
					<input type="hidden" path="city_id" value="${city.id}"/>
					<input type="hidden" path="createdAt" value="${activity.createdAt}"/>
					<input type="hidden" path="updatedAt" value="${activity.updatedAt}"/>
				</div>
				<input type="submit" class="btn btn-primary" value="Add Activity"/>
			</form:form>
		</div>
	</div>
</body>
</html>

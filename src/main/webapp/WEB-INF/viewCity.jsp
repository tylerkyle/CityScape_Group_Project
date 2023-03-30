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
        .bfooter {width: auto;
        	display: flex;
        	flex-direction: row;
        	align-items: center;
        	justify-content: space-around;
        	padding: 10px;}	
	</style>
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
		<table id="main-table">
			<tr>
				<th> 
					<h3>City Name</h3> 
				</th>
				<td> 
					<c:out value="${thiscity.name}"/> 
				<td>
			</tr>
			<tr>
				<th>
					<h3>Posted By: </h3>
				</th>
				<c:if test="${thiscity.user.id == user.id}">
					<td><h3>You</h3></td>
				</c:if>
				<c:if test="${thiscity.user.id != user.id}">
					<td>
						<h3><c:out value="${thiscity.user.username}"/></h3>
					</td>
				</c:if>
			</tr>
			<tr>
				<th> 
					<h3>Review</h3> 
				</th>
				<td> 
					<h4>
						<c:out value="${thiscity.review}"/>
					</h4>
				<td>
			</tr>
			<tr>
				<th> 
					<h3>Activites</h3> 
				</th>
				<td> 
						<c:forEach var="activity" items="${thiscity.activities}">
							<tr>"${activity.name}"</tr>
						</c:forEach>
				<td>
			</tr>
			<tr>
				<th> 
					<h3>Stars</h3> 
				</th>
				<td> 
					<h4>
						<c:out value="${thiscity.stars}"/>
					</h4>
				<td>
			</tr>
		
		
		</table><p/>
		
		<c:if test="${thiscity.user.id == user.id}">
			<div class="bfooter" style="border-top: 2px solid black">
				<a class="btn btn-info" href="/city/edit/${thiscity.id}" role="button">Edit</a>
				<a class="btn btn-warning" href="/city/delete/${thiscity.id}" role="button">Delete</a>
			</div>
		</c:if>
		
	</div>

</body>
</html>
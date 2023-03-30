<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="/css/main.css">
<title>Dashboard Page</title>
</head>
<body id="bodycontainer">
	<div id="header">
		<h3>CityScape</h3>
		<div id="div-menu">
			<a href="${pageContext.servletContext.contextPath}/home"><button class="menu-btn">Home</button></a>
			<a href="${pageContext.servletContext.contextPath}/city/add"><button class="menu-btn">New City</button></a>
			<a href="${pageContext.servletContext.contextPath}/activity/add"><button class="menu-btn">Add Activity</button></a>
			<a href="${pageContext.servletContext.contextPath}/chat"><button class="menu-btn">Need Recommendations?</button></a>
		</div>
		<div>
			<a href="${pageContext.servletContext.contextPath}/logout"><button>Log Out</button></a>
		</div>
	</div>
	<div id="maincontainer">
		<table id="main-table">
			<thead>
				<tr>
					<th onclick="sortTable(0)">Cities</th>
					<th onclick="sortTable(1)">Stars</th>
					<th onclick="sortTable(2)">Activities</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="city" items="${cities}">
					<tr>
						<td><a href="${pageContext.servletContext.contextPath}/city/'${city.id}'">"${city.name}"</a></td>
						<td>"${city.getStars()}" Stars</td>
						<td><a href="${pageContext.servletContext.contextPath}/city/'${city.id}'/activities">"${city.getActivities().size()} Activities"</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
    <script src="/js/dashboard-script.js"></script>
</body>
</html>

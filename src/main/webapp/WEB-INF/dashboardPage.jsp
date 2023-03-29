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
			<a href="${pageContext.servletContext.contextPath}/dashboard"><button class="menu-btn">Home</button></a>
			<a href="${pageContext.servletContext.contextPath}/newCity"><button class="menu-btn">New City</button></a>
			<a href="${pageContext.servletContext.contextPath}/newActivity"><button class="menu-btn">Add Activity</button></a>
			<a href="${pageContext.servletContext.contextPath}/chatgpt"><button class="menu-btn">Need Recommendations?</button></a>
		</div>
		<div>
			<button>Log Out</button>
		</div>
	</div>
	<div id="maincontainer">
		<table id="main-table">
			<thead>
				<tr>
					<th>Cities</th>
					<th>Stars</th>
					<th>Activities</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="city" items="cities">
					<tr>
						<td>"${city.name}"</td>
						<td>"${city.star}" Star</td>
						<td>"${city.activities}"</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>
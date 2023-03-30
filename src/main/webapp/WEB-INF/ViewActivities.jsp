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
	<title>View Activites</title>
</head>
	
<body id="bodycontainer">
	<div id="header">
		<h3>CityScape</h3>
		<div id="div-menu">
			<a href="${pageContext.servletContext.contextPath}/dashboard"><button class="menu-btn">Home</button></a>
			<a href="${pageContext.servletContext.contextPath}/newCity"><button class="menu-btn">New City</button></a>
			<a href="${pageContext.servletContext.contextPath}/newActivity"><button class="menu-btn">Add Activity</button></a>
			<a href="${pageContext.servletContext.contextPath}/chat"><button class="menu-btn">Need Recommendations?</button></a>
		</div>
		<div>
			<button>Log Out</button>
		</div>
	</div>
	
	<div id="maincontainer">
		<h2>Activites in <c:out value="${city.name}"/></h2>
		<table id="main-table">
			<tr>
				<th>Activity:</th>
				<th>Price:</th>
                <th>Rating:</th>
                <th>Description:</th>
				
			</tr>
			<c:forEach var="activity" items="${activities}">
				<tr>
					<td><a href="/activity/${activity.id}"><c:out value="${activity.activityName}"></c:out></a></td>
					<td><c:out value="${activity.price}"/></td>
            	<!--<td><c:out value=${activity.rating}></c:out></td> -->
                    <td><c:out value=${activity.description}></c:out></td>
				</tr>
			</c:forEach>
		</table>
	</div>

</body>
</html>

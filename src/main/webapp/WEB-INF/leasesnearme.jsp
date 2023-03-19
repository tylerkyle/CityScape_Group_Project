<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!-- New line below to use the JSP Standard Tag Library -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- New line below to use form tag -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<!-- New line below to use errors tag -->
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="/css/leaseDashboard.css">
<head>
<!-- for Bootstrap CSS -->
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />

<!-- For any Bootstrap that uses JS or jQuery-->
<script src="/webjars/jquery/jquery.min.js"></script>
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
<link type="text/css" rel="stylesheet" href="<c:url value="/css/leasesnearme.css" />" />
<head>
<!-- for Bootstrap CSS -->
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />

<!-- For any Bootstrap that uses JS or jQuery-->
<script src="/webjars/jquery/jquery.min.js"></script>
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
<link type="text/css" rel="stylesheet" href="<c:url value="/css/leaseDashboard.css" />" />
<meta charset="ISO-8859-1">
<title>Woden Hunts: Leases near me</title>
</head>
<body>
	<div class="links navbarlinks navbar navbar-expand-lg navbar-light bg-light">
	<!-- TODO: Delete before production: Needs to generate query -->
		
		<a href="/lease/myleases" class="btn btn-success">Your hunting leases </a>
		<a href="/lease/new" class="btn btn-success">Create hunting lease </a>
		<a href="/lease/all" class="btn btn-success">All hunting leases</a>
		<a href="/profile/edit" class="btn btn-success">Edit profile</a>
		<a href="/logout" class="btn btn-success">Logout</a>
	</div>
	
	
	<div id="allhuntingleases" class="allHuntingLeases">
			
			<h2> All leases </h2>
			<c:forEach var="thisLease" items="${leasesNearMe}">
				<ul class="leaseCard">
		    		<li>
		    			<a href="/lease/${thisLease.id}"><c:out value="${thisLease.title}"/></a>
		    		</li>
		       	
		       		<li>
		       			<c:out value="${thisLease.game}"/>
		       		
		        	</li>	
		        
		        	<li>
		       			<c:out value="${thisLease.rate}"/>
		       		</li>
		       	<!-- 
		       	
		       	TODO: Delete before production: acessPoints will have to be own class
		       	Hunts will have a list of acessPoint classes
		       	
		       	-->
		       		<li>
		       			<c:out value="${thisLease.accessPoints}"/>
		       		</li>
		       	
		       		<li>
		       			<c:out value="${thisLease.blinds}"/>
		       		</li>
		       	
		       		<li>
		       			<c:out value="${thisLease.stands}"/>
		       		</li>	
		    	</ul>
			</c:forEach>
			
		</div>
	
	</body>
</html>
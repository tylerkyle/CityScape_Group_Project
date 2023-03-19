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
<!-- for Bootstrap CSS -->
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />


<meta charset="ISO-8859-1">
<title>Woden:Hunting Leases near you</title>
</head>
<body>
	
	<div class="links navbarlinks navbar navbar-expand-lg navbar-light bg-light" id="navbar">
	<!-- TODO: Delete before production: Needs to generate query -->
		<a href="/lease/near/${user.zipcode}" class="btn btn-success"> Hunting leases near you</a>
		<a href="/lease/myleases" class="btn btn-success">Your hunting leases </a>
		<a href="/lease/new" class="btn btn-success">Create hunting lease </a>
		<a href="/logout" class="btn btn-success">Logout</a>
	</div>
	<div>
		<h1 class="title"> Instantly book hunting leases</h1>
	</div>
	
	<div id="hunt-info" class="main-container">
		<div class="map">
			<p>Map</p>
		</div>
	
	
		<div id="allhuntingleases" class="allHuntingLeases">
			
			<h2> All leases </h2>
			<c:forEach var="thisLease" items="${allLeases}">
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
    
  	
    
  </div>  	

</body>
</html>
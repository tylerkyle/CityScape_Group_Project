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
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="/css/leasenearme.css">

<meta charset="ISO-8859-1">
<title>Woden:Hunting Leases near you</title>
</head>
<body id="body">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
	
	<div class="w-max" id="headingcontainer">
		<div id="titlecontainer">
			<h1
				class="title d-flex justify-content-center justify-text-center w-auto font-weight-bold p-3"
				id="title">Instantly book hunting leases</h1>
		</div>

		
		<div
			class=" navigationbar links navbarlinks navbar navbar-expand-lg navbar-light bg-light justify-content-evenly justify-text-center w-auto "
			id="navbar">
			<c:forEach var="thisUsersRole" items="${user.roles}">
			<c:if test="${thisUsersRole.id == 1}">
				<a href="/admin/super" class="btn btn-success m-2 p-2" id="leasenearlink">Super admin panel</a>
			</c:if>
			</c:forEach>
			
			<c:forEach var="thisUsersRole" items="${user.roles}">
			<c:if test="${thisUsersRole.id == 2}">
				<a href="/admin/admin" class="btn btn-success m-2 p-2" id="leasenearlink">Admin panel</a>
			</c:if>
			</c:forEach>

			<a href="/lease/all" class="btn btn-success m-2 p-2" id="allleases">All leases</a>
			<a href="/lease/near/${user.zipcode}" class="btn btn-success m-2 p-2 " id="leasenearlink">
				Hunting leases near you</a> <a href="/lease/myleases"
				class="btn btn-success m-2 p-2" id="yourleaselink">Your hunting leases </a> 
				<a href="/hunt/yourhunts" class="btn btn-success m-2 p-2" id="yourhuntslink" >Your hunts</a>
				<a href="/lease/new" class="btn btn-success m-2 p-2" id="createleaselink">Create hunting lease </a>
			<a href="/logout" class="btn btn-success m-2 p-2" id="logoutlink">Logout</a>
		</div>
	</div>

	

	<div id="huntinfo" class="main-container ">
		
		
		
			
		<div id="allhuntingleases" class="card row d-flex flex-row justify-content-between p-5   allHuntingLeases" id="leasecontainer">
			<div class="w-max ">
			<h2 class=" justify-text-center justify-content-center m-2 p-2">All leases</h2>
		</div>
			
			<c:forEach var="thisLease" items="${allLeases}">
				<div class="leaseCard m-2 p-2 col-3 ">
		    		<h5 class="card-title justify-conent-center">
		    		<c:out value="${thisLease.title}"/>
		    		</h5>

					<ul class="list-group ">
						<li class="list-group-item"><c:out value="Game types: ${thisLease.game}" /></li>
						<li class="list-group-item"><c:out value="Daily rate: $${thisLease.rate}" /></li>
		       			<li class="list-group-item"><c:out value="Access points: ${thisLease.accessPoints}" /></li>
		       			<li class="list-group-item"><c:out value="Blinds: ${thisLease.blinds}" /></li>
						<li class="list-group-item"><c:out value="Stands: ${thisLease.stands}" /></li>
						<li class="list-group-item"><c:out value="Property zipcode: ${thisLease.zipcode}" /></li>
						
						 <a href="/lease/${thisLease.id}" class="btn btn-primary m-2 p-2" id="viewleasebutton">View Lease</a>
					</ul>
				</div>
			</c:forEach>
			
		</div>
    
  	
    
  </div>  	

</body>
</html>
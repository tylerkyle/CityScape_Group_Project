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
<title>Woden Hunts: your leases</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="/css/leaseDashboard.css">
</head>
<body>
	
	
	<div class="navigationbar links navbarlinks navbar navbar-expand-lg navbar-light bg-light justify-content-evenly justify-text-center w-max">
	<!-- TODO: Delete before production: Needs to generate query -->
		<a href="/lease/near/${user.zipcode}" class="btn btn-success"> Hunting leases near you</a>
		<a href="/lease/myleases" class="btn btn-success">Your hunting leases </a>
		<a href="/lease/new" class="btn btn-success">Create hunting lease </a>
		<a href="/lease/all" class="btn btn-success">All hunting leases</a>
		<a href="/profile/edit" class="btn btn-success">Edit profile</a>
		<a href="/logout" class="btn btn-success">Logout</a>
	</div>
	
	<div class="card">
  <h5 class="card-header">Featured</h5>
  <div class="card-body">
    <h5 class="card-title">Special title treatment</h5>
    <p class="card-text">With supporting text below as a natural lead-in to additional content.</p>
    <a href="#" class="btn btn-primary">Go somewhere</a>
  </div>
</div>
		
	<div class="container-fluid">
		<div class="row justify-content-center m-2 p-2">
			<div class="col-4 ">
				<div id="allhuntingleases" class="allHuntingLeases">

					<h2>Manage your hunting leases</h2>
					<c:forEach var="thisLease" items="${myLeases}">
						<c:if test="${userId == thisLease.usersId }">
							<div class="card">
								<ul class="leaseCard">
									<li class="card-title"><a href="/lease/${thisLease.id}"><c:out
												value="${thisLease.title}" /></a></li>

									<li><c:out value="${thisLease.game}" /></li>

									<li><c:out value="${thisLease.rate}" /></li>
									<!-- 
		       	
		       	TODO: Delete before production: acessPoints will have to be own class
		       	Hunts will have a list of acessPoint classes
		       	
		       	-->
									<li><c:out value="${thisLease.accessPoints}" /></li>

									<li><c:out value="${thisLease.blinds}" /></li>

									<li><c:out value="${thisLease.stands}" /></li>
								</ul>
								</div>
						</c:if>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
	
	


</body>
</html>
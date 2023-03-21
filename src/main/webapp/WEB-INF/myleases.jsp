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
<link rel="stylesheet" type="text/css" href="/css/myleases.css">
</head>
<body>
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
			<a href="/lease/all" class="btn btn-success m-2 p-2" id="allleases">All leases</a>
			<a href="/lease/near/${user.zipcode}" class="btn btn-success m-2 p-2 " id="leasenearlink">
				Hunting leases near you</a> <a href="/lease/myleases"
				class="btn btn-success m-2 p-2" id="yourleaselink">Your hunting leases </a> 
				<a href="/hunt/yourhunts" class="btn btn-success m-2 p-2" id="yourhuntslink" >Your hunts</a>
				<a href="/lease/new" class="btn btn-success m-2 p-2" id="createleaselink">Create hunting lease </a>
			<a href="/logout" class="btn btn-success m-2 p-2" id="logoutlink">Logout</a>
		</div>
	</div>
		
	<div class="container-fluid">
		<div class="row justify-content-center m-2 p-2">
			<div class="col-4 m-2 p-2 ">
				<div id="allhuntingleases" class="allHuntingLeases m-2 p-2 ">

					<h2>Manage your hunting leases</h2>
					<c:forEach var="thisLease" items="${myLeases}">
						<c:if test="${userId == thisLease.usersId }">
							<div class="card m-2 p-2">
								<ul class="leaseCard">
									<li class="card-title"> <c:out value="Title: ${thisLease.title}" /> </li>

									<li><c:out value="Game types: ${thisLease.game}" /></li>

									<li><c:out value="Daily rate: ${thisLease.rate}" /></li>
	
									<li><c:out value="Access points: ${thisLease.accessPoints}" /></li>

									<li><c:out value="Blinds: ${thisLease.blinds}" /></li>

									<li><c:out value="Stands: ${thisLease.stands}" /></li>
									<a href="/lease/${thisLease.id}" class="btn btn-primary p-2 m-2" id="viewleasebutton">View lease</a>
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
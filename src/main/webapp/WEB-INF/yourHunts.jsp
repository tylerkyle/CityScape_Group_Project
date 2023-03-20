<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Your Hunts</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="/css/reviewHunt.css">
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
			<!-- TODO: Delete before production: Needs to generate query -->
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
				<div id="allhuntingleases" class="allHuntingLeases m-2 p-2">

					<h2>Upcoming hunts</h2>
					<c:forEach var="thisHunt" items="${usersHunts}">
						
							<div class="card m-2 p-2">
								<ul class="leaseCard">
									<li class="card-title"> <c:out value="Start date: ${thisHunt.startDate}" /> </li>
									<li class="card-title"> <c:out value="End date: ${thisHunt.endDate}" /> </li>
								</ul>
							<form:form action="/hunt/delete/${thisHunt.id}" method="post"
								modelAttribute="updateHunt">
								<div>
									<input class="btn btn-danger m-1 p-1" type="submit"
										value="Cancel booking" />
								</div>
							</form:form>
						</div>
						
					</c:forEach>
				</div>
			</div>
		</div>
	</div>

</body>
</html>
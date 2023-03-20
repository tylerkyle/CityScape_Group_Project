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
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="/css/superAdmin.css">
<meta charset="ISO-8859-1">
<title>Woden Hunts: Leases near me</title>
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



	<div id="allhuntingleases" class="allHuntingLeases container-fluid row justify-content-center justify-text-center m-0 p-0 ">
		<div class="row justify-content-center justify-text-center d-flex ">
			<div class="col-3 justify-content-center justify-text-center m-2 p-1 ">
				<h2 class="m-1 p-1">
					Manage users
					
				</h2>
				<c:forEach var="thisUser" items="${allUsers}">
					<div class="card m-2 p-2">
					<ul class="list-group">
						<li class="list-group-item m-2 p-2">
						<c:out value="${thisUser.username}" /></li>

					<a href="/delete/${thisUser.id}" class="btn btn-danger m-1 p-1" id="deleteuserbutton">Delete user</a>
					<a href="/edit/${thisUser.id}" class="btn btn-success m-1 p-1" id="edituserbutton">Edit user</a>
					</ul>
					</div>
				</c:forEach>

			</div>
		
		
			<div class="col-3 justify-content-center justify-text-center m-2 p-1">
				<h2 class="m-1 p-1">
					Manage leases
					
				</h2>
				<c:forEach var="thisLease" items="${allLeases}">
					<div class="card m-2 p-2">
					<ul class="list-group">
						<li class="list-group-item m-2 p-2">
						<c:out value="${thisLease.title}" /></li>

					<a href="/delete/${thisUser.id}" class="btn btn-danger m-1 p-1" id="deleteuserbutton">Delete user</a>
					<a href="/edit/${thisUser.id}" class="btn btn-success m-1 p-1" id="edituserbutton">Edit user</a>
					</ul>
					</div>
				</c:forEach>

			</div>
		
		
			<div class="col-3 justify-content-center justify-text-center m-2 p-1">
				<h2 class="m-1 p-1">
					Manage users
					
				</h2>
				<c:forEach var="thisHunt" items="${allHunts}">
					<div class="card m-2 p-2">
					<ul class="list-group">
						<li class="list-group-item m-2 p-2">
						<c:out value="${thisHunt.startDate}" /></li>
						<li class="list-group-item m-2 p-2">
						<c:out value="${thisHunt.endDate}" /></li>

					<a href="/super/admin/delete/${thisHunt.id}" class="btn btn-danger m-1 p-1" id="deleteuserbutton">Delete hunt</a>
					<a href="super/admin/edit/${thisHunt.id}" class="btn btn-success m-1 p-1" id="edituserbutton">Edit hunt</a>
					</ul>
					</div>
				</c:forEach>

			</div>
		 
		
		</div>
		</div>

</body>
</html>
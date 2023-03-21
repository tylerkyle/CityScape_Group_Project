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
<link rel="stylesheet" type="text/css" href="/css/leasenearme.css">
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



	<div class="row justify-content-center m-2 p-2">
	<div class="col-4">
	<div class="card">
	
	<div id="allhuntingleases" class="allHuntingLeases">

		<h2>Confirm Hunt details</h2>
		<ul class=" list-group leaseCard">


			<li class="list-group-item m-1 p-1">Start date</li>

			<li class="list-group-item m-1 p-1"><c:out value="${lastHunt.startDate}" /></li>
			<li class="list-group-item m-1 p-1">End date</li>
			<li class="list-group-item m-1 p-1"><c:out value="${lastHunt.endDate}" /></li>
			<li class="list-group-item m-1 p-1">Total days</li>
			<li class="list-group-item m-1 p-1"><c:out value="${lastHunt.totalDays}" /></li>
			<li class="list-group-item m-1 p-1">Booking total</li>
			<li class="list-group-item m-1 p-1"><c:out value="$${lastHunt.total}" /></li>
			<li class="list-group-item m-1 p-1">Tax</li>
			<li class="list-group-item m-1 p-1"><c:out value="$${lastHunt.tax}" /></li>
			<li class="list-group-item m-1 p-1">Service fee</li>
			<li class="list-group-item m-1 p-1"><c:out value="$${lastHunt.serviceFee}" /></li>
			<li class="list-group-item m-1 p-1">Grand total</li>
			<li class="list-group-item m-1 p-1"><c:out value="$${lastHunt.grandTotal}" /></li>
		</ul>
		<div class="container-fluid justify-content-center">
			<form:form action="/hunt/confirmed/${lastHunt.id}" method="post"
				modelAttribute="updateHunt">
				<input type="hidden" name="_method" value="PUT" />
				<div>

					<form:errors path="confirmed" class="text-danger" />
					<form:input path="confirmed" type="hidden" value="true" />
				</div>
				
				<div>
					<input class="btn btn-success m-1 p-1" type="submit" value="Confirm booking" />
				</div>
			</form:form>
			<form:form action="/hunt/delete/${lastHunt.id}" method="post"
				modelAttribute="updateHunt">
				<div>
					<input class="btn btn-danger m-1 p-1" type="submit" value="Cancel booking" />
				</div>
			</form:form>
		</div>
		</div>
			</div>
</div>
	</div>
</body>
</html>
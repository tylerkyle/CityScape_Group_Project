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
<link rel="stylesheet" type="text/css" href="/css/editlease.css">
<title>Edit lease</title>
</head>
<body>
<div class="w-max" id="headingcontainer">
		<div id="titlecontainer">
			<h1
				class="title d-flex justify-content-center justify-text-center w-auto font-weight-bold p-3"
				id="titleheading">Instantly book hunting leases</h1>
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
	
	
	

	
	<div class="container-fluid justify-content-center">	
	<div class="row justify-content-center d-flex flex-wrap">
	<div class="col-3 m-3 p-3">

				<form:form action="/admin/super/update/hunt/${thisHunt.id}" method="post" modelAttribute="blankHunt">
					<input type="hidden" name="_method" value="PUT"/>
					<div>
				<form:label path="startDate">Start date: </form:label><br />
				<form:errors path="startDate" class="text-danger"/>
				<form:input path="startDate" value="${thisHunt.startDate }"/>
			</div>
			
			<div>
				<form:label path="endDate">End date:: </form:label><br />
				<form:errors path="endDate" class="text-danger"/>
				<form:input path="endDate" value="${thisHunt.endDate }"/>
			</div>


	
			<div>
				<input class="button btn btn-success m-1 p-1" type="submit" value="Update hunt details"/>
			</div>
	</form:form>
	</div>
	</div>
	</div>
	
	<div>
	</div>
	
</body>
</html>
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
	
	
	

	
	<div class="container-fluid justify-content-center">	
	<div class="row justify-content-center d-flex flex-wrap">
	<div class="col-3 m-3 p-3">

				<form:form action="/admin/super/update/lease/${thisLease.id}" method="post" modelAttribute="blankLease">
					<input type="hidden" name="_method" value="PUT"/>
					<div>
				<form:label path="title">Title: </form:label><br />
				<form:errors path="title" class="text-danger"/>
				<form:input path="title"/>
			</div>
			
			<div>
				<form:label path="acres">Acres: </form:label><br />
				<form:errors path="acres" class="text-danger"/>
				<form:input path="acres"/>
			</div>

			<div>
				<form:label path="game">Game: </form:label><br />
				<form:errors path="game" class="text-danger"/>
				<form:input path="game"/>
			</div>
	
			<div>
				<form:label path="accessPoints">Access Points: </form:label><br />
				<form:errors path="accessPoints" class="text-danger"/>
				<form:input path="accessPoints"/>
			</div>
			
			
			<div>
				<form:label path="blinds">Blinds: </form:label><br />
				<form:errors path="blinds" class="text-danger"/>
				<form:input path="blinds"/>
			</div>
			
			<div>
				<form:label path="stands">Stands: </form:label><br />
				<form:errors path="stands" class="text-danger"/>
				<form:input path="stands"/>
			</div>
			
			<div>
				<form:label path="rate">Rate: </form:label><br />
				<form:errors path="rate" class="text-danger"/>
				<form:input path="rate"/>
			</div>
			<!-- TODO: Add photos  once working-->
			<div>
				<form:label path="zipcode">Zip code: </form:label><br />
				<form:errors path="zipcode" class="text-danger"/>
				<form:input path="zipcode"/>
			</div>
			
			
			
			<!-- List -->
			<div id="daysavaliable">
				<form:checkbox path="monday" value="True"/>Monday
				<form:checkbox path="tuesday" value="True"/>Tuesday
				<form:checkbox path="wednesday" value="True"/>Wednesday
				<form:checkbox path="thursday" value="True"/>Thursday
				<form:checkbox path="friday" value="True"/>Friday
				<form:checkbox path="saturday" value="True"/>Saturday
				<form:checkbox path="saturday" value="True"/>Sunday
			</div>
			<div>
				<form:checkbox path="morningBooking" value="True"/>5AM-10AM
				<form:checkbox path="eveningBooking" value="True"/>1PM-6PM
			</div>
			
			<div>
				<form:label path="game">Game: </form:label><br />
				<form:errors path="game" class="text-danger"/>
				<form:input path="game" class="form-input"/>
			</div>
			
			<div>
				<form:label path="description">Description: </form:label><br />
				<form:errors path="description" class="text-danger"/>
				<form:input path="description"/>
			</div>
			
			<div>
				<form:checkbox path="termsofService" value="True"/>Agree
			</div>
			
			<a href="/leases/terms/service"> terms of service</a>
			
			<div>
				<form:hidden path="usersId" value="${userId}"/>
					</div>
	
			<div>
				<input class="button" type="submit" value="Update lease lisitng"/>
			</div>
	</form:form>
	</div>
	</div>
	</div>
	
	<div>
	</div>
	
</body>
</html>
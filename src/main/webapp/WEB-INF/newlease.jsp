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

<!-- For any Bootstrap that uses JS or jQuery-->
<script src="/webjars/jquery/jquery.min.js"></script>
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
<link type="text/css" rel="stylesheet" href="<c:url value="/css/newLease.css" />" />
<meta charset="ISO-8859-1">
<title>Create New Hunt</title>
</head>
<body>
	
	<div class="links navbarlinks navbar navbar-expand-lg navbar-light bg-light">
	<!-- TODO: Delete before production: Needs to generate query -->
		<a href="/lease/near/${user.zipcode}" class="btn btn-success"> Hunting leases near you</a>
		<a href="/lease/myleases" class="btn btn-success">Your hunting leases </a>
		<a href="/lease/new" class="btn btn-success">Create hunting lease </a>
		<a href="/lease/all" class="btn btn-success">All hunting leases</a>
		<a href="/profile/edit" class="btn btn-success">Edit profile</a>
		<a href="/logout" class="btn btn-success">Logout</a>
	</div>
	
	<h1 class="title"> New Hunt</h1>
	
	<div  class="form-group">	
		<form:form  class="newLeaseForm" action="/lease/create" method="post" modelAttribute="newLease">
		<div class="first-half">
			
			<div class="formInputContainer">
				
				<div class="formLabel">
					<form:label path="title">Title: </form:label><br />
				</div>
				
				<form:errors path="title" class="text-danger"/>
				
				<div class="formInput">
					<form:input path="title" value="Three acres south of raleigh"/>
				</div>
				
			</div>
			
			<div class="formInputContainer">
				<form:label path="acres">Acres: </form:label><br />
				<form:errors path="acres" class="text-danger"/>
				<form:input path="acres" value="3"/>
			</div>

			<div class="formInputContainer">
				<form:label path="game">Game: </form:label><br />
				<form:errors path="game" class="text-danger"/>
				<form:input path="game" value="Deer and squirle"/>
			</div>
	
			<div class="formInputContainer">
				<form:label path="accessPoints">Access Points: </form:label><br />
				<form:errors path="accessPoints" class="text-danger"/>
				<form:input path="accessPoints" value="There are two"/>
			</div>
			
			
			<div class="formInputContainer">
				<form:label path="blinds">Blinds: </form:label><br />
				<form:errors path="blinds" class="text-danger"/>
				<form:input path="blinds" value="Three"/>
			</div>
			
			<div class="formInputContainer">
				<form:label path="stands">Stands: </form:label><br />
				<form:errors path="stands" class="text-danger"/>
				<form:input path="stands" value="one"/>
			</div>
			
			<div class="formInputContainer">
				<form:label path="rate">Rate: </form:label><br />
				<form:errors path="rate" class="text-danger"/>
				<form:input path="rate" value="50"/>
			</div>
			<!-- TODO: Add photos  once working-->
			<div class="formInputContainer">
				<form:label path="zipcode">Zip code: </form:label><br />
				<form:errors path="zipcode" class="text-danger"/>
				<form:input path="zipcode" value="27606"/>
			</div>
		</div>	
		<div class="second-half">
			<div id="daysavaliable" class="formInputContainer">
				<form:checkbox path="monday" value="True"/>Monday
				<form:checkbox path="tuesday" value="True"/>Tuesday
				<form:checkbox path="wednesday" value="True"/>Wednesday
				<form:checkbox path="thursday" value="True"/>Thursday
				<form:checkbox path="friday" value="True"/>Friday
				<form:checkbox path="saturday" value="True"/>Saturday
				<form:checkbox path="saturday" value="True"/>Sunday
			</div>
			<div class="formInputContainer">
				<form:checkbox path="morningBooking" value="True"/>5AM-10AM
				<form:checkbox path="eveningBooking" value="True" class="form-input"/>1PM-6PM 
			</div>
			
			<div class="formInputContainer">
				<form:label path="description">Description: </form:label><br />
				<form:errors path="description" class="text-danger"/>
				<form:input path="description"/>
			</div>
			
				<a href="/leases/terms/service"> terms of service</a>
			
			<div class="formInputContainer">
				<form:hidden path="usersId" value="${userId}"/>
			</div>
	
			<div class="form-input">
				<input class="button" type="submit" value="Publish lease lisitng"/>
			</div>
					
			<div class="form-input">
				<form:checkbox path="termsofService" value="True"/>Agree
			</div>
		</div>

	</form:form>
	</div>
</body>
</html>
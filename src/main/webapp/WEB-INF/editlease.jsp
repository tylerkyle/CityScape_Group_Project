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

<title>Edit lease</title>
</head>
<body>
	<div>
		<h1><c:out value="${thisLease.title}"></c:out></h1>
		<a href="/lease/near/${user.zipcode}">Leases near you </a>
		<a href="/leases/all">all leases </a>
	</div>
	<h1>Edit <c:out value="thisLease"/></h1>
	<div class="container-fluid justify-content-center">	
		<form:form action="/lease/${thisLease.id}/update" method="post" modelAttribute="thisLease">
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
	
	<div>
	</div>
	
</body>
</html>
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

<head>
<!-- for Bootstrap CSS -->
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />

<!-- For any Bootstrap that uses JS or jQuery-->
<script src="/webjars/jquery/jquery.min.js"></script>
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
<link type="text/css" rel="stylesheet" href="<c:url value="/css/leasesnearme.css" />" />
<head>
<!-- for Bootstrap CSS -->
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />

<!-- For any Bootstrap that uses JS or jQuery-->
<script src="/webjars/jquery/jquery.min.js"></script>
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
<link type="text/css" rel="stylesheet" href="<c:url value="/css/leaseDashboard.css" />" />
<meta charset="ISO-8859-1">
<title>Woden Hunts: Leases near me</title>
</head>
<body>
	<div class="links navbarlinks navbar navbar-expand-lg navbar-light bg-light">
	<!-- TODO: Delete before production: Needs to generate query -->
		
		<a href="/lease/myleases" class="btn btn-success">Your hunting leases </a>
		<a href="/lease/new" class="btn btn-success">Create hunting lease </a>
		<a href="/lease/all" class="btn btn-success">All hunting leases</a>
		<a href="/profile/edit" class="btn btn-success">Edit profile</a>
		<a href="/logout" class="btn btn-success">Logout</a>
	</div>
	
	
	<div id="allhuntingleases" class="allHuntingLeases">
			
			<h2> Confirm Hunt details</h2>
				<ul class="leaseCard">
		    				
		    		
		    		<li> Start date </li>
		    		
		    		<li>
		    			<c:out value="${lastHunt.startDate}"/>
		    		</li>
		    		<li> End date </li>
		    		<li>
		    			<c:out value="${lastHunt.endDate}"/> 
		    		</li>
		    		<li> Total days</li>
		    		<li>
		    			<c:out value="${lastHunt.totalDays}"/> 
		    		</li>
		    		<li> Booking total</li>
		    		<li>
		    			<c:out value="$${lastHunt.total}"/>
		    		</li>
		    		<li> Tax</li>
		    		<li>
		    			<c:out value="$${lastHunt.tax}"/> 
		    		</li>
		    		<li> Service fee</li>
		    		<li>
		    			<c:out value="$${lastHunt.serviceFee}"/> 
		    		</li>
		    		<li> Grand total</li>
		    		<li>
		    			<c:out value="$${lastHunt.grandTotal}"/>
		    		</li>
		    	</ul>
		    	<div class="container-fluid justify-content-center">	
		<form:form action="/hunt/confirmed/${lastHunt.id}" method="post" modelAttribute="updateHunt">
			<input type="hidden" name="_method" value="PUT"/>
			<div>
				
				<form:errors path="confirmed" class="text-danger"/>
				<form:input  path="confirmed" type="hidden" value="true"/>
			</div>
			<div>
				<input class="button" type="submit" value="Confirm booking"/>
			</div>
		</form:form>
		</div>
		    </div>
	</body>
</html>
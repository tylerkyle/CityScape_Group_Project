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
<link rel="stylesheet" type="text/css" href="/css/leaseDashboard.css">
<title>Hunting lease details</title>
</head>
<body>

	<div class="container-fluid ">
		<div
			class="navigationbar links navbarlinks navbar navbar-expand-lg navbar-light bg-light justify-content-evenly justify-text-center w-auto m-2 p-2"
			id="navbar">
			<!-- TODO: Delete before production: Needs to generate query -->
			<a href="/lease/near/${user.zipcode}" class="btn btn-success m-2 p-2">
				Hunting leases near you</a> <a href="/lease/myleases"
				class="btn btn-success m-2 p-2">Your hunting leases </a> <a
				href="/lease/new" class="btn btn-success m-2 p-2">Create hunting lease </a>
			<a href="/logout" class="btn btn-success m-2 p-2">Logout</a>
		</div>
	</div>
		<div class="row justify-content-center justify-text-center">
			<div class="col-5">
				<h1>
					<c:out value="${thisLease.title}"></c:out>
				</h1>
				<div>
					<ul>
						<li>Title: <c:out value="${thisLease.title}"></c:out>
						</li>
						<li>Game: <c:out value="${thisLease.game}"></c:out>
						</li>

						<li>Access points: <c:out value="${thisLease.accessPoints}"></c:out>
						</li>
						<li>Blinds: <c:out value="${thisLease.blinds}"></c:out>
						</li>
						<li>Stands: <c:out value="${thisLease.stands}"></c:out>
						</li>
						<li>AM Rate: <c:out value="$${thisLease.rate}"></c:out>
						</li>
						<li>PM Rate: <c:out value="$${thisLease.rate}"></c:out>
						</li>
						<li>Zip code: <c:out value="${thisLease.zipcode}"></c:out>
						</li>
					</ul>
				</div>

				<c:if test="${userId == thisLease.usersId }">
					<div class="container">
						<form:form action="/lease/delete/${thisLease.id}" class="form"
							method="post">
							<input type="hidden" name="_method" value="post" />

							<div class="form-row">
								<input type="submit" value="Delete" class="btn-primary" />
							</div>
						</form:form>

					</div>

					<div class="container">
						<form:form action="/lease/${thisLease.id}/edit" class="form"
							method="put">
							<input type="hidden" name="_method" value="put" />

							<div class="form-row">
								<input type="submit" value="edit lease" class="btn-primary" />
							</div>
						</form:form>
					</div>
				</c:if>

				<c:if test="${userId != thisLease.usersId}">
					<div class="bookHuntContainer">
						<div class="formContainer">
							<form:form action="/hunt/submit/${thisLease.id}" method="post"
								modelAttribute="newHunt">
								<div class="inputContainer">

									<div class="leaseeIdcontainer">
										<form:errors path="user" class="test-danger" />
										<form:input path="user" type="hidden" value="${userId}" />
									</div>

									<div class="leaseorIdcontainer">
										<form:errors path="leaseorId" class="test-danger" />
										<form:input path="leaseorId" type="hidden"
											value="${thisLease.usersId}" />
									</div>

									<div class="startDate">
										<form:label path="startDate">Start date:</form:label>
										<form:errors path="startDate" class="test-danger" />
										<form:input path="startDate" type="date" />
									</div>


									<div class="endDate">
										<form:label path="endDate">End date:</form:label>
										<form:errors path="endDate" class="test-danger" />
										<form:input path="endDate" type="date" />
									</div>

									<div class="confirmContainer">

										<form:errors path="confirmed" class="test-danger" />
										<form:input path="confirmed" type="hidden" value="false" />
									</div>



									<div class="rateContainer">

										<form:errors path="rate" class="test-danger" />
										<form:input path="rate" type="hidden"
											value="${thisLease.rate} " />
									</div>

									<div class="submitButton">
										<input class="button btn btn-success" type="submit"
											value="Review booking" />
									</div>
								</div>
							</form:form>
						</div>
					</div>

				</c:if>
			</div>
		</div>
	</div>
</body>
</html>
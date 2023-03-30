<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
	crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="/css/login.css">
<title>Registration Page</title>
</head>
<body id="bodycontainer">
	<div class="row justify-content-center">
		<h1 clas="col-12 m-2 p-2 " id="catchline">CityScape: Find activities in your city</h1>
		<div class="col-4 m-2 p-2">
			<h2 id="register">Register!</h2>

			<p>
				<form:errors path="user.*" />
			</p>

			<form:form method="POST" action="/registration" modelAttribute="user"
				class="  m-2 p-2">

				<p class="form-group">
					<form:label path="username">
						<span id="usernamespan">Username:</span>
					</form:label>
					<form:input path="username" class="m-1 p-1 rounded-3" />
				</p>

				<p>
					<form:label path="email" id="emailaddress">Email address:</form:label>
					<form:input path="email" class="m-1 p-1 rounded-3" />
				</p>

				<p>
					<form:label path="password">
						<span id="passwordspan">Password:</span>
					</form:label>
					<form:password path="password" class="m-1 p-1 rounded-3" />
				</p>
				<p>
					<form:label path="passwordConfirmation" id="pwconfirm">Password Confirmation:</form:label>
					<form:password path="passwordConfirmation"
						class="m-1 p-1 rounded-3" />
				</p>
				<input type="submit" value="Register!"
					class="btn btn-primary w-max " id="registerupbutton" />
			</form:form>

			<p class="m-2 p-2" id="tagline">Already have an account?</p>
			<a href="login" class="btn btn-primary w-max" class="m-2 p-2"
				id="signupbutton">Login in</a>
		</div>
	</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="/css/login.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login Page</title>
</head>
<body id="bodycontainer">
	<c:if test="${logoutMessage != null}">
		<c:out value="${logoutMessage}"></c:out>
	</c:if>
	
	<c:if test="${errorMessage != null}">
		<c:out value="${errorMessage}"></c:out>
	</c:if>
	<div class="fluid-container justify-content-center w-max" id="maincontainer">

		<div class="row justify-content-center m-1 p-1">


			<div class="col-9 m-2 p-2">
				<h1 id="catchline">CityScape: Find activities in your city</h1>
			</div>
			<div class="col-4 m-1 p-1">
			<h2 class="m-1 p-1" id="login">Login</h2>
			<form method="POST" action="/login" class=" p-1 form justify-content-center">
				<p class="m-1 p-1">
					<label for="username" class=" p-1" > <span id="usernamespan">Username</span> </label> <input type="text"
						id="username" name="username" class="m-1 p-1 rounded-3" />
				</p>
				<p>
					<label for="password" class="m-1 p-1" id="password"> <span id="passwordspan">Password</span></label> <input type="password"
						id="password" name="password" class="m-1 p-1 rounded-3"/>
				</p>
				<input type="hidden" name="${_csrf.parameterName}"
					value="${_csrf.token}" /> <input type="submit" value="Login!" class=" btn btn-primary w-max" id="signupbutton"/>
			</form>
			<p class="m-1 p-1" id="tagline">Don't have an account yet? Sign up and find your next hunt!</p>
			<div class="col-12 justify-content-center">
			<a href="registration" class="btn btn-primary w-max" class="m-1 p-1" id="signupbutton">Sign up</a>
			</div>
		</div>
		</div>
	</div>

</body>
</html>
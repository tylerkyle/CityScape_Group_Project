<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css" />
<link rel="stylesheet" type="text/css" href="/css/main.css">
<title>Registration Page</title>
</head>
<body id="bodycontainer">
    <div class="row justify-content-center">
    	<div class="col-9 m-2 p-2">
    		<h1 id="catchline">CityScape: Find Activities In Your City</h1>
    	</div>
    	<div class="col-4 m-2 p-2">
		    <h2 id="register">Register</h2>
		    <form:form method="POST" action="/registration" modelAttribute="user" class="m-2 p-2">
		        <p class="form-group">
		            <form:label path="username"><span id="usernamespan">Username:</span></form:label>
		            <form:errors path="username" class="text-danger"/><br>
		            <form:input path="username" title="Must be at least 3 characters" class="m-1 p-1 rounded-3"/>
		        </p>
		        <p>
		            <form:label path="email" id="emailaddress">Email:</form:label>
		            <form:errors path="email" class="text-danger"/><br>
		            <form:input type="email" path="email" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}" class="m-1 p-1 rounded-3"/>
		        </p>
		        <p>
		            <form:label path="zipcode" id="userzipcode" >Zipcode:</form:label>
		            <form:errors path="zipcode" class="text-danger"/><br>
		            <form:input pattern="[0-9]{5}" path="zipcode" title="Must be 5 numbers" class="m-1 p-1 rounded-3"/>
		        </p>
		        <p>
		            <form:label path="password" ><span id="passwordspan">Password:</span></form:label>
		            <form:errors path="password" class="text-danger"/><br>
		            <form:password path="password" title="6 or more characters" class="m-1 p-1 rounded-3"/>
		            <i id="toggle-pass" class="bi bi-eye-slash" title="Show"></i>
		        </p>
		        <p>
		            <form:label path="passwordConfirmation" id="pwconfirm">Password Confirmation:</form:label>
		            <form:errors path="passwordConfirmation" class="text-danger"/><br>
		            <form:password path="passwordConfirmation" title="6 or more characters" class="m-1 p-1 rounded-3"/>
     		        <i id="toggle-confirm-pass" class="bi bi-eye-slash" title="Show"></i>
		        </p>
		        <input type="submit" value="Register"  class="btn btn-primary w-max "id="registerupbutton"/>
		    </form:form>
		    <div>
			    <label id="tagline"> Already have an account?</label>
			    <a href="login" id="signupbutton">Log In</a>
		    </div>
    	</div>
    </div>
    <script src="/js/reg-script.js"></script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Admin Page</title>
</head>
<body>
   
    <h1>Welcome to the Super Admin Page <c:out value="${currentUser.username}"></c:out></h1>
   	
   	<c:forEach var="thisUsersRole" items="${currentUser.roles}">
		
		<c:if test="${(thisUsersRole.id == 1) || (thisUsersRole.id == 2)}">
			<c:forEach var="thisUser" items="${users}"> 
				<ul>
					<li> <c:out value="${thisUser.username}"> </c:out> </li>
					<li> <a href="admin/${thisUser.id}">Delete </a> </li>
				</ul>
			</c:forEach>   	
	   	</c:if>
	</c:forEach>
	   
	   
	   
	
	
	

    
    <form id="logoutForm" method="POST" action="/logout">
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        <input type="submit" value="Logout!" />
    </form>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Log Out!</title>
</head>
<body>
<%
	// delete the session if the user chooses to log out
	session.removeAttribute("username");
	session.invalidate();
	
	// redirect to the initial login page after the user logs out
	response.sendRedirect("login.jsp");
%>
</body>
</html>

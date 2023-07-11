<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<link rel=stylesheet href="login_register.css" type="text/css">
<head>
<meta charset="ISO-8859-1">
<title>Admin Registration</title>
</head>
<body>
	<div class="form">
		<h1>Admin Registration</h1>
		<!-- the data the user enters in this form are send to the RegisterServlet.java file, particularly calling its doPost method -->
		<form action="<%=request.getContextPath()%>/AdminRegister"
			method="post">
			<input type="text" name="username" placeholder="username" /> <input
				type="password" name="password" placeholder="password" />
			<button onclick="login.jsp">register</button>
		</form>
	</div>
</body>
</html>

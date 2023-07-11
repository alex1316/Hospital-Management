<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<link rel = stylesheet
      href = "login_register.css"
      type = "text/css">
<head>
<meta charset="ISO-8859-1">
<title>Login Form</title>
</head>
<body>
	<div class = "form">
		<h1>Login Form</h1>		
		<!-- the data the user enters in this form are send to the LoginServlet.java file, particularly calling its doPost method -->
		<form action="<%=request.getContextPath()%>/LoginServlet" method="post">

			<input type="text" name="username" placeholder="username" /> 
			<input type="password" name="password" placeholder="password" />
			<button>login</button>
			<h4>Not registered yet? <a style = "color: #e38283" href = "registrationOptions.html">Register now!</a></h4>
			
		</form>
	</div>	
</body>
</html>

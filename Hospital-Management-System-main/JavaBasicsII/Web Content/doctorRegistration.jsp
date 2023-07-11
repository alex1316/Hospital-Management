<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<link rel = stylesheet
      href = "login_register.css"
      type = "text/css">
<head>
<meta charset="ISO-8859-1">
<title>Doctor Registration</title>
</head>
<body>
	<div class="form">
		<h1>Doctor Registration</h1>
		<!-- the data the user enters in this form are send to the RegisterServlet.java file, particularly calling its doPost method -->
		<form action="<%=request.getContextPath()%>/DoctorRegister" method="post">
			<input type="text" name="username" placeholder="username" /> 
			<input type="password" name="password" placeholder="password" />
			<input type="text" name="first_name" placeholder="first_name" />
			<input type="text" name="surname" placeholder="surname" />
			<input type="text" name="email" placeholder="email" />
			<input type="text" name="phone" placeholder="phone" />
			<input type="text" name="specialty" placeholder="specialty" />
			<input type="text" name="infirmary_address" placeholder="infirmary_address" />
			<button onclick = "login.jsp">register</button>
		</form>
	</div>	
</body>
</html>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import = "java.sql.DriverManager"%>
<%@page import = "java.sql.ResultSet"%>
<%@page import = "java.sql.Statement"%>
<%@page import = "java.sql.Connection"%>

<!DOCTYPE html>
<html>
<link rel = stylesheet
      href = "login_register.css"
      type = "text/css">
<head>
<meta charset="ISO-8859-1">
<title>Availability Entry Form</title>
</head>
<body>
		<%
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		try {
			Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/javabasics?useSSL = false", "root", "test123");
			Statement statement = connection.createStatement();
			
			HttpSession temp = request.getSession();
			String username = temp.getAttribute("username").toString();
			
			String sql = "select * from javabasics.doctor where username = '" + username + "'";
			ResultSet resultSet = statement.executeQuery(sql);
						
			while (resultSet.next()) {
		%>
	<div class="form">
		<h1>Availability Entry</h1>
		<form action="<%=request.getContextPath()%>/AvailabilityEntry" method="post">
			<input type="hidden" name="first_name" value=<%=resultSet.getString("first_name")%>/>
			<input type="hidden" name="surname" value=<%=resultSet.getString("surname")%>/>
			<input type="hidden" name="specialty" value=<%=resultSet.getString("specialty")%>/>			
			<input type="datetime-local" name="datetime" />
			<button class = "delete" type = "submit" onclick = "alert('Availability Entered Succesfully!')">Done</button>
		</form>
	</div>
		<%
		}
		connection.close();
		} catch (Exception e) {
		e.printStackTrace();
		}
		%>
		
</body>
</html>

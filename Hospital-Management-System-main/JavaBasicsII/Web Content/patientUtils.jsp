<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Hello patient!</title>

<style type="text/css">
button {
	font-family: "Roboto", sans-serif;
	text-transform: uppercase;
	outline: 0;
	background: #ea9fa0;
	width: 20%;
	padding: 15px;
	color: #443c44;
	font-size: 20px;
	transition: all 0.3 ease;
	cursor: pointer;
	border: 2px solid black;
	box-shadow: 3px 3px #ea9fa0;
	letter-spacing: 2px;
}
button:hover
{
	background-color:#4eb6f7;
}
body {
	background: #68b599;
}
div {
	text-align: center;
	margin-top: 150px;
}
h1 {
	font-family: "Roboto", sans-serif;
	font-size: 40px;
	font-weight: lighter;
	color: #000000;
}
h4{	
    -webkit-text-stroke: 1px black;
	font-size: 25px;
	font-weight: bold;
	color: #e38283;
	font-family: sans-serif;
}
a:link {
	background-color: transparent;
	text-decoration: none;
}
a:hover {
	color: #006652;
	text-decoration: underline;
}
</style>

</head>
<body>
	<div>
		<h1>What would you like to do?</h1>
		<button onclick="window.location = 'patientBook.jsp'">Book An Appointment</button>
		<button onclick="window.location = 'patientManage.jsp'">Manage Appointments</button>
		<h4><a style = "color: #4eb6f7" href = "logout.jsp">LOG OUT!</a></h4>
	</div>
</body>
</html>

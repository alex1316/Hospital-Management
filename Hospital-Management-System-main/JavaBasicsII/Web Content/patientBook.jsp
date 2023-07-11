<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="database.Dao"%>
<%@ page import="java.time.LocalDateTime"%>
<%@ page import="java.time.format.DateTimeFormatter"%>
<!DOCTYPE html>
<html>
<link rel = stylesheet
      href = "tables.css"
      type = "text/css">

<body style="background-color:  #68b599">
	<table style = "margin-left: auto; margin-right: auto" class = "styled-table">
		<thead>
			<tr style = "background-color: #e38283">
				<td>Doctor Name</td>
				<td>Doctor Specialty</td>
				<td>Appointment Date-Time</td>
				<td>Action</td>
			</tr>
		</thead>
		<%
		// get today's date
		LocalDateTime myDateObj = LocalDateTime.now();
		DateTimeFormatter myFormatObj = DateTimeFormatter.ofPattern("yyy-MM-dd HH:mm:ss");
		String formattedDate = myDateObj.format(myFormatObj);
		String now_date = formattedDate.substring(0, 10);
		
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
			
			String patient_first_name = "";
			String patient_surname = "";
			
			String get_patient_name = "select * from javabasics.patient where username = '" + username + "'";
			ResultSet res = statement.executeQuery(get_patient_name);
			
			while (res.next()){
				patient_first_name = res.getString("first_name");
				patient_surname = res.getString("surname");
			}
						
			String patient_name = patient_first_name + " " + patient_surname;
			HttpSession ses = request.getSession();
			ses.setAttribute("patient_name", patient_name);
												
			String sql = "select * from javabasics.available_appointments";
			ResultSet resultSet = statement.executeQuery(sql);
			
			while (resultSet.next()) {
				String appointment_datetime = resultSet.getString("appointment_datetime");
				String appointment_datetime_date = appointment_datetime.substring(0, 10);
				if (now_date.compareTo(appointment_datetime_date) < 0){	
		%>
			<tr class = "active-row">
				<td><%=resultSet.getString("doctor_name")%></td>
				<td><%=resultSet.getString("doctor_specialty")%></td>
				<td><%=resultSet.getString("appointment_datetime")%></td>
				<td>
					<a href="patientBookII.jsp?doctor_name=<%=resultSet.getString("doctor_name")%>&appointment_datetime=<%=resultSet.getString("appointment_datetime")%>">
						<button class = "delete" type="button" onclick = "alert('Appointment Booked Succesfully!')">Book</button>
					</a>
				</td>
			</tr>
		<%
				}
		}
		connection.close();
		} catch (Exception e) {
		e.printStackTrace();
		}
		%>

	</table>
</body>
</html>

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
	<h3>FUTURE APPOINTMENTS</h3>
	<table style = "margin-left: auto; margin-right: auto" class="styled-table">
		<thead>	
			<tr style = "background-color: #e38283">
				<td>Doctor Name</td>
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
			
			String patient_first_name = "";
			String patient_surname = "";
			
			HttpSession temp = request.getSession();
			String username = temp.getAttribute("username").toString();
			
			String sql = "select * from javabasics.patient where username = '" + username + "'";
			ResultSet resultSet = statement.executeQuery(sql);
			
			while (resultSet.next()){
				patient_first_name = resultSet.getString("first_name");
				patient_surname = resultSet.getString("surname");
			}
			
			String patient_name = patient_first_name + " " + patient_surname;
			HttpSession ses = request.getSession();
			ses.setAttribute("patient_name", patient_name);
						
			String sql2 = "select * from javabasics.arranged_appointments where patient_name = '" + patient_name + "'";
			ResultSet res = statement.executeQuery(sql2);
			
			while (res.next()) {
				String appointment_datetime = res.getString("appointment_datetime");
				String appointment_datetime_date = appointment_datetime.substring(0, 10);
				// condition to get only the future appointments
				if (now_date.compareTo(appointment_datetime_date) < 0){	
		%>
			<tbody>
				<tr class = "active-row">
					<td><%=res.getString("doctor_name")%></td>
					<td><%=res.getString("appointment_datetime")%></td>
					<td>
						<a href="patientManageII.jsp?appointment_datetime=<%=res.getString("appointment_datetime")%>">
							<button class="delete" type="button">Cancel</button>
						</a>
					</td>
				</tr>
			</tbody>
		<%
				}
		}
		connection.close();
		} catch (Exception e) {
		e.printStackTrace();
		}
		%>

	</table>
	
	<h3>PAST APPOINTMENTS</h3>
	<table style = "margin-left: auto; margin-right: auto" class = "styled-table">
		<thead>
			<tr style = "background-color: #e38283">
				<td>Doctor Name</td>
				<td>Appointment Date-Time</td>
			</tr>
		</thead>
		<%
		// get today's date
		LocalDateTime myDateObj2 = LocalDateTime.now();
		DateTimeFormatter myFormatObj2 = DateTimeFormatter.ofPattern("yyy-MM-dd HH:mm:ss");
		String formattedDate2 = myDateObj.format(myFormatObj);
		String now_date2 = formattedDate.substring(0, 10);
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		try {
			Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/javabasics?useSSL = false", "root", "test123");
			Statement statement = connection.createStatement();
			
			String patient_first_name = "";
			String patient_surname = "";
			
			HttpSession temp = request.getSession();
			String username = temp.getAttribute("username").toString();
			
			String sql = "select * from javabasics.patient where username = '" + username + "'";
			ResultSet resultSet = statement.executeQuery(sql);
			
			while (resultSet.next()){
				patient_first_name = resultSet.getString("first_name");
				patient_surname = resultSet.getString("surname");
			}
			
			String patient_name = patient_first_name + " " + patient_surname;
			HttpSession ses = request.getSession();
			ses.setAttribute("patient_name", patient_name);
						
			String sql2 = "select * from javabasics.arranged_appointments where patient_name = '" + patient_name + "'";
			ResultSet res = statement.executeQuery(sql2);
			
			while (res.next()) {
				String appointment_datetime = res.getString("appointment_datetime");
				String appointment_datetime_date = appointment_datetime.substring(0, 10);
				// condition to get only the past appointments
				if (now_date.compareTo(appointment_datetime_date) > 0){	
		%>
		<tbody>
			<tr class = "active-row">
				<td><%=res.getString("doctor_name")%></td>
				<td><%=res.getString("appointment_datetime")%></td>
			</tr>
		</tbody>
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

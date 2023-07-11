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
				<td>Patient Name</td>
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
			
			String doc_first_name = "";
			String doc_surname = "";
			
			HttpSession temp = request.getSession();
			String username = temp.getAttribute("username").toString();
			
			String sql = "select * from javabasics.doctor where username = '" + username + "'";
			ResultSet resultSet = statement.executeQuery(sql);
			
			while (resultSet.next()){
				doc_first_name = resultSet.getString("first_name");
				doc_surname = resultSet.getString("surname");
			}
			
			String doc_name = doc_first_name + " " + doc_surname;
			HttpSession ses = request.getSession();
			ses.setAttribute("doc_name", doc_name);
						
			String sql2 = "select * from javabasics.arranged_appointments where doctor_name = '" + doc_name + "'";
			ResultSet res = statement.executeQuery(sql2);
			
			while (res.next()) {
				// only show the appointments booked for the next days and not the past appointments
				String appointment_datetime = res.getString("appointment_datetime");
				String appointment_datetime_date = appointment_datetime.substring(0, 10);
				if (now_date.compareTo(appointment_datetime_date) < 0){	
		%>
		<tbody>
			<tr class = "active-row">
				<td><%=res.getString("patient_name")%></td>
				<td><%=res.getString("appointment_datetime")%></td>
				<td><a href="doctorManageII.jsp?appointment_datetime=<%=res.getString("appointment_datetime")%>">
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
</body>
</html>

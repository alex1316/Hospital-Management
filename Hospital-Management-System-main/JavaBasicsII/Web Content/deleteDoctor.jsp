<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="database.Dao"%>
<!DOCTYPE html>
<html>
<link rel = stylesheet
      href = "tables.css"
      type = "text/css">
      
<body style="background-color:  #68b599">
	<table style = "margin-left: auto; margin-right: auto" class = "styled-table">
		<thead>
			<tr style = "background-color: #e38283">
				<td>First Name</td>
				<td>Last Name</td>
				<td>Email</td>
				<td>Phone Number</td>
				<td>Specialty</td>
				<td>Infirmary Address</td>
				<td>Action</td>
			</tr>
		</thead>
		
		<%
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		try {
			Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/javabasics?useSSL = false", "root", "test123");
			Statement statement = connection.createStatement();
			String sql = "select * from javabasics.doctor";
			ResultSet resultSet = statement.executeQuery(sql);
			int i = 0;
			while (resultSet.next()) {
		%>
		<tbody>
			<tr class = "active-row">
				<td><%=resultSet.getString("first_name")%></td>
				<td><%=resultSet.getString("surname")%></td>
				<td><%=resultSet.getString("email")%></td>
				<td><%=resultSet.getString("phone_number")%></td>
				<td><%=resultSet.getString("specialty")%></td>
				<td><%=resultSet.getString("infirmary_address")%></td>
				<td><a href="deleteDoctorII.jsp?
							username=<%=resultSet.getString("username")%>&
							first_name=<%=resultSet.getString("first_name")%>&
							surname=<%=resultSet.getString("surname")%>">
						<button class="delete" type="button" onclick="alert('Doctor Deleted Succesfully!')">Delete</button>
					</a>
				</td>
			</tr>
		</tbody>
		<%
		i++;
		}
		connection.close();
		} catch (Exception e) {
		e.printStackTrace();
		}
		%>

	</table>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%
response.sendRedirect("patientManage.jsp");

String doctor_name = request.getParameter("doctor_name");
String appointment_datetime = request.getParameter("appointment_datetime");
HttpSession temp = request.getSession();
String patient_name = temp.getAttribute("patient_name").toString();

try {
	Class.forName("com.mysql.jdbc.Driver");
	Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/javabasics?useSSL = false", "root", "test123");	
		
	PreparedStatement preparedStatement = connection.prepareStatement("insert into javabasics.arranged_appointments values (?, ?, ?)");
	preparedStatement.setString(1, doctor_name);	
	preparedStatement.setString(2, patient_name);	
	preparedStatement.setString(3, appointment_datetime);
	preparedStatement.executeUpdate();	
	
	PreparedStatement preparedStatement2 = connection.prepareStatement("delete from javabasics.available_appointments where doctor_name = ? and appointment_datetime = ?");
	preparedStatement2.setString(1, doctor_name);	
	preparedStatement2.setString(2, appointment_datetime);	
	preparedStatement2.executeUpdate();	
	
	out.println("Appointment Booked Succesfully!");
} catch (Exception e) {
	System.out.print(e);
	e.printStackTrace();
}
%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%
response.sendRedirect("deleteDoctor.jsp");

String username = request.getParameter("username");
String first_name = request.getParameter("first_name");
String surname = request.getParameter("surname");
String doctor_name = first_name + " " + surname;

try {
	Class.forName("com.mysql.jdbc.Driver");
	Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/javabasics?useSSL = false", "root", "test123");	
	
	// the doctor is deleted, so his available appointments should be deleted
	PreparedStatement preparedStatement = connection.prepareStatement("delete from javabasics.available_appointments where doctor_name = ?");		
	preparedStatement.setString(1, doctor_name);					
	preparedStatement.executeUpdate();	
	
	// the doctor is deleted, so his arranged appointments should be deleted
	PreparedStatement preparedStatement3 = connection.prepareStatement("delete from javabasics.arranged_appointments where doctor_name = ?");		
	preparedStatement3.setString(1, doctor_name);					
	preparedStatement3.executeUpdate();	
	
	// delete the doctor from the database
	PreparedStatement preparedStatement2 = connection.prepareStatement("delete from javabasics.doctor where username = ?");		
	preparedStatement2.setString(1, username);					
	preparedStatement2.executeUpdate();	
	
	// delete user from the database
	PreparedStatement preparedStatement4 = connection.prepareStatement("delete from javabasics.users where username = ?");		
	preparedStatement4.setString(1, username);					
	preparedStatement4.executeUpdate();
	
} catch (Exception e) {
	System.out.print(e);
	e.printStackTrace();
}
%>

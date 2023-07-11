<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*,java.util.*"%>
<%@ page import="java.time.LocalDateTime"%>
<%@ page import="java.time.format.DateTimeFormatter"%>
<%@ page import="javax.swing.*"%>
<%
HttpSession temp = request.getSession();
String patient_name = temp.getAttribute("patient_name").toString();

// get today's date
LocalDateTime myDateObj = LocalDateTime.now();
DateTimeFormatter myFormatObj = DateTimeFormatter.ofPattern("yyy-MM-dd HH:mm:ss");
String formattedDate = myDateObj.format(myFormatObj);
String now_date = formattedDate.substring(0, 10);
String now_month = formattedDate.substring(5, 7);
String now_day = formattedDate.substring(8, 10);

// get the appointment's date
String appointment_datetime = request.getParameter("appointment_datetime");
String appointment_datetime_date = appointment_datetime.substring(0, 10);
String appointment_datetime_month = appointment_datetime.substring(5, 7);
String appointment_datetime_day = appointment_datetime.substring(8, 10);

if (now_date.compareTo(appointment_datetime_date) > 0){
	// out.println("You've already done this appointment!");
	JOptionPane.showMessageDialog(null, "You've already done this appointment!");
} 
else if (now_date.compareTo(appointment_datetime_date) == 0){
	// out.println("Can't cancel the appointment, it's today!");
	JOptionPane.showMessageDialog(null, "Can't cancel the appointment, it's today!");
}
else if (now_date.compareTo(appointment_datetime_date) < 0){
	if (Integer.parseInt(now_month) == Integer.parseInt(appointment_datetime_month)){
		// the apppointment can be canceled if it's three days later
		if (Integer.parseInt(appointment_datetime_day) - Integer.parseInt(now_day) >= 3){
			try {
				Class.forName("com.mysql.jdbc.Driver");
				Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/javabasics?useSSL = false", "root", "test123");	
				
				PreparedStatement preparedStatement = connection.prepareStatement("delete from javabasics.arranged_appointments where patient_name = ? and appointment_datetime = ?");
				preparedStatement.setString(1, patient_name);
				preparedStatement.setString(2, appointment_datetime);
				preparedStatement.executeUpdate();	
					
				// out.println("Appointment Canceled Successfully!");
				JOptionPane.showMessageDialog(null, "Appointment Canceled Successfully!");
			} catch (Exception e) {
				System.out.print(e);
				e.printStackTrace();
			} 
		}
		else {
			// out.println("You can't cancel the appointment now, it's too late!");
			JOptionPane.showMessageDialog(null, "Can't cancel the appointment, it's too late!");
		}
	}
	else if (Integer.parseInt(now_month) > Integer.parseInt(appointment_datetime_month)){
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/javabasics?useSSL = false", "root", "test123");	
			
			PreparedStatement preparedStatement = connection.prepareStatement("delete from javabasics.arranged_appointments where patient_name = ? and appointment_datetime = ?");
			preparedStatement.setString(1, patient_name);
			preparedStatement.setString(2, appointment_datetime);
			preparedStatement.executeUpdate();	
				
			// out.println("Appointment Canceled Successfully!");
			JOptionPane.showMessageDialog(null, "Appointment Canceled Successfully!");
		} catch (Exception e) {
			System.out.print(e);
			e.printStackTrace();
		}
	}
}

response.sendRedirect("patientManage.jsp");
%>

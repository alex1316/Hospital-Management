package database;

import basic.Patient;
import basic.Users;
import basic.Admin;
import basic.Appointment;
import basic.Doctor;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

// Dao stands for database access object
// this class is responsible for the connections with the database
public class Dao {
				
	// function that validates whether the data given in the login form are correct 
	public boolean validate(Patient patient) throws ClassNotFoundException {
		
		boolean status = false;
		
		Class.forName("com.mysql.jdbc.Driver");
		
		try (
			// establish the connection with the database javabasics giving the url and the database's username and password
			Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/javabasics?useSSL = false", "root", "test123");	
			PreparedStatement preparedStatement = connection.prepareStatement("select * from patient where username = ? and password = ?")
			)
		{
			// the prepared statement gets its values from the patient object given as a parameter to the validate function
			preparedStatement.setString(1, patient.getUsername());
			preparedStatement.setString(2, patient.getPassword());
			
			// execute the prepared statement 
			ResultSet rs = preparedStatement.executeQuery();
			status = rs.next();		
		} 
		catch (SQLException e) 
		{
			e.printStackTrace();
		}
		
		// if the prepared statement gets executed, the boolean status is set to true and thus the validation is successful
		return status;		
	}	
	
	// function that validates whether the data given in the login form are correct 
	public boolean validate(Doctor doctor) throws ClassNotFoundException {
		
		boolean status = false;
		
		Class.forName("com.mysql.jdbc.Driver");
		
		try (
			// establish the connection with the database javabasics giving the url and the database's username and password
			Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/javabasics?useSSL = false", "root", "test123");	
			PreparedStatement preparedStatement = connection.prepareStatement("select * from doctor where username = ? and password = ?")
			)
		{
			// the prepared statement gets its values from the patient object given as a parameter to the validate function
			preparedStatement.setString(1, doctor.getUsername());
			preparedStatement.setString(2, doctor.getPassword());
			
			// execute the prepared statement 
			ResultSet rs = preparedStatement.executeQuery();
			status = rs.next();		
		} 
		catch (SQLException e) 
		{
			e.printStackTrace();
		}
		
		// if the prepared statement gets executed, the boolean status is set to true and thus the validation is successful
		return status;		
	}
	
	// function that validates whether the data given in the login form are correct 
	public boolean validate(Admin admin) throws ClassNotFoundException {
		
		boolean status = false;
		
		Class.forName("com.mysql.jdbc.Driver");
		
		try (
			// establish the connection with the database javabasics giving the url and the database's username and password
			Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/javabasics?useSSL = false", "root", "test123");	
			PreparedStatement preparedStatement = connection.prepareStatement("select * from admin where username = ? and password = ?")
			)
		{
			// the prepared statement gets its values from the patient object given as a parameter to the validate function
			preparedStatement.setString(1, admin.getUsername());
			preparedStatement.setString(2, admin.getPassword());
			
			// execute the prepared statement 
			ResultSet rs = preparedStatement.executeQuery();
			status = rs.next();		
		} 
		catch (SQLException e) 
		{
			e.printStackTrace();
		}
		
		// if the prepared statement gets executed, the boolean status is set to true and thus the validation is successful
		return status;		
	}	
	
	// function that inserts a patient in the database
	public String insert(Patient patient) throws ClassNotFoundException {
		
		String result = "User registered succesfully!";
		
		Class.forName("com.mysql.jdbc.Driver");
		
		try (
				// establish the connection with the database javabasics giving the url and the database's username and password
				Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/javabasics?useSSL = false", "root", "test123");	
				PreparedStatement preparedStatement = connection.prepareStatement("insert into patient values (?, ?, ?, ?, ?, ?, ?)")
			)
			{
				// the prepared statement gets its values from the patient object given as a parameter to the insert function
				preparedStatement.setString(1, patient.getUsername());
				preparedStatement.setString(2, patient.getPassword());
				preparedStatement.setString(3, patient.getFirst_name());
				preparedStatement.setString(4, patient.getSurname());
				preparedStatement.setString(5, patient.getEmail());
				preparedStatement.setLong(6, patient.getPhone_number());
				preparedStatement.setLong(7, patient.getAmka());
				
				// execute the prepared statement
				preparedStatement.executeUpdate();	
			} 
			catch (SQLException e) 
			{
				e.printStackTrace();
				result = "Data not entered, try again!";
			}
		
		// return a string representing the result of the insertion function (whether the insertion was successul or not)
		return result;
	}
	
	// function that inserts a doctor in the database
	public String insert(Doctor doctor) throws ClassNotFoundException {
		
		String result = "User registered succesfully!";
		
		Class.forName("com.mysql.jdbc.Driver");
		
		try (
				// establish the connection with the database javabasics giving the url and the database's username and password
				Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/javabasics?useSSL = false", "root", "test123");	
				PreparedStatement preparedStatement = connection.prepareStatement("insert into doctor values (?, ?, ?, ?, ?, ?, ?, ?)")
			)
			{
				// the prepared statement gets its values from the patient object given as a parameter to the insert function
				preparedStatement.setString(1, doctor.getUsername());
				preparedStatement.setString(2, doctor.getPassword());
				preparedStatement.setString(3, doctor.getFirst_name());
				preparedStatement.setString(4, doctor.getSurname());
				preparedStatement.setString(5, doctor.getEmail());
				preparedStatement.setLong(6, doctor.getPhone_number());
				preparedStatement.setString(7, doctor.getSpecialty());
				preparedStatement.setString(8, doctor.getInfirmary_address());
				
				
				// execute the prepared statement
				preparedStatement.executeUpdate();	
			} 
			catch (SQLException e) 
			{
				e.printStackTrace();
				result = "Data not entered, try again!";
			}
		
		// return a string representing the result of the insertion function (whether the insertion was successul or not)
		return result;
	}
	
	// function that inserts an administrator in the database
	public String insert(Admin admin) throws ClassNotFoundException {
				
		String result = "User registered succesfully!";
			
		Class.forName("com.mysql.jdbc.Driver");
				
		try (
				Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/javabasics?useSSL = false", "root", "test123");	
				PreparedStatement preparedStatement = connection.prepareStatement("insert into admin values (?, ?)")
			)
			{
				preparedStatement.setString(1, admin.getUsername());
				preparedStatement.setString(2, admin.getPassword());
					
				preparedStatement.executeUpdate();	
			} 
			catch (SQLException e) 
			{
				e.printStackTrace();
				result = "Data not entered, try again!";
			}
				
		return result;
	}
	
	// function that inserts a user in the database
	public String insert(Users user) throws ClassNotFoundException {
			
		String result = "User registered succesfully!";
			
		Class.forName("com.mysql.jdbc.Driver");
			
		try (
				Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/javabasics?useSSL = false", "root", "test123");	
				PreparedStatement preparedStatement = connection.prepareStatement("insert into users values (?, ?, ?, ?, ?, ?)")
			)
			{
				preparedStatement.setString(1, user.getUsername());
				preparedStatement.setString(2, user.getPassword());
				preparedStatement.setString(3, user.getFirst_name());
				preparedStatement.setString(4, user.getSurname());
				preparedStatement.setString(5, user.getEmail());
				preparedStatement.setLong(6, user.getPhone_number());
					
				preparedStatement.executeUpdate();	
			} 
			catch (SQLException e) 
			{
				e.printStackTrace();
				result = "Data not entered, try again!";
			}
			
		return result;
	}

	public String availabilityEntry(Appointment app) throws ClassNotFoundException {
		
		String result = "Appointment registered succesfully!";
		
		Class.forName("com.mysql.jdbc.Driver");
		
		try (
				// establish the connection with the database javabasics giving the url and the database's username and password
				Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/javabasics?useSSL = false", "root", "test123");	
				PreparedStatement preparedStatement = connection.prepareStatement("insert into available_appointments values (?, ?, ?)")
			)
			{
				preparedStatement.setString(1, app.getDoctor_name());
				preparedStatement.setString(2, app.getDoctor_specialty());
				preparedStatement.setString(3, app.getDatetime());
			
				preparedStatement.executeUpdate();	
			} 
			catch (SQLException e) 
			{
				e.printStackTrace();
				result = "Data not entered, try again!";
			}

		return result;
	}
		
}

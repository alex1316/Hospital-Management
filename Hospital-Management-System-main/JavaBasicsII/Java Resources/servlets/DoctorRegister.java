package servlets;

import java.io.IOException;
import java.security.SecureRandom;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import basic.Encryption;
import basic.Users;
import database.Dao;
import basic.Doctor;

/**
 * Servlet implementation class AdminRegistration
 */
@WebServlet("/DoctorRegister")
public class DoctorRegister extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	// create an object of the Dao class in order to manage the connection with the database
	private Dao dao;
	
	// when this servlet gets initialized, the dao object gets instantiated
	public void init() {
		dao = new Dao();
	}

    public DoctorRegister() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// request and store the user input from the register.jsp form
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String first_name = request.getParameter("first_name");
		String surname = request.getParameter("surname");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String specialty = request.getParameter("specialty");
		String infirmary_address = request.getParameter("infirmary_address");
		
		// hash the password
		SecureRandom random = new SecureRandom();
		byte bytes[] = new byte[20];
		random.nextBytes(bytes);		
		String hashed_password = Encryption.getHashMD5(password, random.toString());
		
		long phone_long = Long.parseLong(phone);
						
		Doctor doctor = new Doctor();
		doctor.setUsername(username);
		doctor.setPassword(hashed_password);
		doctor.setFirst_name(first_name);
		doctor.setSurname(surname);
		doctor.setEmail(email);
		doctor.setPhone_number(phone_long);
		doctor.setSpecialty(specialty);
		doctor.setInfirmary_address(infirmary_address);
		
		Users user = new Users();
		user.setUsername(username);
		user.setPassword(hashed_password);
		user.setFirst_name(first_name);
		user.setSurname(surname);
		user.setEmail(email);
		user.setPhone_number(phone_long);
		
		try {
			/*
			 * insert the user in the database by using the Dao.insert() function
			 * the user has to be inserted before the patient because the patient's 'username' field 
			 * is foreign key to the user's primary key 'username'  
			 */
			dao.insert(user);
			String result2 = dao.insert(doctor);
						
			if (result2 == "User registered succesfully!") {
				
				// wait 2 seconds before redirecting to next page
				try {
				    Thread.sleep(5 * 1000);
				} catch (InterruptedException ie) {
				    Thread.currentThread().interrupt();
				}
				response.sendRedirect("login.jsp");
			}
				
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}	
		
	}

}

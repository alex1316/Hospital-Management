package servlets;

import java.io.IOException;
import java.security.SecureRandom;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import basic.Encryption;
import basic.Patient;
import basic.Users;
import database.Dao;

@WebServlet("/PatientRegister")
public class PatientRegister extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	// create an object of the Dao class in order to manage the connection with the database
	private Dao dao;
	
	// when this servlet gets initialized, the dao object gets instantiated
	public void init() {
		dao = new Dao();
	}
       
    public PatientRegister() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.getWriter().append("Served at: ").append(request.getContextPath());
	}
	
	// doPost method used to retrieve the user input from the register.jsp form and then store the user's data in the database
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// request and store the user input from the register.jsp form
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String first_name = request.getParameter("first_name");
		String surname = request.getParameter("surname");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String amka = request.getParameter("amka");
		
		// hash the password
		SecureRandom random = new SecureRandom();
		byte bytes[] = new byte[20];
		random.nextBytes(bytes);		
		String hashed_password = Encryption.getHashMD5(password, random.toString());
		
		// cast string variables to long
		long phone_long = Long.parseLong(phone);
		long amka_long = Long.parseLong(amka);
		
		// create a new patient using the user input from the register.jsp form
		Patient patient = new Patient();
		patient.setUsername(username);
		patient.setPassword(hashed_password);
		patient.setFirst_name(first_name);
		patient.setSurname(surname);
		patient.setEmail(email);
		patient.setPhone_number(phone_long);
		patient.setAmka(amka_long);
		
		// create a new user using the user input from the register.jsp form
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
			String result2 = dao.insert(patient);
						
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

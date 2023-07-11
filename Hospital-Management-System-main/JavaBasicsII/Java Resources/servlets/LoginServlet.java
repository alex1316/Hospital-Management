package servlets;

import java.io.IOException;
import java.security.SecureRandom;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import basic.Admin;
import basic.Doctor;
import basic.Encryption;
import basic.Patient;
import database.Dao;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	// create an object of the Dao class in order to manage the connection with the database
	private Dao dao;
	
	// when this servlet gets initialized, the dao object gets instantiated
	public void init() {
		dao = new Dao();
	}
       
    public LoginServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.getWriter().append("Served at: ").append(request.getContextPath());
	}
	
	// doPost method used in order to manage the login data of the user from the login.jsp form
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// request and store the user input from the login.jsp form
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		// hash the password
		SecureRandom random = new SecureRandom();
		byte bytes[] = new byte[20];
		random.nextBytes(bytes);		
		String hashed_password = Encryption.getHashMD5(password, random.toString());
						
		Patient patient = new Patient();
		patient.setUsername(username);
		patient.setPassword(hashed_password);
		
		Doctor doctor = new Doctor();
		doctor.setUsername(username);
		doctor.setPassword(hashed_password);
		
		Admin admin = new Admin();
		admin.setUsername(username);
		admin.setPassword(hashed_password);
		
		// check if the user is a patient, doctor or admin and redirect him to the corresponding page
		try {

			if (dao.validate(patient)) {
				
				HttpSession session = request.getSession();
				session.setAttribute("username", username);
				
				response.sendRedirect("patientUtils.jsp");
			}
			else if (dao.validate(doctor)) {
				
				HttpSession session = request.getSession();
				session.setAttribute("username", username);
				
				response.sendRedirect("doctorUtils.jsp");				
			}
			else if (dao.validate(admin)) {
				
				HttpSession session = request.getSession();
				session.setAttribute("username", username);
				
				response.sendRedirect("adminUtils.jsp");				
			}	
			else {
				
				// if the validation wasn't successful, redirect to error 401 page
				response.sendRedirect("loginFailed.html");
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	
}

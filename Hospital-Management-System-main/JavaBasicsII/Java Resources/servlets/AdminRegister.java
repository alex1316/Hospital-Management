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
import basic.Admin;
import database.Dao;

@WebServlet("/AdminRegister")
public class AdminRegister extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	// create an object of the Dao class in order to manage the connection with the database
	private Dao dao;
	
	// when this servlet gets initialized, the dao object gets instantiated
	public void init() {
		dao = new Dao();
	}

    public AdminRegister() {
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
		
		// hash the password
		SecureRandom random = new SecureRandom();
		byte bytes[] = new byte[20];
		random.nextBytes(bytes);		
		String hashed_password = Encryption.getHashMD5(password, random.toString());
				
		// create a new admin object
		Admin admin = new Admin();
		admin.setUsername(username);
		admin.setPassword(hashed_password);
		
		// create a new user using the user input from the register.jsp form
		Users user = new Users();
		user.setUsername(username);
		user.setPassword(hashed_password);
		
		try {
			/*
			 * insert the user in the database by using the Dao.insert() function
			 * the user has to be inserted before the patient because the patient's 'username' field 
			 * is foreign key to the user's primary key 'username'  
			 */
			dao.insert(user);
			String result2 = dao.insert(admin);
						
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

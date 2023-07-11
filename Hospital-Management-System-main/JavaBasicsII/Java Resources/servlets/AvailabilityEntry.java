package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import basic.Appointment;
import database.Dao;

@WebServlet("/AvailabilityEntry")
public class AvailabilityEntry extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	// create an object of the Dao class in order to manage the connection with the database
	private Dao dao;
	
	// when this servlet gets initialized, the dao object gets instantiated
	public void init() {
		dao = new Dao();
	}

    public AvailabilityEntry() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.sendRedirect("doctorUtils.jsp");
		
		String first_name = request.getParameter("first_name");
		String surname = request.getParameter("surname");
		String doctor_specialty = request.getParameter("specialty");
		String datetime = request.getParameter("datetime");
		
		String doctor_name = first_name + " " + surname;
		doctor_name = doctor_name.replaceAll("/", "");
		doctor_specialty = doctor_specialty.replaceAll("/", "");
		datetime = datetime.replaceAll("T", " ");
		
		Appointment app = new Appointment(datetime, doctor_name, doctor_specialty);
		
		try {			
			String result = dao.availabilityEntry(app);		
						
			if (result == "Appointment registered succesfully!!") {
				
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

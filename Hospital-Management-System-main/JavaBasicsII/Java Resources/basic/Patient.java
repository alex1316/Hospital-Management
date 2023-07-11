package basic;

//class Patient inherits the attributes of Users class by extending it
public class Patient extends Users {
	
	// class attributes
	private long amka;
	
	// default constructor
	public Patient() {
		super();
	}
	
	// overriding the super class constructor
	public Patient(String username, long amka) {
		super(username);
		this.amka = amka;
	}

	public void register() {
		// user registration
		System.out.println("You have been registered succesfully!");
	}

	public void appointmentsHistory() {
		// shows all the appointments the user has had
		System.out.println("Here are the appointments that you have had: ");
	}

	public void bookAppointment() {
		// gives the patient the ability to book an appointment with a doctor
		System.out.println("Book your appointment easily using this method!");
	}

	public void showAppointments() {
		// displays the appointments a user has arranged
		System.out.println("Here are the appointments you have arranged in the near future: ");
	}

	// getters and setters
	public long getAmka() {
		return amka;
	}

	public void setAmka(long amka) {
		this.amka = amka;
	}

}

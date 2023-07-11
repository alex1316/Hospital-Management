package basic;

public class Doctor extends Users {
	
	// class attributes 
	private String specialty;
	private String infirmary_address;
	
	// class constructor
	public Doctor() {
		super();
	}

	//class methods
	public void availability() {
		// the doctor can determine the days or hours that he is available for patients
		System.out.println("Please determine your availability!");
	}
	
	public void show_appointments() {
		// the doctor can see the appointments he has arranged
		System.out.println("Here are the appointments you have arranged for this month: ");
	}
	

	// getters and setters
	public String getSpecialty() {
		return specialty;
	}

	public void setSpecialty(String specialty) {
		this.specialty = specialty;
	}

	public String getInfirmary_address() {
		return infirmary_address;
	}

	public void setInfirmary_address(String infirmary_address) {
		this.infirmary_address = infirmary_address;
	}

}

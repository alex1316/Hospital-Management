package basic;

//the Appointment class can use objects created by the classes Doctor and Patient
public class Appointment {

	private String datetime;
	private String doctor_name;
	private String patient_name;
	private String doctor_specialty;

	// class constructor
	public Appointment() {
	}

	public Appointment(String datetime, String doctor_name, String doctor_specialty) {
		this.datetime = datetime;
		this.doctor_name = doctor_name;
		this.doctor_specialty = doctor_specialty;
	}

	public String getDatetime() {
		return datetime;
	}

	public void setDatetime(String datetime) {
		this.datetime = datetime;
	}

	public String getDoctor_name() {
		return doctor_name;
	}

	public void setDoctor_name(String doctor_name) {
		this.doctor_name = doctor_name;
	}

	public String getDoctor_specialty() {
		return doctor_specialty;
	}

	public void setDoctor_specialty(String doctor_specialty) {
		this.doctor_specialty = doctor_specialty;
	}

	public String getPatient_name() {
		return patient_name;
	}

	public void setPatient_name(String patient_name) {
		this.patient_name = patient_name;
	}

}

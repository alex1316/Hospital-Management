package basic;

public class Users {
	
	// class attributes
	private String username;
	private String password;
	private String first_name;
	private String surname;
	private String email;
	private long phone_number;
	private static int usersCounter;
	
	// class constructors
	public Users() {
		
	}
	
	public Users(String username){
		this.username = username;
		usersCounter += 1;		
	}
	
	// class methods
	public void login() {
		// user login
		System.out.println("Succesful login!");
	}

	public void logout() {
		// user logout
		System.out.println("Succesful logout!");
	}

	// getters and setters
	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getFirst_name() {
		return first_name;
	}

	public void setFirst_name(String first_name) {
		this.first_name = first_name;
	}

	public String getSurname() {
		return surname;
	}

	public void setSurname(String surname) {
		this.surname = surname;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public long getPhone_number() {
		return phone_number;
	}

	public void setPhone_number(long phone_number) {
		this.phone_number = phone_number;
	}
	
	public static int getUsersCounter() {
		return usersCounter;
	}

	public static void setUsersCounter(int usersCounter) {
		Users.usersCounter = usersCounter;
	}
	
}

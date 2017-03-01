package ChatClasses;

public class User {

	private String username;
	private String password;
	private int freeStatus;

	public User(String username, String password, int freeStatus) {

		this.username = username;
		this.password = password;
		this.freeStatus = freeStatus;

	}

	public String getUsername() {
		return username;
	}

	public String getPassword() {
		return password;
	}

	public int getFreeStatus() {
		return freeStatus;
	}

	public void setFreeStatus(int freeStatus) {
		this.freeStatus = freeStatus;
	}

}

package user;

public class User {
	private String userID;
	private String userPassword;
	private String userPasswordcheck;
	private String userName;
	private String userEmail;
	
	public User() {
		
	}
	
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	
	public String getUserPassword() {
		return userPassword;
	}
	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}
	
	public String getUserPasswordcheck() { // 비밀번호 확인
		return userPasswordcheck;
	}
	public void setUserPasswordcheck(String userPasswordcheck) {
		this.userPasswordcheck = userPasswordcheck;
	}
	
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	
	
}

package days15.guestbook.model;


public class Message {

	private int memberid;
	private String guestName;
	private String password;
	private String message;
	
	
	public int getMemberid() {
		return memberid;
	}

	public void setMemberid(int memberid) {
		this.memberid = memberid;
	}

	public String getGuestName() {
		return guestName;
	}

	public void setGuestName(String guestName) {
		this.guestName = guestName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public boolean hasPassword() {
		return password != null && !password.isEmpty();
	}

	public boolean matchPassword(String pwd) {
		return password != null && password.equals(pwd);
	}
}

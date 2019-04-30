package days05;

import java.sql.Date;  

public class MyBoardDTO {	
	private int seq;	
	private String name;	
	private String email;
	private String password;	
	private String subject;	   
	private String content;	 
	private char tag;	 
	private int cnt;	
	private String userIp;
	private Date regdate;  
	
	public MyBoardDTO() {}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public char getTag() {
		return tag;
	}

	public void setTag(char tag) {
		this.tag = tag;
	}

	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt = cnt;
	}

	public String getUserIp() {
		return userIp;
	}

	public void setUserIp(String userIp) {
		this.userIp = userIp;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	@Override
	public String toString() { 
		return String.format("%d\t%s\t%s\t%tF"
				, seq, subject, name, regdate );
	}
	
	

}











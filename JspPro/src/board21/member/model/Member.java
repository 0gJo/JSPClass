package board21.member.model;

import java.util.Date;

public class Member {
	
	private String memberid;
	private String name;
	private String password;
	private Date regDate;
	
	
	public Member() {}
	
	
	public Member(String memberid, String name, String password, Date regDate) {
		this.memberid = memberid;
		this.name = name;
		this.password = password;
		this.regDate = regDate;
	}


	public String getMemberid() {
		return memberid;
	}


	public String getName() {
		return name;
	}


	public String getPassword() {
		return password;
	}


	public Date getRegDate() {
		return regDate;
	}
	
	public boolean matchPassword(String pwd) {
		return password.equals(pwd);
		
	}
	
	public void changePassword(String newPwd) { this.password = newPwd;}


	public void setMemberid(String memberid) {
		this.memberid = memberid;
	}


	public void setName(String name) {
		this.name = name;
	}


	public void setPassword(String password) {
		this.password = password;
	}


	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	
	

}

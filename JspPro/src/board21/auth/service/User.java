package board21.auth.service;

public class User {
	// 인증에 성공한 사용자 객체
	private String id;
	private String name;
	
	
	public User(String id, String name) {
		super();
		this.id = id;
		this.name = name;
	}
	
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	
	
	
	
}

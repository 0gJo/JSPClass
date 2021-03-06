package board21.member.service;

import java.util.Map;

public class JoinRequest {

	private String id ;
	private String name;
	private String password;
	private String confirmPassword;
	
	
	
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
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getConfirmPassword() {
		return confirmPassword;
	}
	public void setConfirmPassword(String confirmPassword) {
		this.confirmPassword = confirmPassword;
	}
	
	public boolean isPasswordEqualToConfirm() { return password!=null && password.equals(confirmPassword);}
	
	
	public void Validate(Map<String,Boolean> errors) {
		//JoinRequest에 문제가 없는지 검사
		// 입력안한것 있는지 + 비밀번호가 confirm비밀번호와 match인지 
		
		
		
		checkEmpty(errors, id, "id");
		checkEmpty(errors, password, "password");
		checkEmpty(errors, name, "name");
		checkEmpty(errors, confirmPassword, "confirmPassword");
		
		if (!errors.containsKey("confirmPassword")) {
			
			if (!isPasswordEqualToConfirm()) {
				errors.put("notMatch", Boolean.TRUE);
			}
			
		}
		
	}
	
	private void checkEmpty(Map<String, Boolean> errors, String value, String fieldName) {
		if (value == null || value.isEmpty()) {
			errors.put(fieldName, Boolean.TRUE);
		}
		
	}
	
	
	
}

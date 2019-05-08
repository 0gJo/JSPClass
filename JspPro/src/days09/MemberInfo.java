package days09;

public class MemberInfo {
	private String id;
	private String name;
	private String email;
	private boolean male;
	private int age;
	private String grade;
	
	public MemberInfo() {}
	
	
	
	public MemberInfo(String id, String name, String email, boolean male, int age, String grade) {
		super();
		this.id = id;
		this.name = name;
		this.email = email;
		this.male = male;
		this.age = age;
		this.grade = grade;
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
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public boolean isMale() {
		return male;
	}
	public void setMale(boolean male) {
		this.male = male;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	
	
	
}

package days02;

public class DeptDTO {
	// fields
	private int deptno;
	private String dname;
	private String loc;
	private int numberOfEmp;
	
	public int getNumberOfEmp() {
		return numberOfEmp;
	}

	public void setNumberOfEmp(int numberOfEmp) {
		this.numberOfEmp = numberOfEmp;
	}

	// constructor
	public DeptDTO() {
		super(); 
	}
	
	// getter, setter
	public int getDeptno() {
		return deptno;
	}
	public void setDeptno(int deptno) {
		this.deptno = deptno;
	}
	public String getDname() {
		return dname;
	}
	public void setDname(String dname) {
		this.dname = dname;
	}
	public String getLoc() {
		return loc;
	}
	public void setLoc(String loc) {
		this.loc = loc;
	}

	@Override
	public String toString() { 
		return String.format("%d\t%s\t%s"
				,deptno, dname, loc);
	}  
	 
}


// DTO, DAO, VO 개념 정리











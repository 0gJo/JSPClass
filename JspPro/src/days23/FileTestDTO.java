package days23;

public class FileTestDTO {
	// fields
	private int num;
	private String subject;
	private String filesystemname;
	private String originalfilename;
	private long filelength;
	
	// constructors
	public FileTestDTO() {}
	public FileTestDTO(String subject, String filesystemname, String originalfilename, int filelength) {		
		this.subject = subject;
		this.filesystemname = filesystemname;
		this.originalfilename = originalfilename;
		this.filelength = filelength;
	}
	
	// getter, setter
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getSubject() {
		return subject;
	}
	
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getFilesystemname() {
		return filesystemname;
	}
	public void setFilesystemname(String filesystemname) {
		this.filesystemname = filesystemname;
	}
	public String getOriginalfilename() {
		return originalfilename;
	}
	public void setOriginalfilename(String originalfilename) {
		this.originalfilename = originalfilename;
	}
	public long getFilelength() {
		return filelength;
	}
	public void setFilelength(long filelength) {
		this.filelength = filelength;
	} 
}

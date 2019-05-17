package days16.replyboard.model;

import java.util.Date;

public class ReplyBoardDTO {
	// fields
		private int num;
		private String writer;
		private String email;
		private String subject;
		private String pass;
		private int readcount;
		private Date regdate;
		private String content;
		private String ip;
		private int ref;
		private int step;
		private int depth;	
		// 새로 게시된 글앞에 new 이미지 붙이기 위한 필드
		private boolean newImg;
		
		// getter, setter
		public int getNum() {
			return num;
		}
		public void setNum(int num) {
			this.num = num;
		}
		public String getWriter() {
			return writer;
		}
		public void setWriter(String writer) {
			this.writer = writer;
		}
		public String getEmail() {
			return email;
		}
		public void setEmail(String email) {
			this.email = email;
		}
		public String getSubject() {
			return subject;
		}
		public void setSubject(String subject) {
			this.subject = subject;
		}
		public String getPass() {
			return pass;
		}
		public void setPass(String pass) {
			this.pass = pass;
		}
		public int getReadcount() {
			return readcount;
		}
		public void setReadcount(int readcount) {
			this.readcount = readcount;
		}
		public Date getRegdate() {
			return regdate;
		}
		public void setRegdate(Date regdate) {
			this.regdate = regdate;
		}
		public String getContent() {
			return content;
		}
		public void setContent(String content) {
			this.content = content;
		}
		public String getIp() {
			return ip;
		}
		public void setIp(String ip) {
			this.ip = ip;
		}
		public int getRef() {
			return ref;
		}
		public void setRef(int ref) {
			this.ref = ref;
		}
		public int getStep() {
			return step;
		}
		public void setStep(int step) {
			this.step = step;
		}
		public int getDepth() {
			return depth;
		}
		public void setDepth(int depth) {
			this.depth = depth;
		}
		public boolean isNewImg() {
			return newImg;
		}
		public void setNewImg(boolean newImg) {
			this.newImg = newImg;
		} 
}

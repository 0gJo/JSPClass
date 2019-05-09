package days10.mvc.board;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.DBConn;

import days05.MyBoardDTO;
import days10.mvc.command.CommandHandler;

public class RegistHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws IOException {

		System.out.println(request.getMethod());
		
		String result = null;
		
		if (request.getMethod().equals("POST")) {
			
			request.setCharacterEncoding("UTF-8");

			String name = request.getParameter("name");
					String password = request.getParameter("password");
					String email = request.getParameter("email");
					String subject = request.getParameter("subject");
					String content = request.getParameter("content");
					String tag = request.getParameter("tag");

					// DTO
					MyBoardDTO boardDto = new MyBoardDTO();
			boardDto.setName(name);
			boardDto.setPassword(password);
			boardDto.setEmail(email);
			boardDto.setSubject(subject);
			boardDto.setContent(content);
			boardDto.setTag(tag.charAt(0));
			
			// 
			Connection con = null;
			PreparedStatement pstmt = null;
			int resultCnt = 0;
			try {
				// 1
				String sql="insert into tbl_myboard " +
						" ( seq, name, password, email, subject, content, tag, userip) "+
						" values "+
						" ( seq_myboard.nextval,?,?,?,?,?,?,'211.63.89.163')";		

				con = DBConn.getConnection();

				pstmt = con.prepareStatement(sql);

				pstmt.setString(1, boardDto.getName());
				pstmt.setString(2, boardDto.getPassword());
				pstmt.setString(3, boardDto.getEmail());
				pstmt.setString(4, boardDto.getSubject());
				pstmt.setString(5, boardDto.getContent());
				pstmt.setString(6, boardDto.getTag()+"");
				
				resultCnt = pstmt.executeUpdate();		
				System.out.println("ResultCnt :"+resultCnt);
				pstmt.close();
				DBConn.close();
				
			} catch (Exception e) {  // 
				e.printStackTrace();
			} 

			// 내코딩
			/* String location = "/JspPro/board/list.do";
			result = location;  */			
	
			String location = "/JspPro/board/list";
			if (resultCnt == 1) {	 location+=".do";	}
			response.sendRedirect(location);
			
			return null;
			
		}else if (request.getMethod().equals("GET")) {
			
			return  "/board/regist";
			
		}else {
			
			return null;
		}
		
		
		
	}

}

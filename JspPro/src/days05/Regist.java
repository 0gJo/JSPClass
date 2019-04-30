package days05;


import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.DBConn;

public class Regist  extends HttpServlet {



	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		System.out.println("Register.doGet");

		String path = "/days05/regist.jsp";
		//response.sendRedirect(location); board  ...요청 url 사용을 위해 포워딩 (리다이렉트 대신)
		RequestDispatcher dispatcher=	request.getRequestDispatcher(path);
		dispatcher.forward(request, response);

	}




	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doPost");
		//한글 깨짐 처리 (POST 방식)
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

		// 글목록페이지로 이동


		// Redirect
		// /board/list GET 요청 -> List.java -> days05/list.jsp 응답
		String location = "/JspPro/board/list";
		if (resultCnt == 1) {	 location+="?regist=ok";	}
		response.sendRedirect(location);


	}




	@Override
	public void init() throws ServletException {
		System.out.println("RegistServlet() 호출 ");
		super.init();
	}







}

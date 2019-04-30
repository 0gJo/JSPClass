package days05;


import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.DBConn;

public class Edit  extends HttpServlet {



	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		System.out.println("Edit.doGet");
		//seq -> dto 
		// 뿌리기 + 수정
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		MyBoardDTO dto = null;

		int seq = Integer.parseInt(request.getParameter("seq"));
		
		try {
			con = DBConn.getConnection();

			// 글번호(seq) 해당 게시글 가져오기
		String	 sql = 
					   " select tag, name, email, subject, content, cnt, regdate , password "
			        +" from tbl_myboard " 
					+" where seq = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, seq);

			rs = pstmt.executeQuery();
			if( rs.next() ) {
					dto = new MyBoardDTO();
					dto.setSeq(seq);
					dto.setName( 	rs.getString("name") );
					dto.setEmail( 	rs.getString("email") );
					dto.setSubject( rs.getString("subject") );
					dto.setContent( rs.getString("content") );
					dto.setCnt( 		 rs.getInt("cnt") );
					dto.setRegdate( rs.getDate("regdate") ); 
					dto.setTag(rs.getString("tag").charAt(0));
					
					
					
					dto.setPassword(rs.getString("password"));
			}

	
			
			request.setAttribute("dto", dto);
			rs.close();
			pstmt.close();
			DBConn.close();
			
		} catch (Exception e) {  // 
			e.printStackTrace();
		} 
		

		String path = "/days05/edit.jsp";
		//response.sendRedirect(location); board  ...요청 url 사용을 위해 포워딩 (리다이렉트 대신)
		RequestDispatcher dispatcher=	request.getRequestDispatcher(path);
		dispatcher.forward(request, response);

	}




	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Edit.doPost");
		//한글 깨짐 처리 (POST 방식)
		request.setCharacterEncoding("UTF-8");

				String name = request.getParameter("name");
				String password = request.getParameter("password");
				String email = request.getParameter("email");
				String subject = request.getParameter("subject");
				String content = request.getParameter("content");
				String tag = request.getParameter("tag");
				
				int seq = Integer.parseInt(request.getParameter("seq"));
		// 
		Connection con = null;
		PreparedStatement pstmt = null;
		int resultCnt = 0;
		try {
			// 1
			String sql =" update tbl_myboard " +
				       " set name=?, email=?, subject=?, content=? , tag=? "+
				       " where password=? and  seq = ? ";

			con = DBConn.getConnection();

			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, name);
			pstmt.setString(2, email);
			pstmt.setString(3, subject);
			pstmt.setString(4, content);
			pstmt.setString(5, tag);
			pstmt.setString(6, password);
			pstmt.setInt(7, seq );

			
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
		System.out.println("EditServlet() 호출 ");
		super.init();
	}







}

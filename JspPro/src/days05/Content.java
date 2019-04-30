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

public class Content  extends HttpServlet {



	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		System.out.println("Content.doGet/doPost");

		  int currentPage =1 ; 
          int numberPerPage =15 ;
		
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		MyBoardDTO dto = null;

		int seq = Integer.parseInt(request.getParameter("seq"));
		
		try {
			con = DBConn.getConnection();
			// 조회수 증가
			String sql ="update tbl_myboard		 "
					+ "set  cnt = cnt + 1		 "
					+ "where seq = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, seq);
			int resultCnt = pstmt.executeUpdate();
			
			pstmt.close();
			
			
			// 글번호(seq) 해당 게시글 가져오기
			 sql = 
					   " select name, email, subject, content, cnt, regdate , password "
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
					//
					dto.setPassword(rs.getString("password"));
			}

	
			
			request.setAttribute("dto", dto);
			rs.close();
			pstmt.close();
			DBConn.close();
			
		} catch (Exception e) {  // 
			e.printStackTrace();
		} 

		// 글목록페이지로 이동


		// Redirect
		// /board/list GET 요청 -> List.java -> days05/list.jsp 응답
		
		
		
		
		String path = "/days05/content.jsp";
		//response.sendRedirect(location); board  ...요청 url 사용을 위해 포워딩 (리다이렉트 대신)
		RequestDispatcher dispatcher=	request.getRequestDispatcher(path);
		dispatcher.forward(request, response);

	}




	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);

	}




	@Override
	public void init() throws ServletException {
		System.out.println("RegistServlet() 호출 ");
		super.init();
	}







}

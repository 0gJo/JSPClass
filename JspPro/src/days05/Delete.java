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

public class Delete  extends HttpServlet {



	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		///삭제하시겠습니까??
		System.out.println("Delete.doGet");

		String path = "/days05/delete.jsp";
		//response.sendRedirect(location); board  ...요청 url 사용을 위해 포워딩 (리다이렉트 대신)
		RequestDispatcher dispatcher=	request.getRequestDispatcher(path);
		dispatcher.forward(request, response);

	}




	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doPost");
		///삭제코딩
		//한글 깨짐 처리 (POST 방식)
		request.setCharacterEncoding("UTF-8");

	
		String seq = request.getParameter("seq");
		/////
		String p_password = request.getParameter("password");
		
		Connection con = null;
		PreparedStatement pstmt = null;
		int resultCnt = 0;
		try {
			// seq의 password가 동일한지 확인후 삭제.. 
			String sql = "select password from tbl_myboard where seq = ? " ;
			
			con = DBConn.getConnection();
			 pstmt = con.prepareStatement(sql);
			 
			 pstmt.setString(1, seq);
			 
			 ResultSet rs = pstmt.executeQuery();
			
			rs.next();
			String o_password =  rs.getString("password");
			rs.close();
			pstmt.close();
			
			if (o_password.equals(p_password)) {
				 sql = "delete from tbl_myboard "
							+ " where seq = ?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, seq);
				
					resultCnt = pstmt.executeUpdate();		
					System.out.println("ResultCnt :"+resultCnt);
					pstmt.close();
			}else {
				
			/*	String location = "/JspPro/board/delete";
				location+="?delete=fail";
				response.sendRedirect(location);*/
				
				request.setAttribute("error", "비밀번호가 틀립니다");
				
				doGet(request, response);
				
				return;
				
			}
			
			
			DBConn.close();
		} catch (Exception e) {  // 
			e.printStackTrace();
		} 

		// 글목록페이지로 이동


		// Redirect
		// /board/list GET 요청 -> List.java -> days05/list.jsp 응답
		String location = "/JspPro/board/list";
		if (resultCnt == 1) {	 location+="?delete=ok";	}
		response.sendRedirect(location);


	}




	@Override
	public void init() throws ServletException {
		System.out.println("RegistServlet() 호출 ");
		super.init();
	}







}

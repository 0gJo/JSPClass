package days10.mvc.board;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.DBConn;

import days05.MyBoardDTO;
import days10.mvc.command.CommandHandler;

public class ListHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws IOException {
		System.out.println("Register.doGet/doPost");

		int currentPage =1 ; 
        int numberPerPage =15 ;
		
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<MyBoardDTO> list = null;

		try {
			// 1
			String sql = " select *                                                     ";
		    sql+=     " from (                                                       ";
			sql+=   "     select rownum no, t.*                                    ";
			sql+=   "     from (                                                   ";
			sql+=   "         select  seq, name, email, subject, cnt, regdate      ";
			sql+=   "         from tbl_myboard                                     ";
			sql+=   "         order by seq desc                                    ";
			sql+=   "     ) t                                                      ";
			sql+=   " ) b                                                          ";
			sql+=   " where b.no between ? and ?                  ";

			con = DBConn.getConnection();
			
			int start = (currentPage-1)*numberPerPage+1;
			int end   = currentPage*numberPerPage ;
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			rs =	pstmt.executeQuery();	
		
			if (rs.next()) {
				list = new ArrayList<>();
				MyBoardDTO dto = null;
				do {
					dto = new MyBoardDTO();
					// seq, name, email, subject, cnt, regdate
						dto.setSeq( rs.getInt("seq") );
						dto.setName(rs.getString("name"));
						dto.setEmail(rs.getString("email"));
						dto.setSubject(rs.getString("subject"));
						dto.setCnt(rs.getInt("cnt"));
						dto.setRegdate(rs.getDate("regdate"));
					list.add(dto);  // 
				} while (rs.next());
			}
			
			request.setAttribute("list", list);
			rs.close();
			pstmt.close();
			
			
			
			
			
			DBConn.close();
			
		} catch (Exception e) {  // 
			e.printStackTrace();
		} 

		// 글목록페이지로 이동


		// Redirect
		// /board/list GET 요청 -> List.java -> days05/list.jsp 응답
		
		
		
		
		 
		return "/board/list";
	}

}

package days03.exercise;

import java.io.IOException;
import java.nio.file.Path;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.DBConn;

import days02.DeptDTO;

// 사원정보 검색 페이지 요청시 실행 서블릿
public class DeptServlet extends HttpServlet{

	@Override
	public void init() throws ServletException {
		System.out.println("DeptServlet 호출");
		super.init();
	}

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//현재 DB에 있는 dept 부서 정보가져오기 (deptname, deptno)
		//DB 연결
		Connection conn = DBConn.getConnection();
		// 수행할 sql문
		StringBuffer sb = new StringBuffer();
		sb.append("select deptno, dname");
		sb.append(" from dept");
		
		ArrayList list = null;
		try {
			PreparedStatement pstmt =  conn.prepareStatement(sb.toString());
			ResultSet rs = pstmt.executeQuery();
			
			if (rs.next()) {
				 list = new ArrayList<>();
				
				do {
				 int deptno = rs.getInt("deptno");
				 String dname = rs.getString("dname");
				 
				 System.out.printf("%d %s\n", deptno,dname);
				 
				 DeptDTO dto = new DeptDTO();
				 
				 dto.setDeptno(deptno);
				 dto.setDname(dname);
				 
				 list.add(dto);
				 
				} while (rs.next());
				
			}else {
				
				System.out.println("결과없음");
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		// deptno, dname 담은 list를 empInfo로 forwarding + 전달
		
		request.setAttribute("list", list);
		
		
	RequestDispatcher dispatcher = 	request.getRequestDispatcher("/days03/exercise/empInfo.jsp");
	
	dispatcher.forward(request, response);
	
	}
	
	
}

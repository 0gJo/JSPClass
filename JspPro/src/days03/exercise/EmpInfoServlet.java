package days03.exercise;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.spi.DirStateFactory.Result;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.DBConn;

import days03.EmpDTO;

public class EmpInfoServlet extends HttpServlet {
	
	
	

	@Override
	public void init() throws ServletException {
		System.out.println("EmpInfoServlet 호출");
		super.init();
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 요청받은 deptno 정보를 이용해, 해당 부서의 사원들 정보를 담은 dto list를 View인 empInfo_ok.jsp에 전달
		// deptno parameter 받기
		
		int deptno = Integer.parseInt(request.getParameter("dept")) ;
		
		// DB에서 해당정보 SELECT
		
		Connection conn = DBConn.getConnection();
		
	 	StringBuffer sb= new StringBuffer();
	 	
	 	sb.append("select empno, ename, job  ");
	 	sb.append(" from emp ");
	 	sb.append(" where deptno = ? ");
		
	 	String sql = sb.toString();
	 	
	try {
		PreparedStatement pstmt = 	conn.prepareStatement(sql);

		pstmt.setInt(1, deptno);
		
		ResultSet rs = pstmt.executeQuery();
		
		ArrayList<EmpDTO> list = null;
		
		if (rs.next()) {
			 list = new ArrayList<>();
			do {
				
				int empno = rs.getInt("empno");
				String ename = rs.getString("ename");
				String job = rs.getString("job");
				
				System.out.printf("%d %s %s", empno,ename,job);
				
				EmpDTO dto = new EmpDTO();
				
				dto.setDeptno(deptno);
				dto.setEmpno(empno);
				dto.setEname(ename);
				dto.setJob(job);
				
				list.add(dto);
				
			} while (rs.next());
			
		}else {
			// 해답부서 사원없음
			System.out.println(list);
		}
		
		
		
		request.setAttribute("list", list );
		
		//forwarding
		RequestDispatcher dispatcher =  request.getRequestDispatcher("/days03/exercise/empInfo_ok.jsp");
		dispatcher.forward(request, response);
		
		
		
	} catch (SQLException e) {
		e.printStackTrace();
	}
	
	
	
		
		
	}

	
}

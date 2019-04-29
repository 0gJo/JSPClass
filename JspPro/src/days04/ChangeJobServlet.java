package days04;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.DBConn;

public class ChangeJobServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String job = request.getParameter("job");
		int empno = Integer.parseInt( request.getParameter("empno"));
		//선택한 job 으로 DB에 변경.. 
		
		/*StringBuffer sb = new StringBuffer();
		
		sb.append(" update tbl_emp ");
		sb.append(" set job = ?  ");
		sb.append(" where empno = ? ");*/
		
/*		String sql = sb.toString();*/	
		
		
		String sql = " update tbl_emp "
				+" set job =' " +job +"' where empno =" + empno ;
	
		
		Connection conn = DBConn.getConnection();
		
	 try {
		PreparedStatement pstmt =	conn.prepareStatement(sql);
		
	/*	pstmt.setString(1, job);
		pstmt.setInt(2, empno);*/

		// 업데이트 
		pstmt.executeUpdate(sql);
		
		String[] depts =request.getParameterValues("dept");
		
		String param ="";
		
		for (int i = 0; i < depts.length; i++) {
			
			param += i==0?"dept=":"&dept=";
			param +=depts[i];
		}
		
		String location = "/JspPro/employees.do?"+param;
		
		System.out.println(location);
		
		response.sendRedirect(location);
		
		
	} catch (SQLException e) {
		e.printStackTrace();
	}
	
	 
	 
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doPost(req, resp);
	}

	@Override
	public void init() throws ServletException {
		System.out.println("ChangeJobServlet() 호출");
		super.init();
	}

	
	
	
}

package days03;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.DBConn;

public class Ex04_Emp extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//DB에서  select 후 forwarding
		//System.out.println("test");
		String deptno = request.getParameter("deptno");
	    
		String sql = "select empno, ename, job, hiredate, deptno from emp";
		if( deptno != null )    sql +=" where deptno = " + deptno;
		
		Connection con = null;
		Statement stmtEmp;
		ResultSet rsEmp;
		ArrayList<EmpDTO> list = null;//////////////////// 다 담고 setAtrribute해줘야
		
		try {
			con = DBConn.getConnection();
			stmtEmp = con.createStatement();
			rsEmp = stmtEmp.executeQuery(sql);
			if( rsEmp.next()){
				list = new ArrayList<>();
				do{
					// empno, ename, job, hiredate, deptno
					EmpDTO dto = new EmpDTO();
						dto.setEmpno( rsEmp.getInt("empno") );
						dto.setDeptno( rsEmp.getInt("deptno") );
						dto.setEname( rsEmp.getString("ename") );
						dto.setHiredate(rsEmp.getDate("hiredate"));
						dto.setJob( rsEmp.getString("job"));
					
					list.add(dto);
				}while(rsEmp.next());
			} 
			
			rsEmp.close();
			stmtEmp.close();
			DBConn.close();
		} catch (Exception e) {  // 
			e.printStackTrace();
		} 
		
		request.setAttribute("list", list);///////////////////////////////////////////중요
		
		
		
		//forwarding
		//String path ="ex04_ok.jsp";
		String path ="ex04.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(path);
	
		dispatcher.forward(request, response); //setAttribute한 request를 path로 돌려줌..
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		super.doGet(request, response);
	}

	
	
}

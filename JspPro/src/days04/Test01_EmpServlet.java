package days04;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.DBConn;

import days02.DeptDTO;

public class Test01_EmpServlet  extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("test");
		
	    System.out.println(request.getParameter("dept"));
		
	    String dept = request.getParameter("dept");
	    
	  String[] depts =  request.getParameterValues("dept");
	  
	  //request.setAttribute("depts", depts);
	    
		//첫번째  요청.. DB에서 dept table가져와서 정보뿌리기 (deptno, dname)
	    
	    
	    
	
	    
		Connection  conn = DBConn.getConnection();
		
		
		String sql3= "select distinct job from emp";
		
		ArrayList<String> jlist = null;
		
		try {
			PreparedStatement pstmt0 = 	conn.prepareStatement(sql3);
			
			ResultSet  rs3 = pstmt0.executeQuery();
			
			jlist = new ArrayList<>();
			
			if (rs3.next()) {
				
				do {
					
					String job = rs3.getString("job");
					
					
					jlist.add(job);
					
					
				} while (rs3.next());
			}
				
			}catch (Exception e) {
				
			}
			
			
			//dlist에 담은다음 request에 설정한다음 forwarding
			
			request.setAttribute("jlist", jlist);
			
			
		
		
		
		
		
		
		String sql = "select deptno, dname from dept ";
		
		try {
			PreparedStatement pstmt = 	conn.prepareStatement(sql);
			
			ResultSet  rs = pstmt.executeQuery();
			
			ArrayList<DeptDTO> dlist = new ArrayList<>();
			
			if (rs.next()) {
				
				do {
					int deptno = rs.getInt("deptno");
					String dname = rs.getString("dname");
					
					DeptDTO deptDto = new DeptDTO();
					
					deptDto.setDeptno(deptno);
					deptDto.setDname(dname);
					
					dlist.add(deptDto);
					
					
				} while (rs.next());
				
			}
			
			
			//dlist에 담은다음 request에 설정한다음 forwarding
			
			request.setAttribute("dlist", dlist);
			
		/*	ArrayList<EmpDTO> elist = null;*/
			
			ArrayList<DeptEmpDTO> elist = null;
			////// dept가 parameter로 왔을 경우  해당정보함께 setAtrribute
			
			String sql2 ="";
			
			if (dept !=null) {
				
				sql2="select d.deptno, d.dname,  e.empno, e.ename, e.mgr , job, " 
					     +" hiredate,  sal, comm , sal+nvl(comm, 0) pay " 
							+ "from  tbl_emp e join dept d on e.deptno = d.deptno where d.deptno in (";
				
				for (int i = 0; i < depts.length; i++) {
					sql2+=depts[i];
					sql2+=	i==depts.length-1?")":",";
				}
				
			}else {   //dept == null
				
				sql2 = "select d.deptno, d.dname,  e.empno, e.ename, e.mgr , job, " 
					     +" hiredate,  sal, comm , sal+nvl(comm, 0) pay " 
							+ "from tbl_emp e join dept d on e.deptno = d.deptno ";
			}
				
		
			elist = new ArrayList<>();
				
				
		/*	String sql2 ="select d.deptno, d.dname,  e.empno, e.ename, e.mgr , job, " 
				     +" hiredate,  sal, comm , sal+nvl(comm, 0) pay " 
					+ "from  emp e join dept d on e.deptno = d.deptno where d.deptno in (" ;*/
		
		/*	for (int i = 0; i < depts.length; i++) {
				sql2+=depts[i];
				sql2+=	i==depts.length-1?")":",";
			}*/
			
			System.out.println(sql2);
			
		 Statement 	stmt2 =	conn.createStatement();
				
		
			
			ResultSet rs2 = stmt2.executeQuery(sql2);
			
			
		
			if (rs2.next()) {
				
				do {
					
					DeptEmpDTO edto = new DeptEmpDTO(); 
					edto.setEmpno( rs2.getInt("empno") );
					edto.setEname( rs2.getString("ename") );
					edto.setMgr( rs2.getInt("mgr") );
					edto.setJob( rs2.getString("job"));
					edto.setHiredate(rs2.getDate("hiredate"));
					edto.setSal(rs2.getDouble("sal"));
					edto.setComm(rs2.getDouble("comm"));
					edto.setPay(rs2.getDouble("pay"));
					
					edto.setDeptno( rs2.getInt("deptno") );
					edto.setDname( rs2.getString("dname") );	
					
					elist.add(edto);
				} while (rs2.next());
				
			}

			

			
			request.setAttribute("elist", elist);

			RequestDispatcher dispatcher =	request.getRequestDispatcher("/days04/test01.jsp");
			
			dispatcher.forward(request, response);
			
			
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
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.service(req, resp);
	}

	@Override
	public void init() throws ServletException {
		System.out.println("Servlet() 호출 ");
		super.init();
	}

	
	
	
	
	
	
}

package days03;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.DBConn;

import days02.DeptDTO;

/**
 * Servlet implementation class Ex02_DeptInfo
 */
@WebServlet("/days03/ex02_info.do")
public class Ex02_DeptInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Ex02_DeptInfo() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// DB연결
		Connection conn = DBConn.getConnection();

		// 수행할 SQL문	
		StringBuffer sb = new StringBuffer();
		sb.append("select deptno, dname, loc ");
		sb.append("from dept");

		String sql = sb.toString();

		// 수행할 statement 생성

	

		try {
			
			PreparedStatement pstmt =  conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();

			int deptno ;
			String dname, loc;

			ArrayList<DeptDTO> list = new ArrayList();
			
			while(rs.next()){
			// 정보가져오기
				deptno = rs.getInt("deptno");
				dname = rs.getString("dname");
				loc = rs.getString("loc");
				
				// dto에 담기
				DeptDTO dto = new DeptDTO();
				
				dto.setDeptno(deptno);
				dto.setDname(dname);
				dto.setLoc(loc);

				// arrayList에 담기
				list.add(dto);
				
				request.setAttribute("list", list);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}



		String path = "ex02_info_ok.jsp";

		//request.setAttribute("id", "0g");//저장 , request가 유지되는 동안 저장되는 값 : requestScope
										// parameter 와 다름

		RequestDispatcher dispatcher =  request.getRequestDispatcher(path) ;

		dispatcher.forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

<%@page import="java.util.Iterator"%>
<%@page import="days02.DeptDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page import="com.util.DBConn"%>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	StringBuffer sb = new StringBuffer();
		sb.append("select deptno, dname, loc  ");
		sb.append("from dept ");
	/* String sql = "select * ";
	sql += "from dept" */

	ArrayList<DeptDTO> list = new ArrayList<>();
	
	Connection conn =  DBConn.getConnection();
	
	try {
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(sb.toString());
		
		int deptno ;
		String dname, loc;
		
		while ( rs.next()   ) {
			 deptno = rs.getInt("deptno");
			 dname = rs.getString("dname");
			 loc = rs.getString("loc");
			 
			 DeptDTO dto = new DeptDTO();
				 dto.setDeptno(deptno);
				 dto.setDname(dname);
				 dto.setLoc(loc);
			 
			 list.add(dto);
			 
		} // while
		
		rs.close();     // (기억)
		stmt.close(); // (기억)
	} catch (SQLException e) {
		e.printStackTrace();
	}
	// 4
	DBConn.close();
	
	request.setAttribute("list", list);  // 한 줄 추가
	
    String path = "ex02_info_ok.jsp";
    //request.setAttribute("id", "kenik"); // 저장  requestScope
    RequestDispatcher dispatcher = request.getRequestDispatcher(path);
    dispatcher.forward(request, response);

%>













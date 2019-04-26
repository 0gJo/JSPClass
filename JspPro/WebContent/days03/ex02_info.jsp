<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="days02.DeptDTO"%>
<%@page import="java.sql.*"%>
<%@page import="com.util.DBConn"%>
<%
// DB연결
Connection conn = DBConn.getConnection();

// 수행할 SQL문	
StringBuffer sb = new StringBuffer();
sb.append("select deptno, dname, loc ");
sb.append("from dept");

String sql = sb.toString();

// 수행할 statement 생성

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
	
}

request.setAttribute("list", list);


String path = "ex02_info_ok.jsp";

//request.setAttribute("id", "0g");//저장 , request가 유지되는 동안 저장되는 값 : requestScope
								// parameter 와 다름

RequestDispatcher dispatcher =  request.getRequestDispatcher(path) ;

dispatcher.forward(request, response);



%>
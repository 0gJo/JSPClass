<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="days02.DeptDTO"%>
<%@page import="java.sql.*"%>
<%@page import="com.util.DBConn"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>jsp/servelet class - 0gJo 2019. 4. 25.-오후 5:15:26</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="">
<script>
   $(document).ready(function (){
	 
   });
</script>

</head>
<body>
<h3>DB에서 데이터 불러와서 option 태그 만들기 + DTO 이용</h3>

<!-- 
10 ACCOUNTING	NEW YORK
50 영업부	서울
40 OPERATIONS	BOSTON
20 RESEARCH	DALLAS
30 SALES	CHICAGO
 -->
<select>
<%

Iterator<DeptDTO> ir =   list.iterator();
while (ir.hasNext()) {
	DeptDTO dto =  ir.next();
%>
	
<option value="<%=dto.getDeptno() %>" ><%=dto.getDname() %> </option>	
	
<%	
}

%>
</select>




</body>
</html>
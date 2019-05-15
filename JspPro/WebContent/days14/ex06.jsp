<%@page import="java.util.ArrayList"%>
<%@page import="com.util.DBConn"%>
<%@page import="days03.EmpDTO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<%
String sql_emp = "select * from emp ";

Connection con = null;
PreparedStatement pstmt = null;
ResultSet rs_emp = null;

try {
	con = DBConn.getConnection();
	pstmt = con.prepareStatement(sql_emp); 
	rs_emp = pstmt.executeQuery();

	EmpDTO dto = null;
	
	ArrayList<EmpDTO> list = new ArrayList<>();
	
	while(rs_emp.next()) {
		dto = new EmpDTO();
			dto.setComm(rs_emp.getDouble("comm"));
			dto.setDeptno(rs_emp.getInt("deptno"));
			dto.setEmpno(rs_emp.getInt("empno"));
			dto.setEname(rs_emp.getString("ename"));
			dto.setHiredate(rs_emp.getDate("hiredate"));
			dto.setJob(rs_emp.getString("job"));
			dto.setMgr(rs_emp.getInt("mgr"));
			dto.setSal(rs_emp.getDouble("sal"));
		list.add(dto);	
	}
	request.setAttribute("list", list);
} catch (Exception e) {
	System.out.println("> TestEmpInfo.doGet() \n" + e.toString());
} finally {
	if (rs_emp != null)
		try {
			rs_emp.close();
		} catch (Exception e) {
		}
	if (pstmt != null)
		try {
			pstmt.close();
		} catch (Exception e) {
		}
	if (con != null)
		try {
			DBConn.close();
		} catch (Exception e) {
		}
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp/servlet class - k¡Õn¢®k (2019. 5. 15.-¿ÀÀü 11:07:02)</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="">
<style>
</style>
<script>
   $(document).ready(function (){	  
   });
</script>
</head>
<body>
<table border="1">
<tr>
<th>seq</th>
<th>deptno</th>
<th>ename</th>
<th>job</th>
<th>hiredate</th>
</tr>
<c:if test="${empty list }">
<tr>
	<td colspan="5">사원이 존재하지 않습니다.</td>
</tr>
</c:if>
<c:if test="${not empty list }">


	<c:forEach items="${list}" var="dto" varStatus="status" >
	<%-- <c:choose>
	<c:when test="${dto.deptno eq 10 }"><tr style="background: red" ></c:when>	
	<c:otherwise><tr></c:otherwise>
	</c:choose> --%>
	
	<c:choose>
<%--
 	<c:when test="${status.count eq 1 }"><tr style="background: red" ></c:when>
	<c:when test="${status.count eq fn:length(list) }"><tr style="background: blue" ></c:when> 
	--%>

	<c:when test="${ status.first }"><tr style="background: red" ></c:when>
	<c:when test="${ status.last }"><tr style="background: blue" ></c:when> 
	<c:otherwise><tr></c:otherwise>
	</c:choose>
	<td>${status.index}(${status.count })</td>
	<td>${status.current.deptno }</td>
	<td>${dto.ename }</td>
	<td>${dto.job }</td>
	<td>${dto.hiredate }</td>
	</tr>
	</c:forEach>
	
${ list.size()}

</c:if>
</table>
</body>
</html>











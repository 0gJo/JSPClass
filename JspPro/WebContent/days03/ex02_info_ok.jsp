<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="days02.DeptDTO"%>
<%@page import="java.sql.*"%>
<%@page import="com.util.DBConn"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <!-- jstl lib가져오기 -->
<% 
	


	//String id = (String)request.getAttribute("id") ; // object 
	
	//ArrayList<DeptDTO> list = (ArrayList<DeptDTO>) request.getAttribute("list"); // downcasting
	
	// Controller 에서 보낸 list 받기 
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>jsp/servelet class - 0gJo 2019. 4. 26.-오전 11:34:24</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="">
<script>
   $(document).ready(function (){
	 
   });
</script>

</head>
<body>
<%-- id : <%=id %> --%>
<%-- id  = ${id} --%>

<%-- name = ${ param.name }  --> param : getParameter하지 않아도 parameter 값이 넘어오면 자동으로 생성되는 객체
--%>

<select>
<c:forEach items="${list}" var="dto" >
<option value="${dto.deptno }" >${dto.dname} </option>	
</c:forEach>	

</select>

<ul>
<c:forEach items="${list}" var="dto" >
<li >${dto.dname} </li>	
</c:forEach>	


</ul>


</body>
</html>
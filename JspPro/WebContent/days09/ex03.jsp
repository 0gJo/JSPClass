<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	Date time = new Date();
	SimpleDateFormat  sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>jsp/servelet class - 0gJo 2019. 5. 8.-오후 12:06:42</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="">
<script>
   $(document).ready(function (){
	 
   });
</script>

</head>
<body>
세션 ID : <%= session.getId() %><br>
<%
	time.setTime(session.getCreationTime());
%>
세션 생성 시간 : <%= sdf.format(time) %><br>
<%
time.setTime(session.getLastAccessedTime());
%>
세션 마지막 접속 시간 : <%= sdf.format(time) %>
<%
session.setAttribute("empno", "7866");
session.setAttribute("ename", "SMITH");
%>
<a href="ex04.jsp">ex04.jsp</a><br>
<a href="ex05.jsp">ex05.jsp - 세션종료</a><br>
</body>
</html>
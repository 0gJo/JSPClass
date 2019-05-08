<%@page import="com.util.Cookies"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="ex06_sessionAuth.jspf" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>jsp/servelet class - 0gJo 2019. 5. 8.-오전 9:05:46</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="">
<script>
   $(document).ready(function (){
	 
   });
</script>

</head>
<body>
<a href="ex06_default.jsp">Home</a>
<% 
if(auth != null){
%>
<a href="ex06_default.jsp">글쓰기</a>
<% if (auth.equals("관리자")){ %>
<a href="ex06_default.jsp">글수정</a>
<a href="ex06_default.jsp">글삭제</a>
<%
} %>
<%}
%>
<img alt="" src="/JspPro/days09/List.do.png">
</body>
</html>
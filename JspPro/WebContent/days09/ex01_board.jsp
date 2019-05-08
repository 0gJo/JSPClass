<%@page import="com.util.Cookies"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="ex01_cookieAuth.jspf" %>
<%
/* 
 //	로그인 인증을 거치면 auth 쿠키의 값 id
 String auth = null;
 Cookies cookies = new Cookies(request);
 if(cookies.exists("auth")){
	 auth = cookies.getValue("auth");
 }
  */
 String error = request.getParameter("error");
%>
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
<a href="ex01_default.jsp">Home</a>
<% 
if(auth != null){
%>
<a href="ex01_default.jsp">글쓰기</a>
<% if (auth.equals("관리자")){ %>
<a href="ex01_default.jsp">글수정</a>
<a href="ex01_default.jsp">글삭제</a>
<%
} %>
<%}
%>
<img alt="" src="/JspPro/days09/List.do.png">
</body>
</html>
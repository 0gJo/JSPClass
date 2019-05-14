<%@page import="com.util.Cookies"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>jsp/servelet class - 0gJo 2019. 5. 14.-오후 12:18:06</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="">
<script>
   $(document).ready(function (){
	 
   });
</script>

</head>
<body>
<h3>ex03_ok.jsp</h3>

<%
	String referer = request.getHeader("referer");
%>

이전페이지 : <%= referer %><br>
이전페이지 : ${header.referer}


<hr>
<%-- 
<% Cookie[] Cookies =  request.getCookies() ; %>

<% for(int i =0; i < Cookies.length ; i++){
	if(Cookies[i].getName().equals("user")){
		String user = Cookies[i].getValue();
%>
user : <%= user %>

<%
	}
	} %>

 --%>
 <% Cookies cookies = new Cookies(request);
 		String user = cookies.getCookie("name").getValue();
 %>
 user : <%= user %>
 <br>
user : ${cookie.user.value}


<h3>쿠키 목록 출력</h3>

<c:forEach items="${cookie }" var="ck">
<li>${ck.key}-${URLDecoder.decode(ck.value.value}</li>
												<!-- ck.value : 쿠키객체 -->
</c:forEach>


</body>
</html>
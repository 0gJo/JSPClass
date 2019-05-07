<%@page import="java.net.URLEncoder"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>jsp/servelet class - 0gJo 2019. 5. 7.-오전 11:47:23</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="">
<script>
   $(document).ready(function (){
	 
   });
</script>

</head>
<body>

<%
	String name = "name";
	String value = "홍길동";
													// 기억
	Cookie cookie = new Cookie(name, URLEncoder.encode(value, "utf-8"));
	cookie.setMaxAge(-1);
	response.addCookie(cookie);
%>


<%=cookie.getName() %>:<%= cookie.getValue() %>
</body>
</html>
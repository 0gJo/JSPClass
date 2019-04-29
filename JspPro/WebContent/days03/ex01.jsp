<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>jsp/servelet class - 0gJo 2019. 4. 26.-오전 10:41:14</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="">
<script>
   $(document).ready(function (){
	 
   });
</script>

</head>
<body>
<%
	String name = "admin";
	int age = 20;
	String params = String.format("name=%s&age=%d", name, age);
%>
<a href="ex01_ok.jsp?<%=params%>">\${ param.name }</a><br>
<a href="ex01_02.jsp?<%=params%>">\${ param.name }</a>
</body>
</html>
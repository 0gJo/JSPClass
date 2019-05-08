<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	session.setMaxInactiveInterval(30*60);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>jsp/servelet class - 0gJo 2019. 5. 8.-오후 2:13:02</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="">
<script>
   $(document).ready(function (){
	 
   });
</script>

</head>
<body>
<%
//session.invalidate();
%>
<!-- 세션 종료하였습니다. -->
<form action="ex05.do">
name = <input name="name" value="admin">
age = <input name="age" value="25">
<input type="submit">
</form>
</body>
</html>
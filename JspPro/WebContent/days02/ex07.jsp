<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	//response.sendRedirect("ex07_02.jsp");

String err = request.getParameter("error");
String ok = request.getParameter("ok");


%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>jsp/servelet class - 0gJo 2019. 4. 25.-오후 3:36:57</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="">
<script>
   $(document).ready(function (){
	 
   });
</script>

</head>
<body>
<h3>ex07.jsp</h3>
<!-- <form action="ex07_02.jsp"> -->
<form action="redirect">
id : <input type="text" name="id"><br>
pwd : <input type="text" name="pwd"><br>
<input type="submit">

<p>
<%
if(err!=null){ //error 인경우 
%>	
로그인 실패

<% 	
}else if(ok!=null){ //ok 인 경우 
%>	

로그인 성공

<% 	
}

%>


</p>

</form>
</body>
</html>
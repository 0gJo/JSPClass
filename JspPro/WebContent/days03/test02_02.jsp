<%@page import="java.io.Console"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<% 
request.setCharacterEncoding("UTF-8");

String name = request.getParameter("name");
int age = Integer.parseInt(request.getParameter("age"));

//String location ="test02_03.jsp"+"?name="+name+"&"+"age="+age+"&";


%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>jsp/servelet class - 0gJo 2019. 4. 26.-오전 9:10:22</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="">
<script>
   $(document).ready(function (){
	$('form').append
	   
	   
	   
	   
	   
   });
</script>

</head>
<body>

<%-- 

<form method="post" action="<%=location%>">
address : <input type="text" id="addr" name="addr" value="강남구 역삼동" /><br>
tel : <input type="text" id="tel" name="tel" value="123-4567" /><br>
[이전]<input type="submit" value="다음">
</form>

 --%>
<form method="post" action="test02_03.jsp">
address : <input type="text" id="addr" name="addr" value="강남구 역삼동" /><br>
tel : <input type="text" id="tel" name="tel" value="123-4567" /><br>
<input type="submit" value="이전"><input type="submit" value="다음">
</form>




</body>
</html>
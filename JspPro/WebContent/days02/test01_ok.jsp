<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>jsp/servelet class - 0gJo 2019. 4. 25.-오전 9:05:24</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="">
<script>
   $(document).ready(function (){
	 
   });
</script>

</head>
<body>
<%  
String name = request.getParameter("name");
int age = Integer.parseInt(request.getParameter("age"));
String email = request.getParameter("email");

%>


이름 : <span><%= name %></span> <br>
나이 :  <span><%= age %></span><br>
이메일 : <span><%= email %></span><br>

EL 사용<br>

이름 : <%-- <% ${param.name} %> --%>
나이 :
이메일 :



</body>
</html>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp/servlet class - k≡n¡k (2019. 4. 23.-오후 4:38:13)</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="">
<style>
</style>
<script>
   $(document).ready(function (){	  
   });
</script>
</head>
<body>
<%
    String contextPath = request.getContextPath();
%>
Hello World
<br>
<!-- get 방식 -->
<a href="ex05.jsp?n1=10&n2=20">ex05.jsp</a>
<br>
<a href="http://localhost/jspPro/hello">HelloServlet.java</a><br>
<a href="<%= contextPath %>/hello">HelloServlet.java</a><br>
</body>
</html>







<!-- 
순호 10
 -->



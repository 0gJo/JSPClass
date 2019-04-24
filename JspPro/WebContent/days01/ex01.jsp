<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>jsp/servelet class - 0gJo 2019. 4. 23.-오후 4:38:32</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="">
<script>
   $(document).ready(function (){
	 
	   
	   
   });
</script>

</head>
<body>
<%
	String contextPath = request.getContextPath(); // == /jspPro

%>
Hello World
<!-- link-> get방식  -->
<a href="ex05.jsp?n1=10&n2=20">ex05.jsp</a>
 <br>
 <a href="hello">HelloServlet.java</a> <!--경로:http://localhost/JspPro/days01/hello  -->
<a href="/jspPro/hello">HelloServlet.java</a>
<a href="<%=contextPath %>/hello">HelloServlet.java</a>
</body>
</html>
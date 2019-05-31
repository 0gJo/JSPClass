<%@page import="oracle.net.aso.r"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>jsp/servelet class - 0gJo 2019. 5. 30.-오전 9:22:20</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="">
<script>
   $(document).ready(function (){
	 
   });
</script>

</head>
<body>
<% 
// request 객체로 parameter 값을 얻어올 수 없다.
String name = request.getParameter("name");
String upload = request.getParameter("upload");
%>
> 전송된 이름 : <%= name %><br>
> 전송된 파일 : <%= upload %>
<hr>
${param.name }<br>
${param.upload }<br>
</body>
</html>
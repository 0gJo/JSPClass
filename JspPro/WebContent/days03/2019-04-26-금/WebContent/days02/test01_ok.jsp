<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp/servlet class - k≡n¡k (2019. 4. 25.-오전 7:56:14)</title>
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
   String name = request.getParameter("name");
   int age = Integer.parseInt(request.getParameter("age"));
   String email = request.getParameter("email");	   
%>
<h3>표현식</h3>
name = <%= name %><br> 
age = <%= age %><br>
email = <%= email %><br>
<h3>EL</h3>
name = ${ param.name }<br> 
age = ${ param.age }<br>
email = ${ param.email }<br>
</body>
</html>












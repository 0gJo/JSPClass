<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
   /*  String name = request.getParameter("name");
    int age = Integer.parseInt(request.getParameter("age")); */
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp/servlet class - k≡n¡k (2019. 4. 26.-오전 11:02:49)</title>
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
<%-- 
name = <%= name %><br>
age = <%= age %><br>
 --%>
 <!-- JSP EL(표현언어) 문법 -->
 <%-- 
 name = ${ param.name }<br>
 age = ${  param["age"]  }<br>
  --%>
</body>
</html>












<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp/servlet class - k≡n¡k (2019. 4. 26.-오전 9:00:51)</title>
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
    String name = "admin";
    int age =20;
    String params = String.format("name=%s&age=%d", name, age);
%>
<!-- http://localhost/jspPro/days03/ex01_ok.jsp
?name=admin&age=20
 param.name
 param.age 
-->
<a href="ex01_ok.jsp?<%= params %>">\${  param.name }</a>
<br>
<a href="ex01_02.jsp?<%= params %>">\${  param.name }</a>

</body>
</html>
j








 

<%-- 
<form>
이름 : <input type="text" name="name" />
<br>
개<input type="checkbox" name=animal value=개 checked="checked">
고양이<input type="checkbox" name=animal value=고양이  checked="checked">
금붕어<input type="checkbox" name=animal value=금붕어>
<br>
<input type="submit" /> 
</form>

<h3> ${  paramValues.size() } </h3>

<h3> ${  paramValues.animal[0] } </h3>
<h3> ${  paramValues.animal[1] } </h3>
<h3> ${  paramValues.animal[2] } </h3>
 --%>
 
<!-- 
 > 재민 - 휴가
 -->
<%@page import="java.util.Iterator"%>
<%@page import="days02.DeptDTO"%>
<%@page import="java.util.ArrayList"%>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp/servlet class - k≡n¡k (2019. 4. 26.-오후 3:34:33)</title>
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
<h3>스크립트릿, 표현식,html  -> JSTL</h3>  

<c:forEach items="${ list }" var="dto">
<li> ${ dto.deptno }/${ dto.dname }/${ dto.loc}  </li>
</c:forEach>  

</body>
</html>












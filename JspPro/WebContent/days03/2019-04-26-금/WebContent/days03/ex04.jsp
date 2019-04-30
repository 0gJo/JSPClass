<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp/servlet class - k≡n¡k (2019. 4. 26.-오후 2:01:23)</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="">

<script>
   $(document).ready(function (){	  
   });
</script>
</head>
<body>


<!-- value="pk" -->
<form method="get"> 
	<select id="deptno" name="deptno">
	  <option value="">선택하세요</option>
	   
	  <option value="10">ACCOUNTING</option>
	  <option value="20">RESEARCH</option>
	  <option value="30">SALES</option>
	  <option value="40">OPERATIONS</option>
	</select>
</form>

<script>
   $("#deptno").change(function (){
	   // console.log( $(this).val() ); // deptno
	   //var deptno = $(this).val();
	   //  서블릿의 urlpattern :  /days03/ex04_emp
	   $('form')
	     .attr("action","ex04_emp")
	     .submit();
   });
</script>





<!-- 
1. WebContent 폴더 안에 images 폴더 생성
2. img_avatar.png
    img_avatar2.png
3. sample.jsp    
 -->    
</body>
</html>












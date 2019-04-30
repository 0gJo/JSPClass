<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
   request.setCharacterEncoding("UTF-8");
   String name = request.getParameter("name");
   String age = request.getParameter("age");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp/servlet class - k≡n¡k (2019. 4. 26.-오전 8:07:27)</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="">
<style>
</style>
<script>
   $(document).ready(function (){	  
	   
	   //$('form').append($('<input type="text" name="name" value="'+ <%= name %> +'">'));
	   $('form').append($('<input>').attr({ type:'hidden',name:'name', value:'<%= name %>'}));
	   $('form').append($('<input>').attr({ type:'hidden',name:'age', value:'<%= age %>'}));
	   
	   $('#prev').click(function (){
		   //history.back();
		   location.href = "test02.jsp";
	   });
	   
   });
</script>
</head>
<body>

<form action="test02_03.jsp" method="post">

address : <input type="text" name="address" value="서울 강남 한독빌딩 8층" /><br>
tel : <input type="text" name="tel" value="02-1234-5433" /><br>

<input type="submit" value="다음" />
<input type="button" id="prev" value="이전" />

</form>

</body>
</html>












<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp/servlet class - k≡n¡k (2019. 4. 25.-오후 5:35:23)</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="">
<style>
</style>
<script>
   $(document).ready(function (){
	   $('a').click(function (){
		   var msg = $('#message').val();
		   $(this).attr('href', function (i, val){
			   return val +"?message="+msg;			   
		   });
		   
		   // $(this).submit();
	   }); 
   });
</script>
</head>
<body>


message : <input type="text" id="message" name="message" value="안녕하세요. 홍길동 입니다." /><br>
<a href="/jspPro/days03/forward.jsp">forward.jsp</a>

</body>
</html>












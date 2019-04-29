<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
      // 리다이렉트 ? 
      //response.sendRedirect("ex07_02.jsp");
 
     String err = request.getParameter("error");
     String ok = request.getParameter("ok");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp/servlet class - k≡n¡k (2019. 4. 25.-오후 3:35:45)</title>
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
<!-- p 90 response(응답) 기본 객체 -->
<!-- 클라이언트(브라우저) 보내는 응답 객체 -->
<!-- 
1. 헤더 정보 입력
2. 리다이렉트 하기( redirect )
 -->
 <h3>ex07.jsp</h3>
 
 <!-- <form action="ex07_02.jsp"> -->
 <form action="redirect">
 
 id :  <input type="text" name="id" value="admin" /><br>
 pwd : <input type="text" name="pwd" value="1234" /><br>
 <input type="submit" /> 
 <p>
 <%
    if( err != null ){
        %>로그인 실패<%   	
    }else if( ok != null ){
    	%>로그인 성공<%    	
    }
 %>
 </p>
 </form>
</body>
</html>












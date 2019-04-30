<%@page import="java.time.LocalDateTime"%>
<%@ page import="java.util.Date"%>
<%@ page trimDirectiveWhitespaces="true" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
   // 스크립트릿 : 자바코딩
   Date now = new Date();
   int age = 20 ;
   
   String today = getNow();
%>
<%!
    // 선언문 : 필드 , 메서드
    String name = "홍길동";
    
    public String getNow(){
    	return LocalDateTime.now().toString();
    }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp/servlet class - k≡n¡k (2019. 4. 24.-오전 10:03:56)</title>
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
날짜 : <input type="text" value="<%= now.toLocaleString() %>" /><br> 
이름 : <input type="text" value="<%= name %>" /><br> 
나이 : <input type="text" value="<%= age %>" /><br>
today : <span><%= today %></span><br>
</body>
</html>












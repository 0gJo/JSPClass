<%@page import="java.util.Enumeration"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp/servlet class - k≡n¡k (2019. 4. 25.-오후 3:28:22)</title>
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
<!-- p 88 요청 헤더 정보 처리 -->
<!-- 
*** getHeader() : 지정한 이름의 헤더 값
getHeaders() : 지정한 이름의 헤더 목록
*** getHeaderNames() : 모든 헤더 이름 
getIntHeader() : 지정한 헤드의 값을 정수
getDateHeader() : 지정한 헤더의 값을 시간 값
 -->
<%
  Enumeration<String> en =request.getHeaderNames();
  while( en.hasMoreElements() ){
	  String hname = en.nextElement();
	  String hvalue = request.getHeader(hname);
	  //int hintvalue = request.getIntHeader(hname);
	  //long hdatevalue = request.getDateHeader(hname);
%>
  <li><%= hname %> - <%= hvalue %></li>
<%	  
  }
%>
</body>
</html>












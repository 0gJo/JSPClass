<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp/servlet class - k≡n¡k (2019. 4. 25.-오후 2:15:51)</title>
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
 <!-- p 72 request 기본 객체 -->
 <!--
   1. 클라이언트(브라우저)와 관련된 정보 읽기 기능
   2. 서버와 관련된 정보 읽기 기능
   3. 클라이언트가 전송한 요청 파라미터 읽기 기능
   4. 클라이언트가 전송한 요청 헤더 읽기 기능
   5. [클라이언트가 전송]한 쿠키 읽기 기능
   6. 속성 처리 기능
 -->
 <!-- 0:0:0:0:0:0:0:1 -->  
 *** 클라이언트 IP 주소 : <%= request.getRemoteAddr() %><br>
 <!-- -1 - 전송된 데이터의 길이를 알 수 없는 경우 -->
 요청한 정보 길이  : <%= request.getContentLength() %><br>
 <!-- null -->
 요청정보 인코딩  : <%= request.getCharacterEncoding() %><br>
 요청정보 컨텐츠타입 : <%= request.getContentType() %><br>
 <!--  HTTP/1.1 -->
 요청정보 프로토콜 : <%= request.getProtocol() %><br>  
 <!-- GET -->
 요청정보 전송방식 : <%= request.getMethod() %><br>
   
 *** 요청정보 URL : <%= request.getRequestURL() %><br>
 *** 요청정보 URI : <%= request.getRequestURI() %><br>
 
 *** 컨텍스트 경로 : <%= request.getContextPath() %><br>
 서버 이름 : <%= request.getServerName() %><br>
 포트 번호 : <%= request.getServerPort() %><br>
</body>
</html>












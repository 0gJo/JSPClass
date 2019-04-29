<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp/servlet class - k≡n¡k (2019. 4. 25.-오전 7:42:41)</title>
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
<!-- 
http://localhost/jspPro/days02/method?msg=%ED%95%9C%EA%B8%80%EB%A1%9C+%EB%A9%94%EC%8B%9C%EC%A7%80...
 -->
<form action="method" method="get">
 메시지 : <input type="text" name="msg" value="한글로 메시지..." />
 <input type="submit" />
</form>

<form action="method" method="post">
 메시지 : <input type="text" name="msg" value="한글로 메시지..." />
 <input type="submit" />
</form>

</body>
</html>




<!-- 
web.xml 서블릿 설정

src>days02 패키지 추가
  TestServlet.java

WebContent>days02 폴더 추가
  test01.html
  test01_ok.jsp  
  
  서블릿   url-pattern=
  http://localhost/jspPro/days02/call
-->
 
<!-- 
예나 - 아파서 결석
길환 - 불성실  반장
민수 - 휴가
 -->


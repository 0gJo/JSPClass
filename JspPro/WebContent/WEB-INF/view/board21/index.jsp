<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>jsp/servelet class - 0gJo 2019. 5. 10.-오후 3:10:01</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="">
<script>
   $(document).ready(function (){
	 
   });
</script>

</head>
<body>
<c:if test="${!empty authUser }">
${authUser.name }님 안녕하세요
<a href="/JspPro/logout.do">[로그아웃]</a>
<a href="/JspPro/changePwd.do">[비밀번호변경]</a>
</c:if>
<c:if test="${empty authUser }">
<a href="/JspPro/join.do">[회원가입하기]</a>
<a href="/JspPro/login.do">[로그인]</a>
</c:if>





</body>
</html>
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

<form method="post" action="/JspPro/login.do">
<c:if test="${errors.idOrPwNotMatch}">
아이디와 암호가 일치하지 않습니다.
</c:if>

아이디 : <br> <input type="text" name="id" value="${param.id}">
<c:if test="${errors.id }">ID를 입력하세요</c:if>
<br>
비밀번호 : <br> <input type="password" name="password">	
<c:if test="${errors.password}">비밀번호를 입력하세요</c:if>

<input type="submit" value="로그인">
</form>


</body>
</html>
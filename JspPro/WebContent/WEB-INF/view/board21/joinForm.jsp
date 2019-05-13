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
<form action="/JspPro/join.do" method="post">
<p>
아이디 :<br> <input type="text" name="id" value="${param.id}">
<c:if test="${errors.id}">ID를 입력하세요</c:if>
<c:if test="${errors.duplicatedId}">이미 사용중인 아이디 입니다.</c:if>
</p>

<p>
이름 : <br><input type="text" name="name" value="${param.name}">
<c:if test="${errors.name }">이름을 입력하세요</c:if>
</p>

<p>
비밀번호 : <br><input type="password" name="password">
<c:if test="${errors.password}">암호를 입력하세요</c:if>
</p>

<p>
비밀번호 재입력 :<br> <input type="password" name="confirmPassword">
<c:if test="${errors.confirmPassword }">확인을 입력하세요</c:if>
<c:if test="${errors.notMatch}">암호와 확인이 일치하지 않습니다.</c:if>
</p>
<input type="submit" value="가입">
</form>
</body>
</html>
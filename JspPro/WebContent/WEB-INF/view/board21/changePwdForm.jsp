<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>jsp/servelet class - 0gJo 2019. 5. 13.-오후 3:16:13</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="">
<script>
   $(document).ready(function (){
	 
   });
</script>

</head>
<body>
<form method="post">
현재 암호 : <br> <input type="password" name="curPwd" >
<c:if test="${errors.curPwd }">현재 암호를 입력하세요</c:if>
<c:if test="${errors.badCurPwd }">현재 암호가 일치하지 않습니다.</c:if>

새암호: <br> <input type="password" name="newPwd">
<c:if test="${errors.newPwd }">새 암호를 입력하세요</c:if>

<input type="submit" value="암호번경">
</form>
</body>
</html>
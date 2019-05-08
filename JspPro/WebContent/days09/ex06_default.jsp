<%@page import="com.util.Cookies"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="ex06_sessionAuth.jspf" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>jsp/servelet class - 0gJo 2019. 5. 8.-오전 9:05:15</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="">
<style type="text/css">
div{
	border: solid 1px gray;
	width: 300px;
	height: 100px;
	padding: 20px;
}
</style>
<script>
   $(document).ready(function (){
	 
   });
</script>

</head>
<body>
<h3>default(main) Page - Session</h3>

<c:choose >
<c:when test="${auth eq null  }">
<div id="logon">
<form action="ex06_logon.jsp">
아이디: <input name="id"	value="admin" type="text"><br>
비빌번호 : <input name="pass" value="1234" type="password">
<input type="submit" value="로그인">
<input type="button" value="회원가입"><br>


<c:if test="${param.error ne null  }">

<span>로그인 실패했습니다.</span>
</c:if>

</form>
</div>
</c:when>
<c:otherwise>

<div id="logout">
[${auth}][${sessionScope.memberInfo.id}]님 환영합니다.<br>
<a href="ex06_logout.jsp">로그아웃</a>
</div>
</c:otherwise>
</c:choose>


<a href="ex01_board.jsp">게시판</a><br>
<a href="ex01_notice.jsp">공지사항</a><br>

<c:if test="${auth ne null  }">
<a href="#">일정관리</a><br>
<a href="#">자료실</a><br>
<a href="#">도움말</a><br>	
</c:if>

<script type="text/javascript">
$("#logon span").fadeOut(5000);

</script>




</body>
</html>
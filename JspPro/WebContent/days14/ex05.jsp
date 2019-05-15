<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="days14.JumsuChange" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>jsp/servelet class - 0gJo 2019. 5. 15.-오전 10:26:47</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="">
<script>
   $(document).ready(function (){
	 
   });
</script>

</head>
<body>
<form action="">
국어점수 : <input type="text" name="kor">
</form>
<%-- <h3>표현식 사용</h3>

<%
	int kor = Integer.parseInt(request.getParameter("kor"));
	String result ;

	switch (kor/10) {
	case 9:
	result = "수";
	break;
	case 8:
		result = "우";
		break;
	case 7:
		result = "미";
		break;
	case 6:
		result = "양";
		break;
			
	default:
		result = "가";
		break;
	}
%>
<%=result %> --%>

<h3>EL 및 c태그 사용1</h3>

<c:choose>
<c:when test="${param.kor >=90 }">수</c:when>
<c:when test="${param.kor/10 >= 80 }">우</c:when>
<c:when test="${param.kor/10 >= 70}">미</c:when>
<c:when test="${param.kor/10 >= 60 }">양</c:when>
<c:otherwise>가</c:otherwise>

</c:choose>
<h3>EL 및 c태그 사용2 : 함수사용</h3>

<c:if test="${param.kor ne null }">
${JumsuChange.getGrade(param.kor)}
</c:if>

</body>
</html>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>jsp/servelet class - 0gJo 2019. 5. 15.-오전 10:16:23</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="">
<script>
   $(document).ready(function (){
	 
   });
</script>

</head>
<body>

<form>
<input type="text" name="num" value="${param.num}">
</form>

<div id="demo">
<%-- <c:if test="${EL} <%=표현식 %>"></c:if> --%>
<c:if test="${param.num%2 eq 0 }">짝수</c:if>
<c:if test="${param.num mod 2 ne 0 }">홀수</c:if>
</div>



<c:if test="" scope="" var="test의 결과를 저장할 변수"></c:if>

</body>
</html>
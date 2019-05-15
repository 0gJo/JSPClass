<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>jsp/servelet class - 0gJo 2019. 5. 15.-오후 2:38:25</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="">
<script>
   $(document).ready(function (){
	 
   });
</script>

</head>
<body>
<%-- 

<fmt:formatNumber></fmt:formatNumber>
<fmt:parseNumber></fmt:parseNumber>

<fmt:formatDate value=""/>
<fmt:parseDate></fmt:parseDate>

<fmt:setTimeZone value=""/>
<fmt:timeZone value=""></fmt:timeZone>

 --%>
 <c:set var="price" value="10000"></c:set>
<fmt:formatNumber value="${price}"  type="number" var="numberType"></fmt:formatNumber>
숫자 : ${numberType }
<br>
통화 : <fmt:formatNumber value="${price}" type="currency" currencySymbol="\\"/>
<br>
퍼센트 : <fmt:formatNumber value="${price}" type="percent" groupingUsed="false"/>
<br>
패턴지정 : <fmt:formatNumber value="${price}" pattern="00000000.00"/>
<hr>

<c:set value="1,100.12" var="money"></c:set>
<fmt:parseNumber value="${money}" pattern="0,000.00" var="n"/>
${n}

</body>
</html>
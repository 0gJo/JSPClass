<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>jsp/servelet class - 0gJo 2019. 5. 15.-오전 11:26:57</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="">
<script>
   $(document).ready(function (){
	 
   });
</script>

</head>
<body>
<c:set var="sum" value="0"></c:set>
<c:forEach begin="1" end="10" step="1" var="i" >
<%-- ${i}${i==10?'=':'+'} --%>
${i+=(i eq 10?'=':'+')}
<c:set var="sum" value="${sum+i}"/>
</c:forEach>
${sum}

</body>
</html>
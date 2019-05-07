<%@page import="java.net.URLDecoder"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>jsp/servelet class - 0gJo 2019. 5. 7.-오후 12:30:25</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="">
<script>
   $(document).ready(function (){
	 
   });
</script>

</head>
<body>
<h3>쿠키값 읽어오기</h3>
<%
	Cookie[] cookies = request.getCookies();
	if(cookies!=null && cookies.length>0){
		for (int i = 0; i < cookies.length; i++) {
%>
<%=cookies[i].getName()%>=  <%= URLDecoder.decode(cookies[i].getValue(), "UTF-8")%><br>		
<% 	
}
		
	}else{
%>
쿠키가 존재하지 않습니다.
<% 		
	}

%>

<h4>EL+JSTL 쿠키 목록 출력</h4>
<c:forEach items="${cookie}" var="entry">

	${entry.key } = ${entry.value.getValue() }<br>
</c:forEach>


</body>
</html>
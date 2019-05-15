<%@page import="java.util.HashMap"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>jsp/servelet class - 0gJo 2019. 5. 15.-오후 12:19:57</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="">
<script>
   $(document).ready(function (){
	 
   });
</script>

</head>
<body>
<% 
HashMap<String,String> map = new HashMap<>();

map.put("id", "admin");
map.put("name", "홍길동");
map.put("tel", "010-0000-0000");
map.put("addr", "서울 강남구");

//pageContext.setAttribute("map", map);

%>

<c:forEach items="<%=map %>" var="entry" > 
 <%-- <c:forEach items="${map }" var="entry" > --%>

<li>
${entry.key}-${entry.value}
</li>

</c:forEach>

</body>
</html>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="board21.member.model.Member"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>jsp/servelet class - 0gJo 2019. 5. 15.-오전 9:04:41</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="">
<script>
   $(document).ready(function (){
	 
   });
</script>

</head>
<body>

<%
	Member m = new Member();
	//m.setName("admin");
%>

<c:set target="<%= m %>" property="name" value="admin"></c:set>

<%=m.getName() %>



<%
	Map<String,String> prop = new HashMap<>();

	prop.put("id", "admin");
	
	

%>
</body>
</html>
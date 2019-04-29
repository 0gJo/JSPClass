<%@page import="java.util.Enumeration"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>jsp/servelet class - 0gJo 2019. 4. 25.-오후 3:29:05</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="">
<script>
   $(document).ready(function (){
	 
   });
</script>

</head>
<body>
<%
Enumeration<String> en = request.getHeaderNames();
while (en.hasMoreElements()) {
	String hname =  en.nextElement();
	String hvalue = request.getHeader(hname);
	
%>	
	
<li><%=hname %>-<%=hvalue %></li>	

<% 	
}

%>
</body>
</html>
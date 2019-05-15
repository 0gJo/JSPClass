<%@page import="oracle.net.aso.r"%>
<%@page import="java.io.FileReader"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>jsp/servelet class - 0gJo 2019. 5. 15.-오후 2:09:55</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="">
<script>
   $(document).ready(function (){
	 
   });
</script>

</head>
<body>
<%-- <c:out value="출력할 값" default="value를 입력하지 않았을때 출력할 값" escapeXml=""></c:out> --%>
<h3>소스보기</h3>
<%
	FileReader reader = null;

	try{
		
		String path = request.getParameter("path");
		reader = new FileReader(getServletContext().getRealPath(path));
%>		
<pre>
<c:out value="<%=reader %>" escapeXml="true"/>
</pre>
<%		
	}catch(Exception e){
		
	}finally{
		if(reader!=null){
	
			try{
				reader.close();
			}catch(Exception e){
				
			}
			
		}
		
	}

%>

</body>
</html>
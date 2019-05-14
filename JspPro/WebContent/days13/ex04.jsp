<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>jsp/servelet class - 0gJo 2019. 5. 14.-오후 2:07:11</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="">
<script>
   $(document).ready(function (){
	 
   });
</script>

</head>
<body>



<%
	String title = "jsp & servlet";
	request.setAttribute("title", title);

%>
책제목 : ${requestScope.title}
${"책제목 : " += requestScope.title+="입니다"}




<hr>
${empty  null }
${empty  "" }





<%
	request.setAttribute("name", "admin");
%>

${requestScope.name == "admin" }
</body>
</html>
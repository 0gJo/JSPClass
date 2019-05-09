<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>jsp/servelet class - 0gJo 2019. 5. 9.-오전 9:05:10</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="">
<script>
   $(document).ready(function (){
	 
   });
</script>

</head>
<body>
<a href="<%= request.getContextPath()%>/simple">/simple</a>
<a href="<%= request.getContextPath()%>/simple?type=greeting">greeting</a>
<a href="<%= request.getContextPath()%>/simple?type=date">date</a>
<a href="<%= request.getContextPath()%>/simple?type=blahblah">기타</a>

<a href="/JspPro/hello.do">hello.do</a>
<a href="/JspPro/board/list.do">/board/list.do</a>
</body>
</html>
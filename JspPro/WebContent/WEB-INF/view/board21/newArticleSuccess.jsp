<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp/servlet class - k≡n¡k (2019. 5. 13.-오후 4:30:32)</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="">
<style>
</style>
<script>
   $(document).ready(function (){	  
   });
</script>
</head>
<body>

게시글을 등록했습니다.
<br>
<%-- ${ctxPath = pageContext.request.contextPath ; ''} --%>
<a href="${ pageContext.request.contextPath}/article/list.do">[게시글목록보기]</a>
<a href="${ pageContext.request.contextPath}/article/read.do?no=${newArticleNo}">[게시글내용보기]</a>
</body>
</html>












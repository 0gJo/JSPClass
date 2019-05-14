<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp/servlet class - k≡n¡k (2019. 5. 14.-오전 8:16:21)</title>
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
<div style="margin: 0 auto;width:800px">
	<table border="1" width="100%">
		<tr>
			<td colspan="4"><a href="/JspPro/article/write.do">[게시글쓰기]</a></td>
		</tr>
		<tr>
			<td>번호</td>
			<td>제목</td>
			<td>작성자</td>
			<td>조회수</td>
		</tr>
	<c:if test="${articlePage.hasNoArticles()}">
		<tr>
			<td colspan="4">게시글이 없습니다.</td>
		</tr>
	</c:if>
	<c:forEach var="article" items="${articlePage.content}">
		<tr>
			<td>${article.article_no}</td>
			<td>
			<a href="read.do?no=${article.article_no}&pageNo=${articlePage.currentPage}">
			<c:out value="${article.title}"/>
			</a>
			</td>
			<td>${article.writer.name}</td>
			<td>${article.read_cnt}</td>
		</tr>
	</c:forEach>
	<c:if test="${articlePage.hasArticles()}">
		<tr>
			<td colspan="4">
				<c:if test="${articlePage.startPage > 5}">
				<a href="list.do?pageNo=${articlePage.startPage - 5}">[이전]</a>
				</c:if>
				<c:forEach var="pNo" 
						   begin="${articlePage.startPage}" 
						   end="${articlePage.endPage}">
				<a href="list.do?pageNo=${pNo}">[${pNo}]</a>
				</c:forEach>
				<c:if test="${articlePage.endPage < articlePage.totalPages}">
				<a href="list.do?pageNo=${articlePage.startPage + 5}">[다음]</a>
				</c:if>
			</td>
		</tr>
	</c:if>
	</table>
</div>
</body>
</html>












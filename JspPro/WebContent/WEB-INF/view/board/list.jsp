<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>jsp/servelet class - 0gJo 2019. 4. 30.-오전 11:10:46</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="">
<script>
   $(document).ready(function (){
	 
   });
</script>
<style type="text/css">
a{
text-decoration: none;
color: black;
}
</style>
</head>
<body>
<div align="center">
<h2>목록보기</h2>
<table  style="border: solid 1px gray; width: 600px">
   <tr align="center">
     <td>번호</td>
     <td>제목</td>
     <td>작성자</td>
    <td>등록일</td>
    <td>조회</td>
  </tr>
<c:if test="${empty list }">
  <tr align="center">
    <td colspan="5">등록된 게시가 없습니다</td>
  </tr>
</c:if>
<c:if test="${not empty list}">
<c:forEach items="${list}" var="dto">
  <tr align="center">
   <td>${dto.seq}</td>
    <td>
       <a href="/JspPro/board/content?seq=${dto.seq}">${dto.subject}</a>
    </td>
    <td> 
       <a href="mailto:${dto.email }">${dto.name}</a>
    </td> 
    <td>${dto.regdate }</td>
    <td>${dto.cnt }</td>
  </tr>
</c:forEach>
</c:if>
</table>
<a href="/JspPro/board/regist.do">글쓰기</a>
</div>

<c:if test="${param.regist eq 'ok' }">
<script type="text/javascript">
alert("글쓰기 완료");
</script>
</c:if>

<c:if test="${param.delete eq 'ok' }">
<script type="text/javascript">
alert("글삭제 완료");
</script>
</c:if>

</body>
</html>
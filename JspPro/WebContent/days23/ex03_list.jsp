<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp/servlet class - k≡n¡k (2019. 5. 30.-오후 2:58:55)</title>
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
<h3 style="text-align:center">FileList - list.jsp</h3>
<table style="width:600px" border="1" align="center">
  <tr>
    <td align="right" colspan="4">
       <a href="write.do">WRITE</a>
    </td>
  </tr>
  <tr>
    <td align="center" width="50">글번호</td>
    <td align="left" >제목</td>
    <td align="center" width="200">첨부파일</td>
    <td align="center" width="50">삭제</td>
  </tr>
  <c:forEach items="${ list }" var="dto">
	  <tr>
	    <td align="center" width="50">${ dto.num }</td>
	    <td align="left" >${ dto.subject }</td>
	    <td align="center" width="200">
   <a href="/days23/upload/${ dto.filesystemname}">
   ${ dto.originalfilename}
   </a>
	      </td>
	    <td align="center" width="50">
	       <a href="delete.do?num=${ dto.num }&filesystemname=${ dto.filesystemname}">삭제</a>
	       <a href="update.do?num=${ dto.num }&filesystemname=${ dto.filesystemname}">수정</a>
	    </td>
	  </tr>
  </c:forEach>
</table>
</body>
</html>









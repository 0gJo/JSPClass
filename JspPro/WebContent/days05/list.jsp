<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp/servlet class - k≡n¡k (2019. 4. 30.-오전 11:10:23)</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="">
<style>
 table , td, th {
   border:solid 1px gray;
 }

  tbody tr  td:nth-of-type(2){
    text-align: left;
  }
  
  a{
     text-decoration: none;
     color:black;
  }
  a:hover{
     color:red;
  }
</style>
<!-- 페이징 처리 style -->
<style>
.pagination{
   margin: 0 auto;
    display: flex;
    justify-content: center;
}
.pagination a {
  color: black;
  float: left;
  padding: 4px 8px;
  text-decoration: none;
  transition: background-color .3s;
}

.pagination a.active {
  background-color: dodgerblue;
  color: white;
}

.pagination a:hover:not(.active) {background-color: #ddd;}
</style>
<script>
   $(document).ready(function (){	  
   });
</script>
</head>
<body>
<div align="center">
 <h2>목록보기</h2>
 <table style="width:600px;">
   <thead>
	   <tr align="center">
	     <td>번호</td>
	     <td>제목</td>
	     <td>작성자</td>
	     <td>등록일</td>
	     <td>조회</td>
	  </tr>
  </thead>
  <tbody>
  <c:if test="${ empty list }">
     <tr align="center">
	    <td colspan="5" height="300px" align="center">등록된 게시가 없습니다</td>
	  </tr>
  </c:if>
  
  <c:if test="${ not empty list }">
    <c:forEach items="${ list }" var="dto">
	    <tr align="center">
		   <td>${ dto.seq }</td>
		    <td>
		       <a href="/jspPro/board/content?seq=${ dto.seq }">${ dto.subject }</a>
		    </td>
		    <td> 
		       <a href="mailto:${ dto.email }">${ dto.name }</a>
		    </td> 
		    <td>${ dto.regdate }</td>
		    <td>${ dto.cnt }</td>
		</tr>
	  </c:forEach>	  
  </c:if> 
  </tbody>
  <tfoot>
    <tr>
      <td colspan="5" align="center">
         <div class="pagination">
		  <a href="#">&laquo;</a>
		  <a class="active" href="#">1</a>
		  <a href="#">2</a>
		  <a href="#">3</a>
		  <a href="#">4</a>
		  <a href="#">5</a>
		  <a href="#">6</a>
		  <a href="#">7</a>
		  <a href="#">8</a>
		  <a href="#">9</a>
		  <a href="#">10</a>
		  <a href="#">&raquo;</a>
		</div>
      </td>
    </tr>
  </tfoot>
 </table>
 
  <a href="/jspPro/board/regist">글쓰기</a><br>
</div>
 

<!-- regist=success -->
<c:if test="${  param.regist  eq 'success' }">
  <script>
    alert("글쓰기 완료!!!");
  </script>
</c:if>
<c:if test="${  param.delete  eq 'success' }">
  <script>
    alert("글삭제 완료!!!");
  </script>
</c:if>
</body>
</html>












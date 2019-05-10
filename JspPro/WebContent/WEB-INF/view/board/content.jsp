<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>jsp/servelet class - 0gJo 2019. 4. 30.-오후 12:06:50</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="">
<script>
   $(document).ready(function (){
	 
   });
</script>
<style type="text/css">
table, td, th{
border: solid 1px gray;
}
table {
	width: 600px;
}
</style>
</head>
<body>

<div align="center">
<h3>내용보기</h3>
<table>
   <tr>
       <td>이름</td>
       <td>${dto.name}</td>
       <td>등록일</td>
       <td>${dto.regdate}</td>
   </tr>
   <tr>
       <td>Email</td>
       <td><a href="mailto:${dto.email}">${dto.email}</a></td>
       <td>조회</td>
       <td>${dto.cnt}</td>
   </tr>
   <tr>
       <td>제목</td>
        <td colspan="3">${dto.subject}</td>
   </tr>
   <tr>
       <td colspan="4" style="padding:15px;">${dto.content}</td>
   </tr>
   <tr>
       <td colspan="4" align="center">
           <a href="/JspPro/board/edit?seq=${dto.seq}">수정하기</a>
          <a href="/JspPro/board/delete?seq=${dto.seq}">삭제하기</a>
           <a href="/JspPro/board/list">목록으로</a>
       </td>
   </tr>
</table>

</div>

</body>
</html>
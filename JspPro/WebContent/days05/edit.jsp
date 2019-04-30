<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>jsp/servelet class - 0gJo 2019. 4. 30.-오전 9:20:34</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="">
<script>
   $(document).ready(function (){
	 
   });
</script>
<style type="text/css">
table{
width: 600px;
}
</style>
</head>
<body>
<h2>수정하기</h2>
<form name="editForm" method="post" >
<table  width="500">
  <tr>
    <td colspan="2" align="center"><b>글을 수정합니다</b></td>
  </tr>
  <tr>
    <td align="center">이름</td>
    <td>
      <input type="text" name="name" size="15" value="${dto.name }">
    </td>
  </tr>
  <tr>
    <td align="center">Email</td>
    <td>
      <input type="text" name="email" size="50" value="${dto.email }">
    </td>
  </tr>
  <tr>
    <td align="center">제목</td>
    <td>
      <input type="text" name="subject" size="50" value="${dto.subject }">
    </td>
  </tr>
  <tr>
    <td align="center">내용</td>
    <td>
      <textarea name="content" cols="50" rows="10">"${dto.content }"</textarea>
   </td>
  </tr>
 <tr>
   <td align="center">HTML</td>
   <td>
   
      <input <%-- <c:if test="${dto.tag eq y }">checked</c:if>  --%> type="radio" name="tag" value="y" >적용
      <input type="radio" name="tag" value="n" >비적용
    <script type="text/javascript">
     $(":radio[value=${dto.tag}]").attr("checked", "checked") ;
      
     </script>
    
    </td>
  </tr>
  <tr>
    <td align="center">비밀번호</td>
    <td>
      <input type="password" name="password" size="15">
    </td>
  </tr>
  <tr>
    <td colspan="2" align="center">
      <input type="submit" value="작성 완료">&nbsp;&nbsp;
      <input type="button" onClick="javascript:history.back();" value="이전으로">
    </td>
  </tr>
</table>
<input type="hidden" name="seq" value="${dto.seq}">
</form>
<c:if test="${not empty dto.tag}"  >
<script type="text/javascript">
$("input [value='y']").click();

</script>
</c:if>


<script type="text/javascript">
$("[type='submit']").on("click", function() {
	
	alert("작성완료");
})
</script>
</body>
</html>
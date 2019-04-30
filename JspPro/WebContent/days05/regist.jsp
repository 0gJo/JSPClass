<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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

</head>
<body>
<form name="registForm" method= "post" >
 <table border cellspacing="0" width="500">
    <tr>
       <td colspan="2" align="center"><b>글을 적어주세요</b></td>
    </tr>
    <tr>
       <td align="center">이름</td>
       <td><input type="text" name="name" size="15"></td>
    </tr>
    <tr>
       <td align="center">비밀번호</td>
       <td><input type="password" name="password" size="15"></td>
    </tr>
    <tr>
       <td align="center">Email</td>
       <td><input type="text" name="email" size="50"></td>
    </tr>
    <tr>
       <td align="center">제목</td>
       <td><input type="text" name="subject" size="50"></td>
    </tr>
    <tr>
       <td align="center">내용</td>
       <td><textarea name="content" cols="50" rows="10"></textarea></td>
    </tr>
    <tr>
       <td align="center">HTML</td>
       <td>
          <input type="radio" name="tag" value="y" checked>적용
          <input type="radio" name="tag" value= "n">비적용
       </td>
    </tr>
    <tr>
       <td colspan="2" align="center">
          <input type="submit" value="작성 완료">&nbsp;&nbsp;&nbsp;
          <input type="reset" value="다시 작성">&nbsp;&nbsp;&nbsp;
          <a href="/JspPro/board/list">HOME</a>
       </td>
    </tr>
  </table>
   </form>
<script type="text/javascript">
$("[type='submit']").on("click", function() {
	
	alert("작성완료");
})

</script>
</body>
</html>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>jsp/servelet class - 0gJo 2019. 4. 25.-오후 2:30:44</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="">
<script>
   $(document).ready(function (){
	 
   });
</script>

</head>
<body>
<form action="ex05_ok.jsp" method="post">
이름 : <input autofocus="autofocus" type="text" name="name" value="홍길동"><br>
성별 : <input type="radio" name="gender" value="m" checked="checked" >남자
	  <input type="radio" name="gender" value="w">여자
	  <br>
좋아하는 동물 :
			<input type="checkbox" name="pet" value="dog" checked="checked" >강아지
			<input type="checkbox" name="pet" value="pig">돼지
			<input type="checkbox" name="pet" value="cat" checked="checked" >고양이
			<br>
기타 : <textarea rows="10" cols="30" name="etc">기타사항없음</textarea>
<br>
<input type="submit">
<input type="reset">
</form>
</body>
</html>
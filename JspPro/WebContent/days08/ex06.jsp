<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>jsp/servelet class - 0gJo 2019. 5. 7.-오전 11:17:18</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="">
<script>
   $(document).ready(function (){
	 
   });
</script>

</head>
<body>
<form action="ex06_ok.jsp">

<table border="1" style="width: 400px">
	<tr>
		<td>아이디</td>
		<td><input type="text" name="id" value="te1902"></td>
	</tr>
	<tr>
		<td>이름</td>
		<td><input type="text" name="name" value="0g"></td>
	</tr>
	<tr>
		<td>비밀번호</td>
		<td><input type="text" name="password" value="1234"></td>
	</tr>
	<tr>
		<td>이메일</td>
		<td><input type="text" name="email" value="te1902@gmail.com"></td>
	</tr>
	<tr>
		<td colspan="2">
		<input type="submit">
		<input type="reset">
		</td>
	</tr>
</table>


</form>
</body>
</html>
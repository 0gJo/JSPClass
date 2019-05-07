<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>jsp/servelet class - 0gJo 2019. 5. 7.-오전 10:20:48</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="">
<script>
   $(document).ready(function (){
	 
   });
</script>

</head>
<body>

<form action="<%= request.getContextPath()%>/days08/ex04_view.jsp">

보고싶은 페이지 선택 :
<select name="code">
<option value="A">A페이지</option>
<option value="B">B페이지</option>
<option value="C">C페이지</option>

<input type="submit" value="이동">

</select>

</form>
</body>
</html>
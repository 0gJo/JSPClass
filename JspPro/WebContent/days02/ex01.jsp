<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>jsp/servelet class - 0gJo 2019. 4. 25.-오전 10:27:50</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="">
<script>
   $(document).ready(function (){
	 
   });
</script>

</head>
<body>

<form action="method" method="get"> <!--http://localhost/JspPro/days02/method?msg=%ED%95%9C%EA%B8%80%EB%A1%9C+%EB%A9%94%EC%8B%9C%EC%A7%80..  -->

메시지 : <input type="text" name="msg" value="한글로 메시지..">
<input type="submit">
</form>


<form action="method" method="post"> <!--http://localhost/JspPro/days02/method?msg=%ED%95%9C%EA%B8%80%EB%A1%9C+%EB%A9%94%EC%8B%9C%EC%A7%80..  -->

메시지 : <input type="text" name="msg" value="한글로 메시지..">
<input type="submit">
</form>


</body>
</html>
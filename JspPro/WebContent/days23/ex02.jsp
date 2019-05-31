<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>jsp/servelet class - 0gJo 2019. 5. 31.-오전 9:10:18</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="">
<script>
   $(document).ready(function (){
	 
   });
</script>

</head>
<body>
<!-- ex02.jsp -->
<form action="ex02_01.jsp" 
 method="post" 
 enctype="multipart/form-data">
 
 이름 : <input type="text" name="name" value="홍길동" /><br>
 
 파일 1 : <input type="file" name="upload_1" /><br>
 파일 2 : <input type="file" name="upload_2" /><br>
 파일 3 : <input type="file" name="upload_3" /><br>
 
 <input type="submit" />
</form>
</body>
</html>
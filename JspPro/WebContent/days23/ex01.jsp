<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>jsp/servelet class - 0gJo 2019. 5. 30.-오전 9:20:49</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="">
<script>
   $(document).ready(function (){
	 
   });
</script>

</head>
<body>
<!-- enctype="multipart/form-data" : 스트림(Stream)방식으로 데이터 전송한다는 의미  -->
<form action="ex01_03.jsp" method="post" enctype="multipart/form-data">
이름 : <input type="text" name="name" value="홍길동"><br>
파일 : <input type="file" name="upload">
<input type="submit">
</form>
<!-- 폴더유무 확인해서 폴더(upload) 생성하는 자바코딩 -->
</body>
</html>
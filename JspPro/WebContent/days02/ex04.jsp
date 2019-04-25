<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>jsp/servelet class - 0gJo 2019. 4. 25.-오후 2:17:06</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="">
<script>
   $(document).ready(function (){
	 
   });
</script>

</head>
<body>

**클라이언트 IP 주소 : <%= request.getRemoteAddr() %><br>
요청한 정보 길이 : <%= request.getContentLength() %><br>
요청정보의 인코딩방식  : <%= request.getCharacterEncoding() %><br>
요청정보의 컨텐츠타입(text/html..) : <%= request.getContentType() %><br>
요청정보 프로토콜 : <%= request.getProtocol() %><br>
요청정보 전송방식 : <%= request.getMethod() %><br>

***url : <%= request.getRequestURL() %><br>
***uri : <%= request.getRequestURI() %><br>

***컨텍스트경로 : <%= request.getContextPath() %><br>
서버이름 : <%= request.getServerName() %><br>
포트: <%= request.getServerPort() %><br>

</body>
</html>
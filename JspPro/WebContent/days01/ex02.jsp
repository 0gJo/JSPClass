<%@ page import="java.time.LocalDateTime"%>
<%@ page import="java.util.Date"%>
<%@ page trimDirectiveWhitespaces="true"  contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%
// @위의것 : 페이지 지시자 (directive) : 페이지 정보를 알려줌.. 
	// <%= : 표현식
	// <%! 
 //스크립트릿 : 자바코딩
 Date now = new Date(); // 서버시간
 
 int age = 20;
 
 String today = getNow();
%>
<%! //선언문(변수(필드), 함수)
String name ="홍길동";

public String getNow(){
	
	return LocalDateTime.now().toString();
	
}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>jsp/servelet class - 0gJo 2019. 4. 24.-오전 10:03:55</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="">
<script>
   $(document).ready(function (){
	 
   });
</script>

</head>
<body>
날짜 : <input value="<%= now.toLocaleString()%>"><br>
이름 : <input value="<%= name%>"><br>
나이 : <input value="<%= age%>"><br>
today : <span><%= today %></span>
</body>
</html>
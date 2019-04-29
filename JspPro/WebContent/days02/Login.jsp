<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>jsp/servelet class - 0gJo 2019. 4. 25.-오후 6:13:30</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="">
<script>
   $(document).ready(function (){
	 
   });
</script>

</head>
<body>
<h3>Login.jsp</h3>
<form action="re"> <!-- JspPro/days02/re  -->
id : <input type="text" id="id" name="id" ><br>
pwd : <input type="text" id="pwd" name="pwd">
<input type="submit" value="로그인">
</form>

<%
// 기본페이지가 될수도 : http://localhost/days02/Login.jsp
// redirect의 결과 페이지가 될수도 : localhost/days02/Login.jsp?ok
//								  localhost/days02/Login.jsp?error
		
// 어쨌든 이 파일은 클라이언트의 URL 요청에 의해 응답하는 [서버에 존재하는 페이지(파일)]임
// ok, error 있는 경우는 재요청 받은 거고
// ok ? error? 여부 가져오기 --> ok , error 는 클라이언트에서 전달한 parameter(정보)

		
String ok = request.getParameter("ok");
String error = request.getParameter("error");

if(ok!=null){ //ok가 존재하면

%>
<p>로그인성공</p>
<%	
}else if(error!=null){ //error가 존재하면
%> 

<p>로그인실패</p>
<% 	
}
// 둘다 null 이면 --> 기본 로그인 페이지 (최초/redirect되기전)
%>


</body>
</html>
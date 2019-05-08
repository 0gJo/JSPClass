<%@page import="com.util.Cookies"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="ex01_cookieAuth.jspf" %>
<%
 //	로그인 인증을 거치면 auth 쿠키의 값 id
 /* String auth = null;
 Cookies cookies = new Cookies(request);
 if(cookies.exists("auth")){
	 auth = cookies.getValue("auth");
 }
  */
 String error = request.getParameter("error");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>jsp/servelet class - 0gJo 2019. 5. 8.-오전 9:05:15</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="">
<style type="text/css">
div{
	border: solid 1px gray;
	width: 300px;
	height: 100px;
	padding: 20px;
}
</style>
<script>
   $(document).ready(function (){
	 
   });
</script>

</head>
<body>
<h3>default(main) Page</h3>

<%
if(auth==null){ // 로그인 x
%>
<div id="logon">
<form action="ex01_logon.jsp">
아이디: <input name="id"	value="admin" type="text"><br>
비빌번호 : <input name="pass" value="1234" type="password">
<input type="submit" value="로그인">
<input type="button" value="회원가입"><br>

<% 
if(error!=null){
%>
<span>로그인 실패했습니다.</span>
<%	
}
%>
</form>
</div>
	
<%	
}else{
%>	
<div id="logout">
[<%= auth %>]님 환영합니다.<br>
<a href="ex01_logout.jsp">로그아웃</a>
</div>
<%	
}

%>

<a href="ex01_board.jsp">게시판</a><br>
<a href="ex01_notice.jsp">공지사항</a><br>
<%
if( auth !=  null ){
%>
<a href="#">일정관리</a><br>
<a href="#">자료실</a><br>
<a href="#">도움말</a><br>	
<%	
}
%>


<script type="text/javascript">
$("#logon span").fadeOut(5000);

</script>




</body>
</html>
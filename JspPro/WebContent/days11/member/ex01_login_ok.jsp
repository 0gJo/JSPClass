<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String referer =request.getHeader("Referer");

session.setAttribute("MEMBER", "0G");

/* if(referer.indexOf()){
	http://localhost/JspPro/days11/board/ex01_list.jsp
	http://localhost/JspPro/days11/member/ex01_loginForm.jsp
} */
if(referer.indexOf("ex01_loginForm.jsp")==-1){
	 referer= "http://localhost/JspPro/days11/ex01.jsp";
}
response.sendRedirect(referer);

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>jsp/servelet class - 0gJo 2019. 5. 10.-오전 10:19:45</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="">
<script>
   $(document).ready(function (){
	 
   });
</script>

</head>
<body>
<h3>Login</h3>
로그인 완료
</body>
</html>
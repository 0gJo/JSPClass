<%@page import="java.util.Date"%>
<%@page import="days08.MemberInfo"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>jsp/servelet class - 0gJo 2019. 5. 7.-오전 10:36:03</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="">
<script>
   $(document).ready(function (){
	 
   });
</script>

</head>
<body>

<%-- <jsp:useBean id="bean이름" class="자바빈클래스이름" scope="page"></jsp:useBean> --%>
<jsp:useBean id="info" class="days08.MemberInfo" scope="page"></jsp:useBean>
<jsp:setProperty value="te1902" property="id" name="info"/>
<jsp:setProperty value="0g" property="name" name="info"/>
<jsp:setProperty value="1234" property="password" name="info"/>
<jsp:setProperty value="te1902@gmail.com" property="email" name="info"/>
<jsp:setProperty value="<%= new Date() %>" property="registerDate" name="info"/>


아이디 : <jsp:getProperty property="id" name="info"/> <br>
이름 : <jsp:getProperty property="name" name="info"/> <br>
비밀번호 :<jsp:getProperty property="password" name="info"/> <br>
등록일 : <jsp:getProperty property="registerDate" name="info"/> <br>
이메일 : <jsp:getProperty property="email" name="info"/> <br>

<%-- 
<% 
	MemberInfo info = new MemberInfo();
	info.setId("admin");
	info.setEmail("te1902@gmail.com");
	info.setName("0g");
	info.setPassword("1234");
	info.setRegisterDate(new Date());
%>

아이디 : <%= info.getId() %> <br>
이름 : <%= info.getName() %> <br>
비밀번호 : <%= info.getPassword() %> <br>
이메일 : <%= info.getEmail() %> <br>
등록일 : <%= info.getRegisterDate() %> <br>
 --%>
 
 </body>
</html>
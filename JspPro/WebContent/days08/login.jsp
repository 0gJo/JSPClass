<%@page import="com.util.Cookies"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
// 로그인에 성공하면 특정이름을 갖는 쿠키를 생성한다

String id = request.getParameter("id");
String password = request.getParameter("password");

Cookies cookies = new Cookies(request);
//String cid = cookies.getValue("AUTH");

if(id.equals("0g")&&password.equals("1234")){
	if(!cookies.exists("AUTH")) { //로그인 한적없으면 
	Cookie cookie =	cookies.createCookie("AUTH", id, "/", -1);
	response.addCookie(cookie);
%>
로그인 성공
<%		
	}else{ // 로그인했으면
%>			
이미 로그인 ~
<%		
	}
}
%>
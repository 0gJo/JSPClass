<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String code = request.getParameter("code");
String viewPageURI = null;
if (code.equals('A')) {
/* 	viewPageURI = "/viewModule/a.jsp"; */
	viewPageURI = "/days08/ex01.jsp";
}else if (code.equals('B')) {
	viewPageURI = "/viewModule/b.jsp";
}
%>

<jsp:forward page="<%= viewPageURI%>"></jsp:forward>
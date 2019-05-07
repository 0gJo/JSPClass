<%@page import="oracle.net.aso.r"%>
<%@page import="com.util.Cookies"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%

	String cname = request.getParameter("cname");
	String cvalue = request.getParameter("cvalue");
	
	Cookies cookies = new Cookies(request);
	Cookie cookie = cookies.createCookie(cname, cvalue, "/", -1);
	response.addCookie(cookie);
	response.sendRedirect("ex08.jsp");
%>
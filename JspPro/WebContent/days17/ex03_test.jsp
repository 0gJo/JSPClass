<%@page import="java.util.Date"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%

	Thread.sleep(3000);
	request.setCharacterEncoding("UTF-8");
	String name = request.getParameter("name");
	Date now = new Date();
	String ajaxResult = String.format("안녕하세요 서버 ajax 처리된 %s님", name);
	
%>

<%=ajaxResult %>
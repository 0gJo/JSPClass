<%@page import="com.util.Cookies"%>
<%@page import="java.util.HashMap"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	HashMap<String,String> member = new HashMap<>();
	member.put("admin", "1234"); // 관리자
	member.put("hong", "1234"); // 일반회원
	member.put("kim", "1234"); // 일반회원
	
	String id = request.getParameter("id");
	String pass = request.getParameter("pass");
	
	if(id.equals("admin") && pass.equals("1234")){
		Cookie cookie = Cookies.createCookie("auth", "관리자", "/", -1);
		response.addCookie(cookie);
		response.sendRedirect("ex01_default.jsp");
		
	}else if(id.equals("hong") && pass.equals("1234")){
		Cookie cookie = Cookies.createCookie("auth", id, "/", -1);
		response.addCookie(cookie);
		response.sendRedirect("ex01_default.jsp");
		
	}else if(id.equals("kim") && pass.equals("1234")){
		Cookie cookie = Cookies.createCookie("auth", id, "/", -1);
		response.addCookie(cookie);
		response.sendRedirect("ex01_default.jsp");
		
	}else{
		response.sendRedirect("ex01_default.jsp?error");
	}
	
	
%>
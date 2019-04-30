<%@page import="java.util.Iterator"%>
<%@page import="java.util.Map.Entry"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.Enumeration"%>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
   request.setCharacterEncoding("UTF-8");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp/servlet class - k≡n¡k (2019. 4. 25.-오후 2:30:33)</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="">
<style>
</style>
<script>
   $(document).ready(function (){	  
	
   });
</script>
</head>
<body>
<%
  String name = request.getParameter("name");
  String gender = request.getParameter("gender").equals("m")? "남자":"여자";
  // checkbox  하나의 이름(pet)으로 여러 개 값이 넘겨질 때..
  String [] pets = request.getParameterValues("pet");
  
%>
이름 : <%= name %><br>
성별 : <%= gender %><br>
동물 : 
<%
     for( int i=0 ; i < pets.length;  i++){
%>
<%= pets[i] %> / 
<%    	   
     }
%>
<br>
<h3>파라미터명 모두 출력</h3>
<ul>
<%
    // 파라미터 명을 반환하는 메서드
    Enumeration<String> en = request.getParameterNames();

	while (en.hasMoreElements()) {
		String pname = en.nextElement();
%>
<li><%= pname %></li>
<%		
	}
%>
</ul>
<!-- 
http://localhost/jspPro/days02/ex05_ok.jsp
?
name=%EB%B0%98%EC%9E%A5%EA%B8%B8%ED%99%98
&
gender=m
&
pet=dog
&
pet=pig
&
etc=%EC%97%86%EB%8B%A4.
 -->

<%
  // Map   entry( key,value )
  Map<String, String[]> map= request.getParameterMap();
  Set<Entry<String, String[]>> set = map.entrySet();
  Iterator<Entry<String, String[]>> ir = set.iterator();
  while (ir.hasNext()) {
	  Entry<String, String[]> entry =  ir.next();
	  String pname = entry.getKey();
	  String [] pvalues = entry.getValue();
%>
<li>
    <%=  pname %> 
    - 
    <%
    for (int i = 0; i < pvalues.length; i++) {
		  String pvalue  = pvalues[i];
	%>
	<%= pvalue %> /
	<%	
	}
    %>
</li>
<%		
	}
%> 
 
</body>
</html>












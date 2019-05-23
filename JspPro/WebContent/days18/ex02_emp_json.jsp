<%@page import="com.util.ConnectionProvider"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page trimDirectiveWhitespaces="true" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
   Connection conn = null;
   PreparedStatement pstmt = null;
   ResultSet rs = null;
   String sql = "select empno, ename, sal "
			   + " from emp "
			   + " order by sal desc";
   
   String jsonData = "{";
   try{
     conn = ConnectionProvider.getConnection();
     pstmt = conn.prepareStatement(sql);
     rs = pstmt.executeQuery();
     
     jsonData += "\"emp\":[";
     while( rs.next() ){
    	int empno = rs.getInt("empno");
    	String ename = rs.getString("ename");
    	jsonData +="{\"empno\":"+empno+",\"ename\":\""+ename+"\"},";
     }
     jsonData = jsonData.substring(0,jsonData.length()-1);
     
     jsonData +="]";
     jsonData +="}";
     
   }catch(Exception e){
	   e.printStackTrace();
   }finally{
	   pstmt.close();
	   rs.close();
	   conn.close();
   }
%>
<%= jsonData %>



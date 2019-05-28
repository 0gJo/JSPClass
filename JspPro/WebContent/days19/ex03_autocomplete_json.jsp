<%@page import="net.sf.json.JSONArray"%>
<%@page import="net.sf.json.JSONObject"%>
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
   String searchWord = request.getParameter("searchWord");
   
   String sql = "select ename"
			   + " from emp "
			   + " where ename like '%"+ searchWord.toUpperCase()  +"%'"
			   + " order by ename"; 
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   JSONArray  jsonData = new JSONArray();
   
   try{
     conn = ConnectionProvider.getConnection();
     pstmt = conn.prepareStatement(sql);
     rs = pstmt.executeQuery(); 
     
     while( rs.next() ){ 
    	String ename = rs.getString("ename"); 
    	jsonData.add(ename);
     }
     
   }catch(Exception e){
	   e.printStackTrace();
   }finally{
	   pstmt.close();
	   rs.close();
	   conn.close();
   }
%>
<%= jsonData %>



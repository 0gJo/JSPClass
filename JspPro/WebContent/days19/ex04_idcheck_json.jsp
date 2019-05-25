<%@page import="net.sf.json.JSONObject"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.util.ConnectionProvider"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
   String empno = request.getParameter("empno");
   String sql = "select count(*) cnt from emp where empno = ?";
   // 0 »ç¿ë °¡´É   1 »ç¿ë ºÒ°¡´É
   Connection conn = null;
   PreparedStatement pstmt = null;
   ResultSet rs = null;
   JSONObject data = null;
   try{
	   conn = ConnectionProvider.getConnection();
	   pstmt = conn.prepareStatement(sql);
	   pstmt.setString(1, empno);
	   rs =  pstmt.executeQuery();
	   
	   rs.next();
	   int cnt = rs.getInt("cnt");	   
	   data = new JSONObject();
	   data.put("count", cnt); 
   }catch(Exception e){
	   e.printStackTrace();
   }finally{
	   try{
		   pstmt.close();		   rs.close();		   conn.close();
	   }catch(Exception e){}
   }
%>
<%= data %>









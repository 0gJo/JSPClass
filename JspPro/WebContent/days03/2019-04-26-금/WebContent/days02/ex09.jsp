<%@page import="java.sql.*"%>
<%@page import="com.util.DBConn"%>

<%@ page trimDirectiveWhitespaces="true" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp/servlet class - k≡n¡k (2019. 4. 25.-오후 4:27:50)</title>
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

<select id="deptno" name="denptno">
 <%
	StringBuffer sb = new StringBuffer();
		sb.append("select deptno, dname, loc  ");
		sb.append("from dept ");
		
	Connection conn =  DBConn.getConnection();
	
	try {
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(sb.toString());
		
		int deptno ;
		String dname, loc;
		
		while ( rs.next()   ) {
			 deptno = rs.getInt("deptno");
			 dname = rs.getString("dname");
			 loc = rs.getString("loc");
			 System.out.printf(
					 "%d\t%s\t%s\n"
					 , deptno
					 , dname
					 , loc
					 );
%>
  <option value="<%= deptno %>"><%= dname %></option>
<%			 
		} // while
		
		rs.close();     // (기억)
		stmt.close(); // (기억)
	} catch (SQLException e) {
		e.printStackTrace();
	}
	// 4
	DBConn.close();
%>
</select>

</body>
</html>












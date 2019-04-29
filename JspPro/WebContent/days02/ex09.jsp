<%@page import="com.util.DBConn"%>
<%@page import="java.sql.*"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>jsp/servelet class - 0gJo 2019. 4. 25.-오후 4:28:25</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="">
<script>
   $(document).ready(function (){
	 
   });
</script>

</head>
<body>


<select id="deptno" name="deptno">
<%

StringBuffer sb = new StringBuffer();
sb.append("select deptno, dname, loc ");
sb.append(" from dept ");

Connection conn =  DBConn.getConnection();

try {
	Statement stmt = conn.createStatement();
	ResultSet rs = stmt.executeQuery(sb.toString());
	int deptno ;
	String dname , loc;
	

	while ( rs.next()   ) {
		 deptno = rs.getInt("deptno");
		 dname = rs.getString("dname");
		 loc = rs.getString("loc");		
	
		 System.out.printf(
				 "%d %s\t%s\n"
				 , deptno
				 , dname
				 , loc
				);
		 
%>

<option value="<%=deptno %>" ><%=dname %></option>

<%	
	}//while 
	
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
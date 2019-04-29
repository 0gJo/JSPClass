<%@page import="java.util.Iterator"%>
<%@page import="com.util.DBConn"%>
<%@page import="days03.EmpDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% 
    String deptno = request.getParameter("deptno");
    
	String sql = "select empno, ename, job, hiredate, deptno from emp";
	if( deptno != null )    sql +=" where deptno = " + deptno;
	
	Connection con = null;
	Statement stmtEmp;
	ResultSet rsEmp;
	ArrayList<EmpDTO> list = null;
	
	try {
		con = DBConn.getConnection();
		stmtEmp = con.createStatement();
		rsEmp = stmtEmp.executeQuery(sql);
		if( rsEmp.next()){
			list = new ArrayList<>();
			do{
				// empno, ename, job, hiredate, deptno
				EmpDTO dto = new EmpDTO();
				dto.setEmpno( rsEmp.getInt("empno") );
				dto.setDeptno( rsEmp.getInt("deptno") );
				dto.setEname( rsEmp.getString("ename") );
				dto.setHiredate(rsEmp.getDate("hiredate"));
				dto.setJob( rsEmp.getString("job"));
				
				list.add(dto);
			}while(rsEmp.next());
		} 
		
		rsEmp.close();
		stmtEmp.close();
		DBConn.close();
	} catch (Exception e) {  // 
		e.printStackTrace();
	} 
	
	//System.out.println(">>> " + list);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>2018. 8. 22. 오전 10:37:03</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
$(document).ready(function(){
});
</script>
<style>
html {
  box-sizing: border-box;
}

*, *:before, *:after {
  box-sizing: inherit;
}

.column {
  float: left;
  width: 33.3%;
  margin-bottom: 16px;
  padding: 0 8px;
}

@media screen and (max-width: 650px) {
  .column {
    width: 100%;
    display: block;
  }
}

.card {
  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
}

.container {
  padding: 0 16px;
}

.container::after, .row::after {
  content: "";
  clear: both;
  display: table;
}

.title {
  color: grey;
}

.button {
  border: none;
  outline: 0;
  display: inline-block;
  padding: 8px;
  color: white;
  background-color: #000;
  text-align: center;
  cursor: pointer;
  width: 100%;
}

.button:hover {
  background-color: #555;
}
</style>
<style>
.chip {
  display: inline-block;
  padding: 0 25px;
  height: 50px;
  font-size: 16px;
  line-height: 50px;
  border-radius: 25px;
  background-color: #f1f1f1;
}

.chip img {
  float: left;
  margin: 0 10px 0 -25px;
  height: 50px;
  width: 50px;
  border-radius: 50%;
}
</style>
</head>
<body>
<h2>Responsive "Meet The Team" Section</h2>
<p>Resize the browser window to see the effect.</p>
<br>

<div class="row">
  <%
		   Iterator<EmpDTO> ir = list.iterator();
		   while( ir.hasNext() ){
			   EmpDTO dto = ir.next();
  %>
  <div class="column">
    <div class="card">
  
      <img src="/jspPro/images/img_avatar.png" alt="<%= dto.getEname() %>" style="width:100%">
      <div class="container">
        <h2><%= dto.getEname() %>(<%= dto.getEmpno() %>)</h2>
        <p class="title"><%= dto.getDeptno() %>-<%= dto.getJob() %></p>
        <p>Some text that describes me lorem ipsum ipsum lorem.</p>
        <p><%= dto.getHiredate() %></p>
        <p><button class="button">Contact</button></p>
        <div class="chip">
		  <img src="/jspPro/images/img_avatar.png" alt="Person" width="96" height="96">
		  <%= dto.getEname() %>
		</div>
      </div>
    </div>
  </div>
  <%	   
		   }
  %>
</div>

<hr>
<%-- 	
    <ol>		 
		<%
		   Iterator<EmpDTO> ir = list.iterator();
		   while( ir.hasNext() ){
			   EmpDTO dto = ir.next();
		%>
		<li><%= dto.getEmpno() %>/<%= dto.getEname() %>/<%= dto.getJob() %></li> 
		<%	   
		   }
		%>		 
	</ol>
--%>
	<!--
  1. days03.EmpDTO     jdbc 수업
  2. select empno, ename .... deptno from emp
  3. ArrayList<EmpDTO> list;
  4. body 
      <li>(empno(ename)/deptno/hiredate)</li>
 -->
</body>
</html>







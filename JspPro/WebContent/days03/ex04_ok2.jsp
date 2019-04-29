<%@page import="java.util.ArrayList"%>
<%@page import="days03.EmpDTO"%>
<%@page import="java.util.Iterator"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
ArrayList<EmpDTO> list = (ArrayList<EmpDTO>)request.getAttribute("list"); 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>jsp/servelet class - 0gJo 2019. 4. 26.-오후 2:34:31</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="">
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
<script>
   $(document).ready(function (){
	 
   });
</script>

</head>
<body>
<%
if(list==null){

%>	
사원이 존재하지 않습니다.
<% 	
}else{
%>	

<%

Iterator<EmpDTO> ir =   list.iterator();



while (ir.hasNext()) {
	EmpDTO dto =  ir.next();
%>
<div class="chip">
  <img src="/JspPro/images/img_avatar.png" alt="<%=dto.getEmpno() %>" width="96" height="96">
	 <%=dto.getEname() %>
</div>

<%	
}

%>


	
<% 	
}

%>







</body>
</html>
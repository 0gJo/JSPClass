<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>jsp/servelet class - 0gJo 2019. 4. 26.-오후 12:22:26</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="">
<script>
   $(document).ready(function (){
	 
   });
</script>

</head>
<body>

<% //스크립트릿에 선언 -> service method안에 지역변수로 잡힘
	String name = "길동이";
%>
<%!  // 선언부에 선언   -> 서블릿의 멤버변수(필드)로 잡힘.
	int age = 20;
	public void dispInfo(){
	System.out.println("dispinfo()");
		
	}
	
%>


<h3>이름은 : <%=name %> 입니다.</h3>

<%
	out.append("****test*****");
%>

</body>
</html>
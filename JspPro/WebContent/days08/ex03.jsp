<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>jsp/servelet class - 0gJo 2019. 5. 7.-오전 10:07:07</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="">
<script>
   $(document).ready(function (){
	 
   });
</script>

</head>
<body>
<%
	String name = request.getParameter("name");
	//1. redirect  // response.sendRedirect()
	
	//2. forwarding 
    //RequestDispatcher dispatcher = 
	
 	int age = 25;
	
	request.setAttribute("tel", "010-8382-5053");
 
%>

<jsp:forward page="ex03_02.jsp">
 <jsp:param value="seoul" name="addr"/>
 <jsp:param value="<%=age %>" name="age"/>
</jsp:forward>
</body>
</html>
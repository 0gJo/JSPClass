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
<a href="ex03.jsp?name=admin">jsp:forward</a>


<h3> name : ${param.name}</h3>
<h3> name :<%= request.getParameter("name") %></h3>
<h3> addr :<%= request.getParameter("addr") %></h3>
<h3> age :${param.age }</h3>
<h3> tel :${tel }</h3>
</body>
</html>
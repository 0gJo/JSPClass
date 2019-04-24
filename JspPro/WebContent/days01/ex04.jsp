<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>jsp/servelet class - 0gJo 2019. 4. 24.-오후 12:06:58</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="">
<script>
   $(document).ready(function (){
	 
	   $("#n2").on("keyup", function(event) {
	   	if (event.which == 13) {
			$("form").submit();
		}
		   
		   
	   })
   });
</script>

</head>
<body>
<%
	int n1 = Integer.parseInt(request.getParameter("n1"));
int n2 = Integer.parseInt(request.getParameter("n2"));
String op = request.getParameter("op");
//http://localhost/JspPro/days01/ex04.jsp?n1=10&op=-&n2=2
	double result = 0;
	switch(op){
	case "+":  result = n1+n2; break;
	case "-":result = n1-n2; break;
	case "*":result = n1*n2; break;
	case "/":result = n1/n2; break;
	
	}
	
	
%>
<form method="get">
<input type="text" id="n1" name="n1" autofocus="autofocus" value="<%=n1%>">
<select name="op" id="op">
	<option >+</option> <!--value 안주면 안에있는 text 값  -->
	<option >-</option>
	<option >*</option>
	<option >/</option>
</select>
<input id="n2" name="n2" value="<%=n2%>">
</form>
<p><%=result %></p>

<script type="text/javascript">

//+ - 연산자 유지되도록

console.log(document.getElementsByTagName("select")[0].options[0].innerText);

for (var i = 0; i < 4; i++) {
	var cal = document.getElementsByTagName("select")[0].options[i].innerText;
	if(cal == '<%=op%>') document.getElementsByTagName("select")[0].options[i].selected = true;  
}


</script>



</body>
</html>
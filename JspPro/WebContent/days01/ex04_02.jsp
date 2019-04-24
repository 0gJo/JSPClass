<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>jsp/servelet class - 0gJo 2019. 4. 24.-오후 5:06:36</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="">
<script>
   $(document).ready(function (){
	 // 클라이언트단에서 유효성검사..  후 submit
	 
	var num1 = $("#num1").val();
	var num2 = $("#num2").val();
	 
	$("form").on("submit", function() {
		
		var regex = /^[0-9]+$/;
		
		
		//alert(regex.test(num1));
		
		 if (!(regex.test(num1)&&regex.test(num2))) {
			alert("invalid iput");
			event.preventDefault();
		}		 
		
	})
	 
	 
   });
</script>

</head>
<body>
<%  /// 서버에서 처리해서 뿌려주기..
// 클라이언트에서 보낸 submit 정보 (string) 받기

int num1 = Integer.parseInt(request.getParameter("num1"));
String op = request.getParameter("op");
int num2 = Integer.parseInt(request.getParameter("num2"));

double result = 0 ;

switch(op){

case "+" : result = num1+num2; break;
case "-" : result = num1-num2;break;
case "*" : result = num1*num2;break;
case "/" : result = (double)num1/(double)num2; break;
}




%>

<form action="" >
<input type="text" id="num1" name="num1" value="<%=num1%>">
<select name="op" id="op">
	<option <% if(op.equals("+")){ %>selected<% } %> >+</option>
	<option >-</option>
	<option <% if(op.equals("*")){ %>selected<% } %>>*</option>
	<option >/</option>
</select>
<input type="text" id="num2" name="num2" value="<%=num2 %>" >
<button type="submit">submit</button>
</form>

<span><%=result %></span>
</body>
</html>
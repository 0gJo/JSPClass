<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>jsp/servelet class - 0gJo 2019. 4. 26.-오전 9:48:11</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="">
<script>
   $(document).ready(function (){
	 
   });
</script>

</head>
<body>
message : <input type="text" id="message" name="message" value="안녕하세요. 홍길동 입니다." /><br>
<a href="/JspPro/days03/forward.jsp">forward.jsp</a>


<script type="text/javascript">

$("a").on("click", function() {
	var location = "/JspPro/days03/forward.jsp"+"?message="+$("#message").val();
	
	$("a").attr("href", location );
	
})

</script>

</body>
</html>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% 
int n = 10;
String num = request.getParameter("num");
if(num != null) {
	
	n = Integer.parseInt(num);
	
}

 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>jsp/servelet class - 0gJo 2019. 4. 24.-오전 10:33:39</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="">
<script>
   $(document).ready(function (){
	   /* $("button").click(function (){
		   //alert("test")
		   //$("form:first").submit();
	   }); */
	   
	   
	   $( "form" ).submit(function( event ) {
		   
		   var pattern = /^\d+$/
		   //	alert(   pattern.test( $( "input:first" ).val() ) );
		   if (  pattern.test( $( "input:first" ).val() ) ) { 		     return;		   }
		  
		   $( "span" )
		   .text( "Not valid!" )
		   .css("color","red")
		   .show()
		   .fadeOut( 3000 );
		   
		   event.preventDefault();
		 });
   });
   
   
</script>

</head>
<body>
<form action="" > <!--action="" : 자기자신페이지 호출  -->
정수 입력 : <input id="num" name="num"  value=<%=n %>><!--server로 넘어갈떄 name 속성 중요 ?name=10  -->
<!-- ?name=10 : 쿼리문자열 -->
<br>
<span></span>
</form>
<%
int sum = 0;
for(int i=1; i<=n; i++){
	
	sum+=i;

%><%=i %><%if(i!=n){%>+	<% } %><%
}
%>=<%=sum%>


</body>
</html>
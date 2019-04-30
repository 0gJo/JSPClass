<%@ page trimDirectiveWhitespaces="true" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- 
?num=10  쿼리문자열( queryString )
 -->
 <%
     // request 요청 객체
     int n = 5;
     String num = request.getParameter("num") ;
     if( num != null )   n =  Integer.parseInt(  num  );
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp/servlet class - k≡n¡k (2019. 4. 24.-오전 10:33:28)</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="">
<style>
</style>
<script>
   $(document).ready(function (){
	   //
	   $("input:first").focus().select();
	   
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
<form action="">
 정수 입력 : <input type="text" id="num" name="num" value="<%= n %>" />
<!--  <button type="button">제출</button> -->
</form>
<br>
<span></span>
<br>
<%
   // 1+2+3+.. +10=55
   int sum = 0;
   for(int i=1; i<= n ; i++ ){
	   sum += i;
%><%= i %><% if( i != n ){%>+<%}%><%	   
	   System.out.print( i+"+" );
   }
   System.out.printf("=%d\n", sum);
%>=<%= sum %>

</body>
</html>












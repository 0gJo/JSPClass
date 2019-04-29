<%@page import="java.util.Date"%>
<%@ page contentType="text/html; charset=iso-8859-1" %>
<!-- ISO-8859-1 :     서유럽 문자, 알파벳만 포함(  한글 X ) -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp/servlet class - k≡n¡k (2019. 4. 24.-오후 2:34:04)</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="">
<style>
</style>
<script>
   $(document).ready(function (){	  
   });
</script>
</head>
<body>
<%
   Date now = new Date();
%>
현재 시각 : <%= now %>
</body>
</html>












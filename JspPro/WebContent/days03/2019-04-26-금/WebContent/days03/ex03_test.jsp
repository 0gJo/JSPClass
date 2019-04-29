<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp/servlet class - k≡n¡k (2019. 4. 26.-오후 12:22:12)</title>
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
    String name = "길동이";
%>

<%!
    int age = 20;
    public void dispInfo(){
    	System.out.println("> dispInfo() ~");
    }
%>

<h3>이름은 : <%= name %> 입니다.</h3>

<%
    // [jsp 기본 객체]
    // 1. request 
    // 2. response
    out.append("***test***");
%>

</body>
</html>












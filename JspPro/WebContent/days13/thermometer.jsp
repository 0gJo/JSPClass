<%@page import="days13.Thermometer"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% 
 Thermometer thermometer = new Thermometer();
request.setAttribute("t", thermometer);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>jsp/servelet class - 0gJo 2019. 5. 14.-오후 2:43:18</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="">
<script>
   $(document).ready(function (){
	 
   });
</script>

</head>
<body>
${t.setCelsius('서울',15.7)}
서울 온도 : 섭씨 ${t.getCelsius('서울')}도 / 화씨 ${t.getFahrenheit('서울')}

<br>
정보 : ${t.info } <!--인자값이 없는 경우에만 이렇게 사용가능.. -->

</body>
</html>
<%@page import="java.util.Date"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>jsp/servelet class - 0gJo 2019. 5. 22.-오전 11:03:20</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="">
<script>
$(document).ready(function(){
	// jquery.ajax()
	$("#jsontest").click(function (){
	 
		$.ajax({
			url:"ex03_autocomplete_json.jsp"
			,dataType:"json"
			,type:"get"
			,cache:false //  기억*** : 항상 새로 읽어오겠다 
			,success:function(data){ // callback 함수 : 성공했을때 
				$(data.emp).each(function (index, e){
					var info =  e.empno+" / " + e.ename ;
					$("#demo").append("<div>"+ info +"</div>");
				});
			}
		    ,error:function(){
		    	alert("에러~~~~")
		    } 
		});
	});
	
});
</script>

</head>
<body>
<%
    Date now = new Date();
%>
<h3><%= now.toLocaleString() %></h3>
<hr>
<input type="button" id="jsontest" value="jquery+ajax+json" />
<div id="demo"></div>
</body>
</html>
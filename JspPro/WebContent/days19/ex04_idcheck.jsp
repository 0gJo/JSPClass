<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp/servlet class - k≡n¡k (2019. 5. 23.-오전 10:24:46)</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="">
<style>
</style>
<script>
$(document).ready(function(){
	$('#empnoCheck').click(function (){
		
		var params = $('form').serialize();
		//alert( params );
		$.ajax({
			url:"ex04_idcheck_json.jsp"
			, dataType:"json"
			, type:"get"
			, data: params
			, cache:false
			, success:function (data){
				if( data.count == 0){ // 사용가능
					$("#notice")
				         .css("color","black")
				         .text("사용가능한 empno 입니다.");
				}else{
					$("#notice")
			         .css("color","red")
			         .text("이미 사용 중인 empno 입니다.");
				}
			}
		}); // ajax
	}); // click
});
</script>
</head>
<body>
 <!-- emp 테이블 사원 추가 -->
<form action="">
  deptno : <input type="text" name="deptno" value="10" /><br>
  empno : <input type="text" name="empno" value="7369" />
  <input type="button" id="empnoCheck" value="empno중복체크" />
  <p id="notice"></p>
  <br>
  ename : <input type="text" name="ename" value="" /><br>
  <input type="submit" />
</form> 
</body>
</html>











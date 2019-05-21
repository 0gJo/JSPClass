<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>jsp/servelet class - 0gJo 2019. 5. 21.-오전 10:40:58</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<script src ="httpRequest.js" ></script>

<link rel="stylesheet" type="text/css" href="">
<script>
	var timer;
	function getEmpTopFive () {
		var url = "ex04_empTopFive.jsp";
		var params = null;
		var method = "GET";
		
		sendRequest(url, params, callback, method);
		
		timer = setTimeOut(getEmpTopFive,4000);
		
		
	}

	   function callback(){
		   // 404, 500    200
		   if( httpRequest.readyState == 4  ){  // 데이터 얻어왔다..
			   if( httpRequest.status == 200 ){
					document.getElementById("demo").innerHTML =
						httpRequest.responseText;
			   
			   }else{
				   alert( "> Ajax 요청 실패 " +  httpRequest.status );
			   }
		   }
	   }
	
	
	
</script>

</head>
<body>

<input type="button" value="empTop5" onclick="getEmpTopFive()">
<hr>
<div id="demo"></div>

</body>
</html>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>jsp/servelet class - 0gJo 2019. 5. 15.-오후 3:27:01</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="">
<script>
   $(document).ready(function (){
	 
   });
</script>

</head>
<body>
<c:set var="str1" value="Functions<태그>를 사용합니다"/>
<c:set var="str2" value="사용"/>
<c:set var="tokens" value="1,2,3,4,5,6,7,8,9,10" />


length(str1) : ${fn:length(str1) }
toUpperCase(str1) : ${fn:toUpperCase(str1) }
${fn:substring(str1,3,6) }
${fn:substringAfter(str1,str2) }

${fn:trim(str1) }
${fn:replace(str1," ","-") }
${fn:indexOf(str1,str2) }
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000



</body>
</html>
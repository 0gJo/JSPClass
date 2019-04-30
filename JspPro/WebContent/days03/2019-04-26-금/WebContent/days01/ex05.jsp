<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp/servlet class - k≡n¡k (2019. 4. 24.-오후 2:11:44)</title>
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
<!--            EL -->
n1 + n2 =  ${ param.n1 + param.n2 }

<!-- JSP 액션 태그 -->
<%-- <jsp:attribute name=""></jsp:attribute> --%>

<%--  JSP 주석처리
	<%
	   int n1 = Integer.parseInt( request.getParameter("n1")  );
	   int n2 = Integer.parseInt( request.getParameter("n2")  );
	%>
	
	n1 + n2 = <%= n1+n2 %>
 --%>
<!-- p51 캐릭터 셋 -->
<!-- page 디렉티브 (지시자) -->
<!-- 
JSP 페이지의 구성요소
1. 디렉티브 p53
    ㄱ. page 지시자
    ㄴ. taglib 지시자    * : jsp페이지에서 사용할 태그 라이브러리 지정한다. 
    ㄷ. include 지시자  * : jsp페이지의 특정 영역에 다른 문서를 포함시킨다.
    
2. 스크립트 : 스크립트릿, 표현식, 선언부
3. 표현언어(EL)                         *
4. 기본 객체 : request, response, session, application, page 등등
5. 정적인 데이터                              *
6. 표준 액션 태그 ( Action Tag)       * 
7. 커스텀 태그와 JSTL                   *
 -->
</body>
</html>












# Ajax

#### Ajax (Asynchronous Javascript And Xml)

XML 데이터를 자바스크립트를 사용해서, 비동기적으로 처리하는 기술

(JSON, Text 데이터도 가능)

비동기적? 전체페이지를 요청하지 않고 변화가 필요한 부분만 서버에 요청하여 업데이트하는 것

#### 장점

쓰레드 개념 (각자가 다른 서버에 요청하고 각자 일을 처리할 수 있다.)  / 성능향상

#### 단점 

보안 / 오픈소스 / 브라우저 별 다른 코딩

#### 활용

회원가입  / 우편번호 검색 / ID 중복체크.. 등

#### 방법(순서)

Ajax 처리 객체 : XMLHttpRequest 객체 (브라우저에서 제공)

1. 객체얻어오기

2. 요청(어떻게할건지)설정 + 요청 (GET/POST)

3. Callback함수 호출{ 

   (요청하고 왔는지 + 잘 수행했는지 체크후 ) **결과받아서 처리**

   (주로, 요청한페이지의 결과를 해당 페이지에서 출력)  {xml, json, text--->??}}

httpRequest.resonseText

httpRequest.responseXML 

httpRequest.responseBody (이진문자열)

요청한 jsp 페이지에서 출력한 결과물(responseText)을 가져와서 출력

* GET방식 Ajax

ㄱ. 객체 얻어오기  ( XMLHttpRequest 객체)

etc : new XMLHttpRequest()

IE : new ActiveXObject()

ㄴ.  설정 : XMLHttpRequest 객체.open("GET","/test.jsp?id=admin",true)

​																		     (요청방식, 요청자원, 비동기처리여부)

ㄷ.  실제 요청 : XMLHttpRequest 객체.send(null); 

* POST방식 Ajax

ㄱ. 객체 얻어오기  ( XMLHttpRequest 객체)

ㄴ.  설정 : XMLHttpRequest 객체.open("GET","/test.jsp",true)

​																		     (요청방식, 요청자원, 비동기처리여부)

ㄷ.  실제 요청 : XMLHttpRequest 객체.send(id=admin); 



ㄹ. 콜백함수 호출 



#### 예시

요청하는페이지.jsp

```java
<%@page import="java.util.Date"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>jsp/servelet class - 0gJo 2019. 5. 21.-오전 10:24:57</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="">
<script>
 
	   var httpRequest; //  변수 선언
	   function getXMLHttpRequest(){   // 함수
	       if( window.ActiveXObject ){   // IE
	     	  try{
	     	     return new ActiveXObject("Msxml2.XMLHTTP");   // 
	     	  }catch(e){
	     		  try{
	     		    return new ActiveXObject("Microsoft.XMLHTTP");
	     		  }catch(e){
	     			  return null;
	     		  }
	     	  }
	       }else if( window.XMLHttpRequest ){
	     	  return new XMLHttpRequest();
	       }else{
	     	  return null;
	       }
	   }  
	   
	// 비동기적으로 서버의 자원( jsp 페이지 ) 을 요청.
	   function jsjax_click( ){
		var name = document.getElementById("name").value;
		var url = "ex03_test.jsp?name="+name;
		
		
		   // 1. XMLHttpRequest 요청 객체
		   httpRequest = getXMLHttpRequest();
		   // 2. 설정 open()
		   httpRequest.onreadystatechange = callback;
		   httpRequest.open("GET", url , true);
		   // 3. 요청 send()
		   httpRequest.send(null);
	   }  
	   
	   // 콜백함수(  callback function )
	   function callback(){
		   // 404, 500    200
		   if( httpRequest.readyState == 4  ){  // 데이터 얻어왔다..
			   //The state of the request. (0=unsent, 1=opened, 2=headers_received, 3=loading, 4=done)
			   if( httpRequest.status == 200 ){
				   //The status of the response to the request. This is the HTTP result code
				   //resonseText 문자열
				   //responseXML XML
				   //responseBody   이진코드문자열
				   alert( httpRequest.responseText );
				   document.getElementById("demo").innerHTML= httpRequest.responseText;
			   }else{
				   alert( "> Ajax 요청 실패 " +  httpRequest.status );
			   }
		   }
	   }

</script>

</head>
<body>
<% 
Date now = new Date();
%>
현재 = <%= now.toLocaleString() %>
<br>
<form action="" id="form1" name="form1" >
	name : <input type="text" id="name" name="name" value="홍길동">
<br>
<input type="button" value="javascript ajax" onclick="jsjax_click();">
<div id="demo"></div>
</form>

</body>
</html>
```



요청받는페이지.jsp

```java
<%@page import="java.util.Calendar"%>
<%@page import="com.util.ConnectionProvider"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page trimDirectiveWhitespaces="true" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
  Connection conn = null;
  PreparedStatement pstmt = null;
  ResultSet rs = null;
  String sql = "with temp as ("
		  +"   select empno, ename, sal, "
		  +"          rank() over(order by sal desc) r "
		  +"   from emp "
		  +")"
		  +" select * from temp "
		  +" where r <= 5 ";
  
  Calendar cal = Calendar.getInstance();
  String now = String.format("%tT", cal);
  
  String responseText = "<h3>" + now + "</h3>";
  try{
	  conn =  ConnectionProvider.getConnection();
	  pstmt = conn.prepareStatement(sql);
	  rs =  pstmt.executeQuery();
	  while(rs.next()){
		  int rank = rs.getInt("r");
		  int empno = rs.getInt("empno");
		  String ename = rs.getString("ename");
		  double sal = rs.getDouble("sal");
		  responseText +=String.format("[%d] %d %s\t\t(%.2f)<br>"
				  , rank, empno, ename, sal);
	  } 
  }catch(Exception e){
	  e.printStackTrace();
  }finally{
	  try{
		  pstmt.close();rs.close();conn.close();
	  }catch(Exception e){}
  }
%>
<%= responseText %>

```


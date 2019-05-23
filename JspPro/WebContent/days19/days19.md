## JQuery를 이용한 Ajax 처리 : autocomplete기능 , id중복체크

jquery json 사용을 위한 6개의 관련 library 파일을 추가

***serialize() : 많은양의 input parameter을 자동생성해주는 것 

ajax처리한 버튼은 이벤트 걸때 .click(){} (x)  --> .on("click",fucntion(){})

openAPI(구글맵), 차트, 파일업/다운로드

####  autocomplete 기능

ex03_autocomplete.jsp (응답페이지)

```jsp
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>jsp/servelet class - 0gJo 2019. 5. 23.-오전 9:50:42</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script>
  $( function() {
/*     var availableTags = [
      "ActionScript",
      "AppleScript",
      "Asp",
      "Scheme"
    ];
    $( "#tags" ).autocomplete({
      source: availableTags
    }); */
    
   var params =  $("#form1").serialize();
    
    $("#tags").keyup(function() {
		$.ajax({
			url:"ex03_autocomplete_json.jsp"
			,dataType:"json"
			,type:"get"
			,data : params
			,cache:false //  기억*** : 항상 새로 읽어오겠다 
			,success:function(data){ // callback 함수 : 성공했을때 
				console.log(data);
				  $( "#tags" ).autocomplete({
				      source: data
				    }); 
			}
		    ,error:function(){
		    	alert("에러~~~~")
		    } 
		});
    })
    
    
  } );
  </script>
</head>
<body>
 <form id="form1" >
<div class="ui-widget">
  <label for="tags">Tags: </label>
  <input id="tags" name="searchWord">
</div>
</form>
</body>
</html>
```

ex03_autocomplete_json.jsp ( json text을 출력해주는 서버페이지)



```jsp
<%@page import="net.sf.json.JSONArray"%>
<%@page import="net.sf.json.JSONObject"%>
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
   String searchWord = request.getParameter("searchWord");
   
   String sql = "select ename"
			   + " from emp "
			   + " where ename like '%"+ searchWord.toUpperCase()  +"%'"
			   + " order by ename"; 
   
   JSONArray  jsonData = new JSONArray();
   
   try{
     conn = ConnectionProvider.getConnection();
     pstmt = conn.prepareStatement(sql);
     rs = pstmt.executeQuery(); 
     
     while( rs.next() ){ 
    	String ename = rs.getString("ename"); 
    	jsonData.add(ename);
     }
     
   }catch(Exception e){
	   e.printStackTrace();
   }finally{
	   pstmt.close();
	   rs.close();
	   conn.close();
   }
%>
<%= jsonData %>



```



#### id중복체크

```jsp
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











```



```jsp                              
<%@page import="net.sf.json.JSONObject"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.util.ConnectionProvider"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
   String empno = request.getParameter("empno");
   String sql = "select count(*) cnt from emp where empno = ?";
   // 0 »ç¿ë °¡´É   1 »ç¿ë ºÒ°¡´É
   Connection conn = null;
   PreparedStatement pstmt = null;
   ResultSet rs = null;
   JSONObject data = null;
   try{
	   conn = ConnectionProvider.getConnection();
	   pstmt = conn.prepareStatement(sql);
	   pstmt.setString(1, empno);
	   rs =  pstmt.executeQuery();
	   
	   rs.next();
	   int cnt = rs.getInt("cnt");	   
	   data = new JSONObject();
	   data.put("count", cnt); 
   }catch(Exception e){
	   e.printStackTrace();
   }finally{
	   try{
		   pstmt.close();		   rs.close();		   conn.close();
	   }catch(Exception e){}
   }
%>
<%= data %>

```


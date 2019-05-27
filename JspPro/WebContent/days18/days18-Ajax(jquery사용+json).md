## JQuery를 이용한 Ajax 처리 (JSON 데이터 사용 )

## JSON 

javascript 객체와 JSON 표기법

JS Object prototype

JS JSON

: 자바스크립트를 사용한 객체 표기법

**데이터를 저장하교 교환하기 위해 사용**하는 텍스트

JSON은 텍스트이며 모든 JavaScript 객체를 JSON으로 변환하고 JSON을 서버로 보낼 수 있습니다.

## 데이터 전송

JavaScript 객체에 저장된 데이터가있는 경우 객체를 JSON으로 변환하여 서버로 보낼 수 있습니다.

```javascript
var myObj = {name: "John", age: 31, city: "New York"};// Javascript 객체
var myJSON = JSON.stringify(myObj); //javascript -> JSON
window.location = "demo_json.php?x=" + myJSON;
```



## 데이터 수신

JSON 형식의 데이터를 받으면 JavaScript 객체로 변환 할 수 있습니다.

```javascript
var myJSON = '{"name":"John", "age":31, "city":"New York"}'; //Json 객체
var myObj = JSON.parse(myJSON); //JSON -> javascript
document.getElementById("demo").innerHTML = myObj.name;
```

Json 객체 

```javascript
{"name":"John", "age":31, "city":"New York"}
 //string : value
```

반드시 "쌍따옴표" 사용해야 한다.

value 에 들어갈 수 있는 데이터타입

* object
* array
* string
* number
* "true"
* "false"
* "null"

XMLHttpRequest를 사용하여 서버에서 데이터 가져 오기 :

```javascript
var xmlhttp = new XMLHttpRequest();
xmlhttp.onreadystatechange = function() {
  if (this.readyState == 4 && this.status == 200) {
    var myObj = JSON.parse(this.responseText); //JSON 표기법으로 된 text를 서버에서 가져옴
      											// JSON 객체일수도, 배열일수도..
    document.getElementById("demo").innerHTML = myObj.name;
  }
};
xmlhttp.open("GET", "json_demo.txt", true);
xmlhttp.send();
```

서버에서 SCRIPT처리한뒤 가져오지 말고, 가져와서 SCRIPT 처리하자.





문자열을 함수로 변환 :

```javascript
var text = '{ "name":"John", "age":"function () {return 30;}", "city":"New York"}';
var obj = JSON.parse(text);
obj.age = eval("(" + obj.age + ")");
			    // 선언부 문자열
document.getElementById("demo").innerHTML = obj.name + ", " +obj.age();
```



## 개체 속성 삭제

```javascript
delete myObj.cars.car2;
```



```javascript
<!DOCTYPE html>
<html>
<body>

<h2>Use the HTTP method POST to send data to the PHP file.</h2>

<p id="demo"></p>

<script>
var obj, dbParam, xmlhttp, myObj, x, txt = "";
obj = { "table":"customers", "limit":10 };
dbParam = JSON.stringify(obj);
xmlhttp = new XMLHttpRequest();
xmlhttp.onreadystatechange = function() {
  if (this.readyState == 4 && this.status == 200) {
    myObj = JSON.parse(this.responseText); //responseText : 
      JSON 배열
    for (x in myObj) {
      txt += myObj[x].name + "<br>";
    }
    document.getElementById("demo").innerHTML = txt;
  }
};
xmlhttp.open("POST", "json_demo_db_post.php", true);
xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
xmlhttp.send("x=" + dbParam);
</script>

<p>Try changing the "table" property from "customers" to "products".</p>

</body>
</html>
```



Ajax와 관련된 jQuery 함수들 : <https://api.jquery.com/category/ajax/> 

날코딩 보다 간편하니 사용하자



#### 예제

emp_json.jsp (서버측 jsp 페이지)

```jsp
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
   String sql = "select empno, ename, sal "
			   + " from emp "
			   + " order by sal desc";
   
   String jsonData = "{";
   try{
     conn = ConnectionProvider.getConnection();
     pstmt = conn.prepareStatement(sql);
     rs = pstmt.executeQuery();
     
     jsonData += "\"emp\":[";
     while( rs.next() ){
    	int empno = rs.getInt("empno");
    	String ename = rs.getString("ename");
    	jsonData +="{\"empno\":"+empno+",\"ename\":\""+ename+"\"},";
     }
     jsonData = jsonData.substring(0,jsonData.length()-1);
     
     jsonData +="]";
     jsonData +="}";
     
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

emp_test.jsp (클라이언트에 응답하는 jsp 페이지)

```jsp
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
			url:"ex02_emp_json.jsp"
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
```



#### Advanced REST client 설치

: ajax 처리 과정 볼 수 있는 Chrome 개발자 앱 



json-lib library 사용하여 json 텍스트 만들기






<%@page import="java.util.ArrayList"%>
<%@page import="days03.EmpDTO"%>
<%@page import="java.util.Iterator"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
/* ArrayList<EmpDTO> list = (ArrayList<EmpDTO>)request.getAttribute("list");  */
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>jsp/servelet class - 0gJo 2019. 4. 26.-오후 2:34:31</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="">
<style>
html {
  box-sizing: border-box;
}

*, *:before, *:after {
  box-sizing: inherit;
}

.column {
  float: left;
  width: 33.3%;
  margin-bottom: 16px;
  padding: 0 8px;
}

@media screen and (max-width: 650px) {
  .column {
    width: 100%;
    display: block;
  }
}

.card {
  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
}

.container {
  padding: 0 16px;
}

.container::after, .row::after {
  content: "";
  clear: both;
  display: table;
}

.title {
  color: grey;
}

.button {
  border: none;
  outline: 0;
  display: inline-block;
  padding: 8px;
  color: white;
  background-color: #000;
  text-align: center;
  cursor: pointer;
  width: 100%;
}

.button:hover {
  background-color: #555;
}
</style>
<script>
   $(document).ready(function (){
	 
   });
</script>

</head>
<body>

<%-- 
<%
if(list==null){

%>	
사원이 존재하지 않습니다.
<% 	
}else{
%>	

 --%>


<c:choose>

<c:when test="${list eq null }">

사원이 존재하지 않습니다.

</c:when>

<c:otherwise>
<c:forEach items="${list}" var="dto" >
<div class="row"> 
  <div class="column">
    <div class="card">
      <img src="/JspPro/images/img_avatar2.png" alt="사원명" style="width:100%">
      <div class="container">
        <h2>${dto.ename }(${dto.empno })</h2>
        <p class="title">${dto.deptno }-${dto.job }</p>
        <p>Some text that describes me lorem ipsum ipsum lorem.</p>
        <p>${dto.hiredate }</p>
        <p><button class="button">Contact</button></p>
      </div>
    </div>
  </div> 
</div>

</c:forEach>

</c:otherwise>

</c:choose>
<%-- 	

<% 	
}

%>
 --%>






</body>
</html>
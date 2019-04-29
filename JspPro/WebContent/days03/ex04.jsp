<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>jsp/servelet class - 0gJo 2019. 4. 26.-오후 2:01:16</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="">
<style>
.chip {
  display: inline-block;
  padding: 0 25px;
  height: 50px;
  font-size: 16px;
  line-height: 50px;
  border-radius: 25px;
  background-color: #f1f1f1;
}

.chip img {
  float: left;
  margin: 0 10px 0 -25px;
  height: 50px;
  width: 50px;
  border-radius: 50%;
}
</style>
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
<div class="chip">
  <img src="/JspPro/images/img_avatar.png" alt="Person" width="96" height="96">
	  사원명
</div>
<div class="chip">
  <img src="/JspPro/images/img_avatar2.png" alt="Person" width="96" height="96">
	  사원명
</div>
<!-- value: pk값 -->

<br style="clear: both;" >




<form action="" >
<select id="deptno" name="deptno" >

<option >선택하세요</option>

<option <c:if test="${list[0].deptno == 10  }">selected</c:if> value="10">ACCOUNTING</option>
<option <c:if test="${list[0].deptno == 20  }">selected</c:if> value="20">REARCH</option>
<option <c:if test="${list[0].deptno == 30  }">selected</c:if> value="30">SALES</option>
<option <c:if test="${list[0].deptno == 40  }">selected</c:if> value="40">OPERATIONS</option>
<option <c:if test="${list[0].deptno == 50  }">selected</c:if> value="50">영업부</option>

</select>
</form>
<!-- http://localhost/JspPro/days03/ex04_emp?deptno=30 -->

<script type="text/javascript">
$("#deptno").change(function() {
	//console.log($(this).val());
	//var deptno = $(this).val();
	//  서블릿의 url pattern : /days03/ex04_emp
	$("form")
			.attr("action", "ex04_emp")  //Ex04_Emp.java 서블릿
			.submit();
	
})

</script>


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

</body>
</html>
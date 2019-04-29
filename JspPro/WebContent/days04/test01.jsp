<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>jsp/servelet class - 0gJo 2019. 4. 29.-오전 9:05:22</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<style>
/* The container */
.container {
  display: block;
  position: relative;
  padding-left: 35px;
  margin-bottom: 12px;
  cursor: pointer;
  font-size: 22px;
  -webkit-user-select: none;
  -moz-user-select: none;
  -ms-user-select: none;
  user-select: none;
}

/* Hide the browser's default checkbox */
.container input {
  position: absolute;
  opacity: 0;
  cursor: pointer;
  height: 0;
  width: 0;
}

/* Create a custom checkbox */
.checkmark {
  position: absolute;
  top: 0;
  left: 0;
  height: 25px;
  width: 25px;
  background-color: #eee;
}

/* On mouse-over, add a grey background color */
.container:hover input ~ .checkmark {
  background-color: #ccc;
}

/* When the checkbox is checked, add a blue background */
.container input:checked ~ .checkmark {
  background-color: #2196F3;
}

/* Create the checkmark/indicator (hidden when not checked) */
.checkmark:after {
  content: "";
  position: absolute;
  display: none;
}

/* Show the checkmark when checked */
.container input:checked ~ .checkmark:after {
  display: block;
}

/* Style the checkmark/indicator */
.container .checkmark:after {
  left: 9px;
  top: 5px;
  width: 5px;
  height: 10px;
  border: solid white;
  border-width: 0 3px 3px 0;
  -webkit-transform: rotate(45deg);
  -ms-transform: rotate(45deg);
  transform: rotate(45deg);
}
</style>
<!-- table style -->
<style>
#employees {
  font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 100%;
}

#employees td, #employees th {
  border: 1px solid #ddd;
  padding: 8px;
}

#employees tr:nth-child(even){background-color: #f2f2f2;}

#employees tr:hover {background-color: #ddd;}

#employees th {
  padding-top: 12px;
  padding-bottom: 12px;
  text-align: left;
  background-color: #4CAF50;
  color: white;
}
</style>
<!-- exec style -->
<style>
.exec {
  display: block;
  width: 100%;
  border: none;
  background-color: #4CAF50;
  color: white;
  padding: 14px 28px;
  font-size: 16px;
  cursor: pointer;
  text-align: center;
}

.exec:hover {
  background-color: #ddd;
  color: black;
}
</style>

<link rel="stylesheet" type="text/css" href="">
<script>
   $(document).ready(function (){
	 
   });
</script>

</head>
<body>
<h3>부서 선택 :</h3>  

<form method="get" action="/JspPro/employees.do">
<c:forEach items="${dlist}" var="ddto">

<label class="container">${ddto.dname } 
<%--   <input <c:if test="${elist[0].deptno == ddto.deptno }">checked</c:if> name="dept"  type="checkbox" value="${ddto.deptno }"  > --%>
  <input  name="dept"  type="checkbox" value="${ddto.deptno}"  >
  <span class="checkmark"></span>
</label>
</c:forEach>
<button type="submit" class="exec">확인 버튼</button>
</form>



<h3>사원 출력</h3>
<table id="employees">
  <thead>
  <tr>
  <th><input type="checkbox"> </th>
    <th>no</th>
    <th>deptno</th>
    <th>dname</th>
    <th>empno</th>
    <th>ename</th>
    <th>mgr</th>
    <th>job</th>
    <th>hiredate</th>
    <th>sal</th>
    <th>comm</th>
    <th>pay</th>
  </tr>
  </thead>
  <tbody>
  
  <c:choose>
  <c:when test="${empty elist}">
  <tr>
  <td colspan="11" style=" text-align: center;">결과가 없습니다.</td>
  </tr>
  </c:when>
  
  
  <c:otherwise>
  <c:forEach items="${elist }" var="edto"  varStatus="status" >
 
  <tr>
   <td><input type="checkbox"> </td>
  <td>${status.count }</td>
  <td>${edto.deptno }</td>
  <td>${edto.dname}</td>
  <td >${edto.empno }</td>
  <td>${edto.ename }</td>
  <td>${edto.mgr}</td>
  <td>
  <%-- <select>
  <c:forEach items="${jlist}" var="job" >
  <option <c:if test="${job == edto.job }">selected</c:if>  >${job}</option>
  </c:forEach>
  </select> --%>
  	${edto.job}
  </td>
  <td>${edto.hiredate }</td>
  <td>${edto.sal }</td>
  <td>${edto.comm }</td>
  <td>${edto.sal }</td>
  </tr>

  </c:forEach>
  </c:otherwise>
  
  </c:choose>
  </tbody>
  <tfoot>
  <tr>
  <td colspan="12">  <input type="button" value="delete" /></td>
  </tr>
  </tfoot>
</table>
  
  
<div id="demo">
<h3>types of  job</h3>
<select  class="job">
   <c:forEach items="${jlist}" var="job">
      <option value="${job}">${job}</option>
   </c:forEach>
   
</select>
</div>
  
  
  
  
<script type="text/javascript">
var url = location.href;  
var pattern = /[?&]/
var result =  url.split(pattern);
for (var i = 0; i < result.length; i++) {
	  if( result[i].indexOf("dept=") != -1)	     
	     var v = result[i].replace("dept=", "");
	  $(':checkbox[value='+ v +']').prop('checked','true');
}
</script>
<script>
   
   $("#employees tbody tr").each(function (){
      var value = $('td:eq(7)',this).html();//6번째 td 태그
     
      //console.log(value);
      
      var empno = $('td:eq(4)',this).html();
      
      console.log(empno);
      
     var select_tag = $(".job").clone()
     									   .removeClass("job")
     									   .prop("id", empno)
     									   .val(value);
      
      
      $('td:eq(7)',this)
      .empty()
      .prepend(  select_tag  );//option의 value 값으로 .. 부여.. 
      
      
   });    
   $('#demo').remove();
     
</script>
<script type="text/javascript">
$("select").on("change", function() {
	//changeServlet 호출
	//1
	// checked된 속성까지 모두가져가기 
	
	var param = location.href.substr(location.href.indexOf("?")+1);
	
	console.log(param);
	
	var href = "http://localhost/JspPro/changejob.do"+"?job="+$(this).val()+"&empno="+$(this).attr("id")+"&"+param;
	
	
	//$(this).parent().
	
	
	
	console.log(href);
	location.href= href;

 
 
	
	
})

/* $("tr").wrap("<form action = '/JspPro/changejob.do' id='changeJob'></form>") */




</script>
</body>
</html>
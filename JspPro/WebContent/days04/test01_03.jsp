<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>jsp/servelet class - 0gJo 2019. 4. 29.-오전 9:05:22</title>


<link rel="stylesheet" type="text/css" href="">
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script type="text/javascript">
  $("li").on("click", function() {
  	$(this > a).attr("href").slice(-1)
  	
	  
	  
  })
  
  
  
  </script>
  <script>
  $( function() {
    $( "#tabs" ).tabs();
  } );
  </script>
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
</head>
<body>
<div id="tabs">
  <ul>
  <c:forEach items="${dlist}" var="ddto">
    <li><a href="#tabs-${ddto.deptno}">${ddto.dname}</a></li>
</c:forEach>    
  </ul>
  
  <c:forEach items="${dlist }" var="d_dto">
  <div id="tabs-${d_dto.deptno }">
   <table id="employees">
		  <thead>
		  <tr>
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
		       <c:forEach items="${elist}" var="dto"  varStatus="status">
		         <%-- <c:if test="${  dto.deptno == d_dto.deptno }"> --%>
		         <c:if test="${  dto.deptno eq d_dto.deptno }">
			         <tr>
					   <td>${ status.count }</td>
					   <td>${ dto.deptno }</td>
					   <td>${ dto.dname }</td>
					   <td>${ dto.empno }</td>
					   <td>${ dto.ename }</td>
					   <td>${ dto.mgr }</td>
					   <td>${ dto.job }</td>   
					   <td>${ dto.hiredate }</td>
					   <td>${ dto.sal }</td>
					   <td> ${ dto.comm } </td>
					   <td>${ dto.pay }</td>
					</tr>
				</c:if>
		       </c:forEach> 
		  </tbody>
		</table>
  
  </div>
</c:forEach>



<hr>





  
  <!-- <tr><td>2</td><td>10</td><td>ACCOUNTING</td><td>7839</td><td>KING</td><td></td><td>1981/11/17</td><td>5000</td><td></td><td>5000</td></tr>
  <tr><td>3</td><td>10</td><td>ACCOUNTING</td><td>7934</td><td>MILLER</td><td>7782</td><td>1982/01/23</td><td>1300</td><td></td><td>1300</td></tr>
  <tr><td>4</td><td>20</td><td>RESEARCH</td><td>7369</td><td>SMITH</td><td>7902</td><td>1980/12/17</td><td>800	</td><td></td><td>800</td></tr>
  <tr><td>5</td><td>20</td><td>RESEARCH</td><td>7566</td><td>JONES</td><td>7839</td><td>1981/04/02</td><td>2975</td><td></td><td>2975</td></tr>
  <tr><td>6</td><td>20</td><td>RESEARCH</td><td>7902</td><td>FORD</td><td>7566</td><td>1981/12/03</td><td>3000</td><td></td><td>3000</td></tr>
   -->
  
  
<%--   <select id="job">
  <c:forEach items="${jlist}" var="job" >
  <option  >${job}</option>
  </c:forEach>
  </select> --%>
  
  
  
  




</body>
</html>
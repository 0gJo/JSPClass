<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@  taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사원정보 검색 View</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>
<body>
<!--  
***요구사항
- 부서번호를 입력하면
- 해당부서의 사원의 정보를 CARD 형식으로 출력하는 페이지
-->
<!--  [클라이언트]																[서버]
클라이언트가 부서번호 입력페이지 요청 ------DeptServlet------- empInfo.jsp
							입력 ----------------------------- EmpInfoServlet ---- empInfo_ok.jsp		  
-->

<h3>사원정보 검색</h3>
<!-- dept list 받아서 select 태그 동적 생성 -->

<form  method="get"  action="/JspPro/empInfo"><!-- action : submit이 발생할때 -->
<select name="dept" >
<option>부서를 선택하세요</option>
<c:forEach items="${list}" var="dto" >

<option  value="${dto.deptno }">${dto.dname}</option>

</c:forEach>
</select>
</form>
<script type="text/javascript">
$("select").on("change", function() {
	$("form").submit();
})

</script>

</body>
</html>
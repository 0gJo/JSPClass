<%@page import="java.util.Iterator"%>
<%@page import="java.util.Map.Entry"%>
<%@page import="java.util.Set"%>
<%@page import="com.util.Cookies"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>jsp/servelet class - 0gJo 2019. 5. 7.-오후 3:07:24</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="">
<script>
   $(document).ready(function (){
	 
   });
</script>

</head>
<body>
<h3>쿠키목록</h3>
<form id="form1" >
<%
	Cookies cookies = new Cookies(request);
Set<Entry<String, Cookie>> set = cookies.cookieMap.entrySet();
Iterator<Entry<String, Cookie>> ir = set.iterator();

while(ir.hasNext()){
	Entry<String, Cookie> entry = ir.next();
	String cname = entry.getKey();
	String cvalue = entry.getValue().getValue();
	%>
<input type="checkbox" name="ckb_cookie" value="<%=cname%>">
<%=cname %>=<%=cvalue %><br>
<%
}
%>
<a href="ex08_editCookie.jsp" id="editLink">쿠키수정</a>
<a href="ex08_deleteCookie.jsp" id="deleteLink">쿠키삭제</a>

</form>
<script type="text/javascript">
$("#editLink, #deleteLink").click(function() {
	event.preventDefault(); 
	// 기억 *****
	var queryString = $("#form1").serialize(); //달고갈 파라미터를 자동생성
	
	location.href = $(this).attr("href")+"?"+queryString;
	
})

</script>

</body>
</html>
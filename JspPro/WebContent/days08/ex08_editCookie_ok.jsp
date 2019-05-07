<%@page import="com.util.Cookies"%>
<%@page import="java.util.Enumeration"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
Cookies cookies = new Cookies(request);

Enumeration<String> en = request.getParameterNames();

while(en.hasMoreElements()){
	String cname = en.nextElement();
	String cvalue = request.getParameter(cname);
	Cookie cookie = cookies.createCookie(cname, cvalue, "/", -1);
	response.addCookie(cookie);
}


%>




<script type="text/javascript">

alert("수정완료");
location.href="ex08_getCookie.jsp";
</script>

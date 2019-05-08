<%@page import="com.util.Cookies"%>

<%@ include file="ex01_cookieAuth.jspf" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%



Cookie cookie = Cookies.createCookie("auth", "", "/", -1);
cookie.setMaxAge(0);
response.addCookie(cookie);

// 로그아웃 경고창 + default.jsp 이동
%>
<script type="text/javascript">
alert("[<%=auth %>]님 로그아웃 되었습니다.");
location.href= "ex01_default.jsp";


</script>
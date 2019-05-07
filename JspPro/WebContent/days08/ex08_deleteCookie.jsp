<%@page import="com.util.Cookies"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String[] delete_cnames = request.getParameterValues("ckb_cookie");
// 존재확인
	Cookies cookies = new Cookies(request);
	for (int i = 0; i < delete_cnames.length; i++) {
		String cname = delete_cnames[i];
		if(cookies.exists(cname)){
				Cookie cookie = new Cookie(cname, "");
				cookie.setPath("/");
				cookie.setMaxAge(0);
				response.addCookie(cookie);
		}
		
	}

//response.sendRedirect("ex08_getCookie.jsp");
%>

<script type="text/javascript">
alert("삭제되었습니다.");
location.href="ex08_getCookie.jsp";

</script>
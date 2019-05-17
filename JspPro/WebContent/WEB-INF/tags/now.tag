<%@ tag import="java.util.Calendar"%>
<%@ tag body-content="empty" pageEncoding="utf-8" %>
<%
	Calendar  cal  = Calendar.getInstance();
	int year = cal.get(Calendar.YEAR);	
	int month = cal.get(Calendar.MONTH)+1;
	int day = cal.get(Calendar.DATE);
%>

<%= year %> 년 <%= month %>월 <%= day %>일 
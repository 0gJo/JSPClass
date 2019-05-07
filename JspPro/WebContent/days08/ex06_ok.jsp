<%@page import="java.util.Date"%>
<%@page import="days08.MemberInfo"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
/* 
String id= request.getParameter("id");
String name= request.getParameter("name");
String email= request.getParameter("email");
String password= request.getParameter("password");
 */
%>

<jsp:useBean id="info" class="days08.MemberInfo" scope="request"></jsp:useBean>
<jsp:setProperty property="*" name="info"/>
<!-- 넘어오는 모든 파라미터의 값들을 자동 지정
단, MemberInfo의 field명과 요청페이지의 input name값이 일치해야  -->

<%-- <jsp:useBean id="info" class="days08.MemberInfo" scope="page"></jsp:useBean>
<jsp:setProperty value="<%=id %>" property="id" name="info"/>
<jsp:setProperty value="<%=name %>" property="name" name="info"/>
<jsp:setProperty value="<%=password %>" property="password" name="info"/>
<jsp:setProperty value="<%=email %>" property="email" name="info"/> --%>
<jsp:setProperty value="<%= new Date() %>" property="registerDate" name="info"/>


<%--
 아이디 : <jsp:getProperty property="id" name="info"/> <br>
이름 : <jsp:getProperty property="name" name="info"/> <br>
비밀번호 :<jsp:getProperty property="password" name="info"/> <br>
등록일 : <jsp:getProperty property="registerDate" name="info"/> <br>
이메일 : <jsp:getProperty property="email" name="info"/> <br>
 --%>



<jsp:forward page="ex06_last.jsp"></jsp:forward>






<%@ tag pageEncoding="utf-8"%>
<%@ attribute name="begin" required="true" type="java.lang.Integer"%>
<%@ attribute name="end" required="true" type="java.lang.Integer"%>

<%@ variable name-given="sum" variable-class="java.lang.Integer" scope="NESTED"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="sum" value="0"/>

<c:forEach begin="${begin}" end="${end}" var="num">
<c:set var="sum" value="${sum+num}" />
</c:forEach>
<jsp:doBody/>
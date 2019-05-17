<%@  tag body-content="empty" pageEncoding="utf-8" %>
<%@ tag trimDirectiveWhitespaces="true" %>
<%@ attribute name="name" required="true"  rtexprvalue="true" %>
<%@ tag dynamic-attributes="optionsMap" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<select name = "${name}">
<c:forEach items="${optionsMap}" var="menu">
<option>${menu.value}</option>
</c:forEach>

</select>

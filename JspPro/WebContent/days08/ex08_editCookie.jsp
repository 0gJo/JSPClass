<%@page import="com.util.Cookies"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
   // ?ckb_cookie=[a]&ckb_cookie=[admin]
    String [] edit_cnames = request.getParameterValues("ckb_cookie");
    // 1. Á¸Àç È®ÀÎ
    Cookies cookies = new Cookies(request);    
%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp/servlet class - k¡Õn¢®k (2019. 5. 7.-¿ÀÈÄ 2:44:08)</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="">
<style>
</style>
<script>
   $(document).ready(function (){	  
   });
</script>
</head>
<body>
   <form action="ex08_editCookie_ok.jsp">
   <ul>
       
 <%
     for(int i=0; i< edit_cnames.length ; i++){
    	 String cname = edit_cnames[i];
%>
       <li>
	       <%= edit_cnames[i] %> : 
	       <input type="text" name="<%= cname %>" size="50"
	                                value="<%= cookies.getValue(cname) %>"  />
       </li> 
<%	    
   }
 %>     
      
   </ul>
   <input type="submit" />
   </form>
</body>
</html>










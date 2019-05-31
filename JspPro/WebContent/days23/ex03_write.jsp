<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp/servlet class - k¡Õn¢®k (2019. 5. 30.-¿ÀÈÄ 2:59:03)</title>
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
<h3 style="text-align: center">write.jsp</h3>
<form action="write_ok.do" method="post"
 enctype="multipart/form-data" >
 <table border="1" style="width: 500px;" align="center">
  <tr>
    <td> subject </td>
    <td> <input type="text" name="subject" /></td>
  </tr>
  <tr>
  	<td> attach file </td>
  	<td><input type="file" name="attachFile" /></td>
  </tr>
  <tr>
   <td colspan="2"><input type="submit" /></td>
  </tr>
 </table>
</form>
</body>
</html>










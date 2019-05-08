<%@page import="com.util.Cookies"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="ex06_sessionAuth.jspf" %>
<%

if(auth==null){ 
	out.println("<script type='text/javascript'>");
	out.println("alert('로그인 후 이용하세요.')");
	out.println("location.href= 'ex01_default.jsp';");
	out.println("</script>");
	out.close();
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>jsp/servelet class - 0gJo 2019. 5. 8.-오전 10:09:09</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="">
<script>
   $(document).ready(function (){
	 
   });
</script>

</head>
<body>
<h3>공지사항</h3>
<ol>
	<li>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nihil voluptatibus.</li>
	<li>Ratione neque ad sed ab sint nam esse facilis itaque?</li>
	<li>Reprehenderit dignissimos provident magnam ad ipsam error repudiandae doloremque ab.</li>
	<li>Ex expedita accusantium facilis doloremque culpa vel quia ea magnam!</li>
	<li>Tempore odit ut asperiores vel iure minus voluptate placeat sunt!</li>
	<li>Fugit recusandae id minima illum harum obcaecati fuga in tempora.</li>
	<li>Eius molestiae ex non impedit ea amet excepturi voluptatum modi!</li>
	<li>Quo molestias atque tempore doloremque ipsum aliquid itaque alias possimus.</li>
	<li>Nisi sapiente consectetur cumque minima neque doloribus accusantium dolores quibusdam.</li>
	<li>Repudiandae architecto assumenda culpa odit recusandae iusto pariatur ad nemo.</li>
	<li>Repudiandae repellat voluptate ex quod provident dolore vero maxime praesentium!</li>
	<li>Similique commodi incidunt nam pariatur mollitia hic fuga maiores dolor!</li>
	<li>Explicabo inventore libero distinctio eum commodi ipsam totam atque tempore.</li>
	<li>A id iste est repellat voluptatibus sapiente tempora quasi praesentium.</li>
	<li>Eius nobis ut a corrupti repudiandae asperiores laboriosam perferendis pariatur.</li>
	<li>Nemo quae assumenda rerum voluptatum libero atque repellendus ducimus vero.</li>
	<li>Dolores laborum explicabo quas odio voluptatum error perspiciatis labore et!</li>
	<li>Nisi mollitia quod sint facilis ab nam officiis id saepe?</li>
	<li>Cumque perspiciatis sunt nulla nobis alias quaerat maxime quam nostrum.</li>
	<li>Quaerat quasi vel blanditiis vero inventore eius reiciendis. Ut obcaecati.</li>
</ol>
</body>
</html>
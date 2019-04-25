<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<%

String id = request.getParameter("id");
String pwd = request.getParameter("pwd")	;

//DB

String location = "ex07.jsp";
if(id.equals("admin")&&pwd.equals("1234")){
	
	
	location+="?ok";
	
}else{
	
	location+="?error";
	
}
response.sendRedirect(location);



%>
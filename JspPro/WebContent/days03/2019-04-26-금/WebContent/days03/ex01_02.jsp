<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
      /* 1. rediect(리다렉트)
      String name = request.getParameter("name");
      int age = Integer.parseInt(request.getParameter("age"));
       
      String location = String.format("ex01_03.jsp?name=%s&age=%d"
    		  ,name,age);
      
      response.sendRedirect(location);
       */
       
       // 2. 포워딩( forward )
       String path="ex01_03.jsp";
       RequestDispatcher  dispatcher = request.getRequestDispatcher(path);
       dispatcher.forward(request, response);
%>



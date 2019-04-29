<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
      /* 1. redirect(리다이렉트)
      String name = request.getParameter("name");
      int age = Integer.parseInt(request.getParameter("age"));
       
      String location = String.format("ex01_03.jsp?name=%s&age=%d"
    		  ,name,age);
      
      response.sendRedirect(location);
       */
       
       
       //2. 포워딩(forward)
       // ex01_03.jsp 으로 페이지 이동시키기 + 변수값포함
       
       String path = "ex01_03.jsp";
       RequestDispatcher  dispatcher = request.getRequestDispatcher(path);
       dispatcher.forward(request, response);
       
%>
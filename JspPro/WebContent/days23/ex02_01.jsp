<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.FileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
   // days17/upload 폴더 미리 생성.
   String saveDirectory = 
   pageContext.getServletContext().getRealPath("/days17/upload");
System.out.println( saveDirectory );
   // days17/upload 폴더 생성이 안되어 있으면 생성
   File saveDir = new File(saveDirectory);
   if( !saveDir.exists() ) saveDir.mkdirs();
   
   int maxPostSize = 1024*1024*5; // 5MB  단위 byte
   String encoding = "UTF-8";
   FileRenamePolicy policy = new DefaultFileRenamePolicy();

    // *****
    // 객체 생성될 때 생성자의 파라미터값으로 예외 발생하지 않으면
    // 자동 파일 업로드 성공....
    MultipartRequest mrequest 
    = new MultipartRequest(request, saveDirectory
    		, maxPostSize, encoding, policy); 

    String name = mrequest.getParameter("name");
%>
> 이름  : <%= name %><br>
<hr>
<%    
    Enumeration  en =  mrequest.getFileNames();   // getFileNames()
    while( en.hasMoreElements() ){
    	String fileName = (String)en.nextElement();
    	
    	File uploadFile = mrequest.getFile(fileName);  // getFile()
        long uploadFile_length = uploadFile.length(); 
        String originalFileName = mrequest.getOriginalFileName(fileName);
        String filesystemName  = mrequest.getFilesystemName(fileName);
%>
> 첨부된 파일명 : <%= uploadFile.getName() %><br>
>>> originalFileName : <%= originalFileName %> <br>
>>> filesystemName : <%= filesystemName %> <br>
> 첨부된 파일 크기 : <%= uploadFile_length%> bytes<br>
<hr>
<%        
    } 
    
%>
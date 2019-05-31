<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.FileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
 //1  // days23/upload 폴더 미리 생성.
   String saveDirectory =  pageContext.getServletContext().getRealPath("/days23/upload");
 System.out.println( saveDirectory );
 
 
   // days17/upload 폴더 생성이 안되어 있으면 생성
   File saveDir = new File(saveDirectory);
   if( !saveDir.exists() ) saveDir.mkdirs();
   
   //2
   int maxPostSize = 1024*1024*5; // 5MB  단위 byte
   //3
   String encoding = "UTF-8";
   //4
   /* 이미 존재하는 파일명이 있으면 어떻게 처리할지를 policy에 저장 (cos.jar에서 제공하는 아래의 defaultPolicy를 사용하겠다.) */
   FileRenamePolicy policy = new DefaultFileRenamePolicy();

    // *****
    // 객체 생성될 때 생성자의 파라미터값으로 예외 발생하지 않으면
    // 자동 파일 업로드 성공....
    //cos.jar의 MultipartRequest 사용
    MultipartRequest mrequest 
    = new MultipartRequest(request, saveDirectory
    		, maxPostSize, encoding, policy); 

    String name = mrequest.getParameter("name");
    //String upload = mrequest.getParameter("upload");
    File uploadFile = mrequest.getFile("upload");  // filename=upload
    long uploadFile_length = uploadFile.length(); 
    //   days17/upload/ 폴더 안에    a.txt
    //                           a - 복사본.txt
    //                           a - 복사본(2).txt
    
 /* 이미 존재하는 파일명이 있으면 업로드한 파일명과 파일시스템의 파일명이 다를수 있으므로 */
    String originalFileName = mrequest.getOriginalFileName("upload");
    String filesystemName  = mrequest.getFilesystemName("upload");
%>

> 이름  : <%= name %><br>
> 첨부된 파일명 : <%= uploadFile.getName() %><br>
>>> originalFileName : <%= originalFileName %> <br>
>>> filesystemName : <%= filesystemName %> <br>
> 첨부된 파일 크기 : <%= uploadFile_length%> bytes<br>


<!-- 
 1. http://www.servlets.com/cos/
 2. cos-26Dec2008.zip
 3. lib>    cos.jar	 
 4. post , multipart/form-data 설정
 5. ex01_01.jsp   name=null  X
    cos.jar 안의 MultipartRequest 객체를 생성해서 사용..
 6. MultipartRequest 클래스
   MultipartRequest mrequest =
      new MultipartRequest(ㄱ,ㄴ,ㄷ,ㄹ,ㅁ);
     ㄱ. request
     ㄴ. saveDirectory 저장할경로
     ㄷ. maxPostSize   최대 파일 크기
     ㄹ. encoding      파일 인코딩 방식
     ㅁ. policy (정책)  파일 저장 정책     
 
 
 -->






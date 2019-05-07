<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp/servlet class - k≡n¡k (2019. 5. 3.-오후 3:04:47)</title>
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
   main.jsp 에서 생성한 내용. <br>
   
   content 출력 부분...<br>
   content 출력 부분...<br>
   content 출력 부분...<br>
   content 출력 부분...<br>
   content 출력 부분...<br>
   
  <jsp:include page="ex10_sub.jsp" flush="false"></jsp:include> 
   

<%-- 

   [ ex10.jsp 파일 추가 ]
   1. layout 관련.
   
   p 155 [페이지 모듈화]와 [요청 흐름 제어]
       ㄱ. include 액션 태그  <jsp:???? 액션태그
       ㄴ. include  지시자  
   
   
   1.  11st.co.kr  [11번가]
   2.  11st     프로젝트 생성
        [웹 어플리케이션] 11st              webapps/11st 폴더 저장
        Java Resources 폴더
           src 폴더[ 서블릿, 자바클래스 ]
             board 패키지
             member 패키지
               서블릿,
               클래스
              
        WebContent 폴더 [jsp,html,css,js]
            css 폴더
               
            js   폴더
            layout 폴더
                top.jsp
                bottom.jsp
             board 폴더
               layout 폴더
                     left.jsp
                     right.jsp
                자유게시판 폴더
                설문게시판   "
                공지게시판   "
                이벤트게시판  "
                
             member 폴더
               css 폴더
               js 폴더
               layout 폴더
                  left.jsp
                 회원가입.jsp
                 회원수정.jsp
                 회원탈퇴.jsp
                 로그인.jsp
                 등등
        
       
    
--%>
 
</body>
</html>












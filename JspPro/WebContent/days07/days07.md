  JSP 기본 객체 : 9 개 - request, response, out
  p 119 [ pageContext 기본 객체 ]
    1. JSP 페이지와   1:1 로 연결된 객체.
    2. 기능
       ㄱ. 기본 객체 얻어올 수 있다.
         request == pageContext.getReqeust()
         response == .getResponse()
         session == getSession()
         application ==  servletContext = ServeltContext(); ***
         out ==  getOut()
         exception  getException();
         page 기본 객체 =  Object getPage()                         ***
      ㄴ. 속성 처리 ( 이번장 )
      ㄷ. 페이지 흐름 제어 ( 7장 )
      ㄹ. 에러 데이터  ( 6장 )     
      
      
p 121 application 기본 객체
   ㄱ. 웹 애플리케이션( 웹 사이트 )과 관련된 객체
   ㄴ. 웹 애플리케이션의 전반적인 정보 담고 있는 객체.
   ㄷ.                     초기화 설정 : web.xml  <context-param>
        그 설정값을 얻어와서 사용할 때 :  getInitParameter(파라미터명)
                                                getInitParameterNames()
   
   참고) web.xml
      <servlet>
          <init-param> 태그 ? 초기화 매개변수 값을 설정해서...
          
web.xml <context-param> 설정

    Enumeration<String> en = application.getInitParameterNames();
    while(en.hasMoreElements()){
    	String pname = en.nextElement();
    	String pvalue = application.getInitParameter(pname);
  %>
    <%= pname %>/<%= pvalue %><br>
  <%  	
    	//out.println(panme +"/"+pvalue +"<br>");
    }
 %>
 
 
       웹 애플리케이션의 영역 : ( 4가지 영역 구성 )
       1. page        영역 :     하나의 [JSP페이지] 만 사용하는 영역  -  [ pageContext 객체 ] ***
       2. request    영역 :     하나의  [요청]을 처리할  영역            - request 객체
       3. session     영역 :     하나의 [웹 브라우저]와 관련된 영역     - response 객체
       4. application 영역 :    하나의 [웹 애플리케이션]과 관련된 영역 - application  객체
       
       범위 :    1 <  2  < 3  < 4
       
 p 139
    ㄱ. pageContext 영역 : 주로 커스텀 태그에서 새로운 변수를 추가할 때 사용.
                                        custom   tag  사용자 만든 태그
                                      <c:if test=""></c:if>
    *** ㄴ. request 영역
    *** ㄷ. session 영역        : 예) 로그인  인증/권한
    ㄹ. application 영역  :  웹 애플리케이션( 웹사이트 ) 설정 정보
                                   예) 임시 폴더 경로
                                  
MVC 패턴 ( 모델 2 방식 )
                                                                             
 <!-- p 140 에러 처리 -->
 <!-- WebContent  > error 폴더 추가 > viewErrorMessage.jsp-->
 
 name 파라미터값 :<%= request.getParameter("name").toUpperCase() %>
 
 

	 <%
	     try{
	 %>
	  name 파라미터값 :<%= request.getParameter("name").toUpperCase() %>
	 <%   	 
	     }catch(Exception e){
	 %>
	    에러 발생....
	    에러 페이지로 이동.....
	 <%   	 
	     }
	 %>

  p 146 [응답 상태 코드별]로 에러 페이지 지정하기
   - 400, 500, 404 응답 상태 코드별로 ....
   ㄱ. web.xml 설정
       <error-page> 태그 사용해서 설정....
  
  
  
  404 : 요청한 URL  을 처리하기 위한 자원 존재 X
  500 : 서버 내부 로직 에러 ( java 코딩 )
  
  [ p 149 주요 응답 상태 코드 ]
  


errorPage 속성 설정= URL    isEP = true  exception  
web.xml의  error-page 태그  code/message
  

 p 151 에러 페이지의 우선 순위와 에러 페이지 지정 형태
                                                                             

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
        
       
    


                                                                             
                                                                             
                                                                             
                                                                             
                                                                             
                                                                             
                                                                             
                                                                             
                                                                             
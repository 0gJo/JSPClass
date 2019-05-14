## 목록보기

ArticlePage

LoginCheckFilter - request.getRequestURI();

LoginHandler - referer 가져와서 redirect

writeHandler 에서 sendRedirect ("~~~~/list.do")

--------------------------

## ch11. 표현언어 (Expression Language)

01.표현언어란?

02.EL 기초

03.`EL에서 객체의 메서드 호출`

04.EL에서 정적 메서드 호출하기1

05.EL에서 정적 메서드 호출하기2

06.람다식 사용하기

07.스트림 API 사용하기

08.표현언어 비활성화 방법

-----------------------------------

#### 01.표현언어란?

1. 다른형태의 스크립트언어

2. 스크립트 요소중에 하나이다

3. 표현식보다 간결하고 편리하기 때문에 많이 사용한다.

4. EL3.0

5. EL 기능

   JSP의 네가지 기본객체가 제공하는 영역의 속성사용

   JSP 기본 객체와 별개로, "EL의 기본객체"가 따로 존재

   스트림 API (라이브러리) 사용한 컬렉션 처리

#### 02.EL 기초

1. EL의 데이터 타입(자료형)과 리터럴

   정수 == java.lang.Long / 실수 == java.lang.Double

   널타입 : null

   문자열 :  "  "

2. EL의 기본 객체

   pageContext == Jsp 페이지 자체 ( JSP 기본객체 접근용도 )

   <% 
   	  request.getRequestURI();
   %> == ${pageContext.request.requestURI } 

   param : Map<파라미터이름, 값> 객체           ex)${param.name }

   <% session.getAttribute("auth")%>  == ${sessionScope.auth}

   header  :   <%
    request.getHeader("referer");
   %> == ${header.referer}

   cookie  == Map<쿠키name, Cookie

   user : ${cookie.user.value} : 받은 여러 cookie들 중, 쿠키이름이 user인 쿠키의 값

3. 비교연산자  ne  

4. 논리연산자 and / or  / not

5. 산술연산자 

   3%5 == 3 mod 5 (나머지)

   null +,-,* null == 0

   null + 100 = 100

6. empty 연산자

7. 삼항연산자     ( ?  : )

8. 문자열 연결  : += 사용

   ${"책제목 : " += requestScope.title+="입니다"}

9. 할당 연산자  

     ${age = 20};
   ${age }

   ${m=[1,2,3];''} : m 변수에 배열만 할당하고 + 출력 X

10. 특수문자 처리하기  : \ 사용

      \\${name}  ->${name} 그대로 출력 

#### 04.EL에서 정적 메서드 호출하기1

WEB-INF-tlds-  .tld  파일에 외부에서 사용할수 있도록, 함수-이름 매핑 정보 입력

web.xml에서 .tld 파일을 taglib로 등록

함수를 사용할 jsp 파일 (페이지)에서  <%@ taglib  uri="/WEB-INF/tlds/el-functions.tld" %> 추가하여 사용

```html
오늘은 ${elfunc:formatNumber(20000,'#,##0')}
```



#### 05.EL에서 정적 메서드 호출하기2

```jsp
오늘은 ${FormatUtil.number(20000,'#,##0')}****
```



#### 08.표현언어 비활성화 방법

1. web.xml에서 비활성화

```xml
<jsp-config>
 <jsp-property-group>
 <url-pattern></url-pattern>
 <el-ignored></el-ignored>
 </jsp-property-group>
```



2. 하나의 JSP 페이지에서 비활성화  <%@ page isELIgnored="true" %>



















[		]

p252-253 : $와 #의 차이 (Spring에서도 사용할 것)

람다식

[		]

JSTL / Chatper15. 방명록 / 답변형 게시판 / 자료실 구현
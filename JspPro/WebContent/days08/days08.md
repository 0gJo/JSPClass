[ 내일	]
세션

p168 include 지시자(@) -->  [ 액션태그와 비교.. <jsp:include >]
하나의 서블릿으로 만들어짐 			각각의 서블릿으로 만들어짐
공통변수 선언 용도							레이아웃 잡기 용도
<%@ include file="/includee.jspf" %>
-> includee.jspf에 선언된 변수를 현재 jsp에서 사용가능



p177 jsp:forward 액션 태그



p190 자바빈과 jsp:useBean 액션태그 (ex05 / MemberInfo.java)
자바빈(javabeans) : jsp 기반 웹 애플리케이션에서 정보를 표현하기 위한 클래스( 객체 ) == DTO == VO 개념

<jsp:useBeans > 액션태그 == 자바빈을 사용할때 사용..
== MemberInfo info = new MemberInfo(); 와 동일

JSP에서는 속성을 표현하기 위한 용도로 사용된다.. 
속성(데이터), 변경이벤트, 객체직렬화를 위한 표준 (서블릿규약 처럼 자바빈 규약 존재 )

자바빈 규약 
1. 직렬화 implements Serializable (JSP에서는 값 저장용도이므로 없어도 O)
2. 값을 저장하는 private 필드 
3. 				   				getter, setter..

ex06_ok.jsp

```java
<jsp:useBean id="info" class="days08.MemberInfo" scope="request"></jsp:useBean>
```




p205 클라이언트와의 대화 : 쿠키 (ex07)
-
<ul>
<li>쿠키란</li>
<li>쿠키 생성과 사용</li>
<li>쿠키를 이용한 로그인 처리</li>
</ul>

<ol>
<li>방법1. javascript에서 생성 사용</li>
<li>방법2. JSP에서 생성 사용</li>
</ol>
![1557199609886](C:\Users\sist\AppData\Roaming\Typora\typora-user-images\1557199609886.png)

Path 하위의 jsp파일을 요청할때마다 생성되는 쿠키 


쿠키값 변경 및 쿠키 삭제하기 (ex08 / p210)
1. 쿠키값 변경<br>
ㄱ. 쿠키이름으로 쿠키 찾아서<br>
ㄴ. 새로운 쿠키값을 가지는 Cookie 객체 생성<br>
ㄷ. response.addCookie()<br>
2. 쿠키 삭제<br>
ㄱ. 쿠키이름으로 쿠키 찾아서<br>
ㄴ. 새로운 쿠키값을 가지는 Cookie 객체 생성<br>
ㄷ. .setMaxAge(0) cf.-1 : 브라우저 닫을때 삭제 <br>
ㄹ. response.addCookie()

com.util에 getCookie, setCookie 할수있는 class 만들기

[		]
web.xml error 처리 코딩 (4가지)
scope

쿠키 이용한 로그인.. 
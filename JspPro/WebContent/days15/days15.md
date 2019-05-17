< 오늘 >

커스텀태그

답변형 게시판

< 내일 >

파일업로드

< 다음주 >

ajax / 구글맵



-------------------------

## CHAPTER 16 커스텀 태그 만들기 

01 커스텀태그

02 태그파일을 이용한 커스텀 태그 구현

[환경설정]

1. WEB-INF/tags 폴더 추가



[p474 표 16.1, 16.2]

1. 태그 파일에서 사용할 수 있는 디렉티브
2. tag 디렉티브의 속성



[태그 파일]

1. WEB-INF/tags 폴더나 그 하위폴더에 위치

2. 확장자 : .tag  .tagx 

3. 예시

   <%@ taglib prefix="tf" tagdir="/WEB-INF/tags/..."%>

   \<tf:...>\</tf:...> 로 사용

ex03_now.jsp / now.tag : 현재 날짜 출력 태그 만들기

<%@ tag body-content="empty" pageEncoding="utf-8" %>

body-content="empty" : \<tf:now/> 처럼 몸체가 없을 때 

3. 태그파일의 속성 설정

[ 태그파일의 (정적)속성 설정 ]

태그파일 예시

```java
<%@  tag body-content="empty" pageEncoding="utf-8" %>
<%@ tag trimDirectiveWhitespaces="true" %>
<%@ attribute name="title" required="true"  rtexprvalue="true" %>
<%@ attribute name="level" type="java.lang.Integer"%>

<%
	String headStartTag = null;
	String headEndTag = null;
	
	if(level == null){
		
		headStartTag ="<h1>";
		headEndTag = "</h1>";
		
	}else if (level == 1){
		headStartTag ="<h1>";
		headEndTag = "</h1>";
	}else if (level == 2){
		headStartTag ="<h2>";
		headEndTag = "</h2>";
	}else if (level == 3){
		headStartTag ="<h3>";
		headEndTag = "</h3>";
	}
%>

<%= headStartTag%> ${title} <%= headEndTag%>
```

태그사용 예시

```java
<tf:header title="제목" />
<tf:header title="<%= title  %>" level="2"/>
<tf:header title="소제목" level="3"/>
```

[ 태그파일의 동적 속성 설정 ]

optionsMap에 지정되지 않은 attribute 값들이 저장된다.

4. 몸체 내용 처리

   [ 몸체 내용자체를 데이터로 사용]

   <%@  tag **body-content="tagdependent"** pageEncoding="utf-8" %>

   body-content 속성을 위와 같이 설정하면, 몸체 내용에 포함된 EL이나 액션태그를 처리하지 않고, 몸체 내용 자체를 텍스트 값으로 사용한다. (\<pre>\</pre>와 비슷한 개념)

   tag 파일에서 \<jsp:doBody> : 태그를 호출한 페이지에서 몸체안의 내용을 출력(시행)

   [  태그처리한 몸체를 데이터로 사용]  

   scriptless 속성값은 반대개념

5.  변수 추가 

   : 태그 파일과 태그를 호출한 페이지가 공유 할 수 있는 변수를 추가할 수도 있다.

   

[]

615~7 / 661-2  days5.content.java

-----------------------------------------------------

## 답변형 게시판

TAEYO.NET - ASP.NET - 계층형 게시판 - 로직의 이해 & 테이블 설계

로직의 이해

| 글번호(thread) | depth | 제목                                                         |
| -------------- | ----- | ------------------------------------------------------------ |
| 3000           | 0     | 세번째로 올라온 글                                           |
| 2000           | 0     | 두번째로 올라온 글                                           |
| 1999           | 1     | ![img](http://taeyo.net/Images/re.gif) 두번째로 올라온 글의 답변2 |
| 1998           | 2     | ![img](http://taeyo.net/Images/re.gif) 두번째로 올라온 글의 답변의 답변2 |
| 1997           | 1     | ![img](http://taeyo.net/Images/re.gif) 두번째로 올라온 글의 답변1 |
| 1000           | 0     | 첫번째로 올라온 글                                           |



**Listing 페이지에서의 페이징 로직**

레코드중에서 1000번째 부터 20개를 가져온다면, 다음과 같은 쿼리문을 사용할 수 있습니다.

```sql
select * from board 
where thread in 
         ( select top 20 thread from 
                  ( select top 1020 thread from board 
                    order by thread desc ) as a 
           order by thread asc ) 
order by thread desc
```



그렇습니다. 이전 강좌에서 말씀드린 것처럼 일단 현재 자신이 답변을 달게될 원본 글의 thread 값보다 작은 thread 값들은 모두 -1을 해줘야 합니다. 그리고, 그를 위해서 필요한 Update 쿼리는 다음과 같구요

```sql
UPDATE ThreadBoard 
SET thread = thread - 1
Where thread < 부모 글의 thread 값(예제의 경우, 2000)
          and thread > 이전 질문 글의 thread 값(우리의 경우, 1000)
```



그룹컬럼(ref)+그룹순번컬럼(step)+그룹깊이컬럼

보고있는 글 (부모글) 에 댓글 : 위의 세가지 항목은 부모 기준으로 정해진다.

ref desc, step asc

TAEYO 페이지의 로직의 thread = ref + step



```
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp/servlet class - k≡n¡k (2019. 5. 16.-오후 12:17:25)</title>
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
<!-- 
  [ 계층형( 답변형 ) 게시판 ]                                     thread (그룹컬럼+그룹순번컬럼) + 그룹깊이컬럼
                                                     thread     depth
    1		홍길동		첫번째게시글	(새글)      1000         0                    
    2		예나		두번째게시글 (새글)      2000         0
    3		지용	    세번째게시글(새글)       3000         0
    4      지용        예나의 답글(답글)        1998         1(부+1)
    5                  예나의 답글(답글)        1999         1 
  
    order by thread desc;
  
  3		지용	    세번째게시글(새글)       3000         0
  2		예나		두번째게시글 (새글)      2000         0
      ㄴ 6         예나의 답글(답글)        1999        1
      ㄴ 5         예나의 답글(답글)        1998        1
      ㄴ 4         예나의 답글(답글)        1997        1   
  1		홍길동		첫번째게시글	(새글)      1000         0
  
  
  
  order by ref desc , step asc
   3		지용	    세번째게시글(새글)             3				  1						0
      ㄴ 6       승연      아이스크림 이따구...(답글)    3				      2                    1
      ㄴ4       소민        나는 아이스크림..(답글)       3				  2                    1   
          ㄴ5       성현       자꾸 왜 나한테 질문(답글)     3        3                  2     
   2		예나		두번째게시글 (새글)            2				  1						0 
   1		홍길동		첫번째게시글	(새글)            1				  1						0
   
   
  (pk)
  글번호	작성자		글제목 .... 				+ 그룹(REF) + 그룹순번(STEP) + 그룹깊이(DEPTH)
   1		홍길동		첫번째게시글	(새글)            1				  1						0
   2		예나		두번째게시글 (새글)            2				  1						0
   3		지용	    세번째게시글(새글)             3				  1						0
   4       소민        나는 아이스크림..(답글)       3				  3                    1 
   5       성현       자꾸 왜 나한테 질문(답글)     3				  4	                    2
   6       승연      아이스크림 이따구...(답글)    3				      2                    1 
   
  *** 답글인 경우에는    ref==부모ref
                                     같은 그룹(ref) 안에서  step(2) <= step 전부 1증가..
                                     , step=부모step+1
                               , depth=부모depth+1
  *** 새글인 경우에는    ref==seq, step=1, depth=0
  
  
 seq                                order by seq desc  
  3		지용	    세번째게시글(새글)                                      1
    ㄴ 6    승연        결석안하고 잘 왔네.(답글)                        2 
    ㄴ 4    소민        나는 아이스크림..(답글)                          3
       ㄴ 5    지용        나도 아이스크림..(답/답글)                   4
       
  2		예나		두번째게시글 (새글)                        1
    ㄴ 7    승연        결석안하고 잘 왔네.(답글)            2 
    
  1		홍길동		첫번째게시글	(새글)                         1
  
contet.jsp
[3]
[지용]
[세번째게시글]
[        내용                       ]
 [수정][삭제][목록][*답글*]                보고있는 글( 부모글 ) 부모글  그룹(REF) + 그룹순번(STEP) + 그룹깊이(DEPTH)
                                                                                            3				  1						0
 
 
  
  
  
  
  
  1		홍길동		첫번째게시글
  2		예나		두번째게시글
  3		지용	    세번째게시글
  4    소민        나는 아이스크림.. 
  5    지용        나도 아이스크림..
  6    승연        결석안하고 잘 왔네.
  7    승연        결석안하고 잘 왔네.
 -->  
</body>
</html>
```


























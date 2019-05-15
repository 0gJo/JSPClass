CHAPTER 12 표준 태그 라이브러리(JSTL) 

01.JSTL이란

1.1 JSTL이 제공하는 태그의 종류

1.2 JSTL 라이브러리 받기

02.코어태그

2.1 변수 지원 태그

2.2 흐름 제어 태그

2.3 URL 처리 태그

2.4 기타 코어 태그

03.국제화 태그

3.1 로케일 지정 태그

3.2 예제로 사용할 리소스 번들

3.3 메시지 처리 태그

3.4 숫자 및 날짜 포맷팅 처리 태그

3.5 web.xml 파일에 국제화 관련 태그 기본값 설정하기

-----------------------------------------------------------------------------

### CHAPTER 12 표준 태그 라이브러리(JSTL) 

#### 01.JSTL이란

개발자들이 많이,자주 쓰는 커스텀 태그들을 표준화시킨 것  (jstl.1.2.jar)

##### 1.1 JSTL이 제공하는 태그의 종류

|      | 접두어 | 라이브러리                   |                         |                                                              |      |
| ---- | ------ | ---------------------------- | ----------------------- | ------------------------------------------------------------ | ---- |
|      | c      | 코어(core)                   | 1.변수지원: set, remove | 2. 흐름지원 : if, choose, forEach, forTokens                            3. url 처리 : import,redirect, url |      |
|      | x      | xml 관련                     |                         |                                                              |      |
|      | fmt    | 국제화 (날짜 숫자 출력 형식) |                         |                                                              |      |
|      | fn     | 함수(컬렉션, String 처리)    |                         |                                                              |      |
|      |        |                              |                         |                                                              |      |

#### 02.코어태그

###### 변수지원태그

##### 1.\<c:set>  태그

```java
<c:set var="변수명" value="<% %>,${} ,정적텍스트"  scope="영역 (default : page)"></c:set>

<c:set var="name" value="홍길동" scope="request"></c:set>
<%request.setAttribute("name", "홍길동") %>

<c:set var="name" value="홍길동" ></c:set>
<c:set var="name"  >홍길동</c:set>

<c:set target="대상객체(자바빈객체, Map객체여야) , <%=표현식 %>,${EL} }"
		 property="속성명==set메서드, 키"  value="값"></c:set>

```

${}내에서 사용하는 객체는 반드시 setAttribute해서 어떤 Scope내에서 존재하는 객체여야한다.

##### 2.\<c:remove>  태그

<c:remove var="name"/>

4개 영역의 모든 name 속성이 삭제된다.

###### 흐름제어태그

조건문 태그

- **<c:if test="${EL} <%=표현식 %>">\</c:if>   **

- <c:if test="" scope="" var="test의 결과를 저장할 변수">\</c:if>
- ex06.jsp : 특정 조건에 해당하는 정보만 css style 변경하기 예시**

foreach 태그 (ex06.jsp)

: 배열, 컬렉션, Map에 저장되어있는 값들을 순차적으로 처리할 때 사용

- <c:forEach begin="1" end="10" step="1" var="i" >

- <c:forEach items="${list}" var="dto" **varStatus="status"** >

  : 반복문에서 처리중인 객체의 상태정보를 담은 객체이다.

  다음과 같은 속성을 가진다.

   status.count / status.index / status.current / status.first / status.last

  ${ list.size()}

- Map에서 사용할 때는 다음과 같은 형태로 사용한다. (map의 자료형을 고려)

```java
<c:forEach items="<%=map %>" var="entry" > 

${entry.key}-${entry.value}

</c:forEach>
```



###### URL 처리 태그

: redirect할 url에 줘야할 인자 값이 많을때 사용한다. 잘 쓸일은 없다.

###### 기타코어태그

\<c:out> : JSPWriter에 데이터를 출력할때 사용하는 태그

<c:out value="출력할 값" default="value를 입력하지 않았을때 출력할 값" escapeXml="">\</c:out>

```java
<c:catch var="예외객체">

</c:catch>

<c:if test="${ex !=null }">

</c:if>
```

#### 03.국제화태그***

```java
<c:set var="price" value="10000"></c:set>
<fmt:formatNumber value="${price}"  type="number" var="numberType"></fmt:formatNumber>
숫자 : ${numberType }
<br>
통화 : <fmt:formatNumber value="${price}" type="currency" currencySymbol="\\"/>
<br>
퍼센트 : <fmt:formatNumber value="${price}" type="percent" groupingUsed="false"/>
<br>
패턴지정 : <fmt:formatNumber value="${price}" pattern="00000000.00"/>

<hr>

<c:set value="1,100.12" var="money"></c:set>
<fmt:parseNumber value="${money}" pattern="0,000.00" var="n"/>
${n}
```

출력 결과는 아래와 같다.

숫자 : 10,000 

통화 : \10,000 

퍼센트 : 1000000% 

패턴지정 : 00010000.00

1100.12

```java
<%
	Date now = new Date();
%>

<c:set var="now" value="<%= now %>" />
<fmt:formatDate value="${now}" dateStyle="full"/><br>
<fmt:formatDate value="${now}" dateStyle="short"/><br>
<fmt:formatDate value="${now}" type="time"/>
<fmt:formatDate value="${now}" pattern="yyyy-MM-dd"/><br>

<c:set value="2019년05월15일" var="d"/>

<fmt:parseDate value="${d}" pattern="yyyy년MM월dd일" var="parsedDate"/>

${parsedDate }
```

출력 결과는 아래와 같다.

2019년 5월 15일 수요일

\19. 5. 15

오후 3:25:24 2019-05-15

Wed May 15 00:00:00 KST 2019



#### 04.함수



-------------------------------------

### Chapter15 웹 어플리케이션의 일반적인 구성 및 방명록 구현 

02.방명록 구현

1.방명록을 구성하는 클래스의 구조

2.데이터베이스와 테이블 생성

3.이클립스 프로젝트 생성과 필요 모듈 복사

4.커넥션 풀 설정 위한 DBCPInit 클래스 구현과 web.xml 설정

5**.Message 클래스** 작성

6.**MessageDao** 클래스 구현

7.서비스 클래스의 구현

**GetMessageListService** / **WriteMessageService** / **DeleteMessageService**

**MessageListView 클래스** : 요청페이지번호, 요청페이지 메시지 목록, 전체메시지 갯수 등 담은 클래스

**ServiceException** / **InvalidPassowrdException** / **MessageNotFoundException**

8.JSP에서 서비스 사용하기

**list.jsp** / **writeMessage.jsp** 

**confirmDeletion.jsp** : 메세지 삭제폼  / **deleteMessage.jsp**



MVC 패턴

​						Contoller(ControllerUsingURI) -----------> Model (Handler)

join.do / login.do      	    										  JoinHandler / LoginHandler												

​																							JoinService.join() / LoginService.login()

​																				DB에 회원정보저장   /  로그인유지session.setAttribute

​											페이지로포워딩    								    +setAtrribute() + **페이지반환**

<-----------------------  View 

****









[			]

ex06.jsp

방명록 구현





--------------------------------------------------------------------------

PART 04 중급 내용 익히기 

CHAPTER 15 웹 어플리케이션의 일반적인 구성 및 방명록 구현 

01.웹 어플리케이션의 전형적인 구성요소

1.웹어플리케이션의 주요 구성 요소

2.데이터 접근 객체(DAO)의 구현

3.서비스클래스의 구현

4.싱글톤 패턴을 이용한 구성요소 구현

5.Connection을 제공하는 ConnectionProvider 만들기



02.방명록 구현

1.방명록을 구성하는 클래스의 구조

2.데이터베이스와 테이블 생성

3.이클립스 프로젝트 생성과 필요 모듈 복사

4.커넥션 풀 설정 위한 DBCPInit 클래스 구현과 web.xml 설정

5.Message 클래스 작성

6.MessageDao 클래스 구현

7.서비스 클래스의 구현

8.JSP에서 서비스 사용하기

----------------------------------------

회원관련기능 : 회원가입 / 로그인



게시판기능 : 쓰기 / 목록조회 / 게시글 조회 / 수정 



MVC 패턴

​						Contoller(ControllerUsingURI) -----------> Model (Handler)

join.do / login.do      													JoinService.join() / LoginService.login()

​																				DB에 회원정보저장   /  로그인유지session.setAttribute

​											페이지로포워딩    								    +setAtrribute() + **페이지반환**

<-----------------------  View 



```
Handler 클래스의 구성

// GET 방식일 때 FORM 페이지 반환

// POST 방식일 때 의 처리 (submit한 경우 )

/// 1. submit 한 정보들에 문제가 있다면 error 객체에 담는다.
										(viewPage에서 error에 따라 다른 화면 출력하도록 )
/// 2. request.setAttribute("errors", errors);

/// 3. error가 있다면 FORM 페이지 반환

/// 4. 없다면, Service 객체로 부터 받은 정보객체(DTO)를 받아 setAttribute 후 페이지 반환 or sendRedirect






```





Handler 클래스의 구성

// GET 방식일 때 FORM 페이지 반환

// POST 방식일 때 의 처리 (submit한 경우 )

/// 1. submit 한 정보들에 문제가 있다면 error 객체에 담는다.

(viewPage에서 error에 따라 다른 화면 출력하도록 )

/// 2. request.setAttribute("errors", errors);

/// 3. error가 있다면 FORM 페이지 반환

/// 4. 없다면, Service 객체로 부터 받은 정보객체(DTO)를 받아 setAttribute 후 페이지 반환 or sendRedirect

```java
try {
	User user = loginService.login(id, password);
	request.getSession().setAttribute("authUser", user);
	return or redirect... 
}catch (LoginFailException e) {   
	errors.put("idOrPwNotMatch", Boolean.TRUE);
	return FORM_VIEW;
}   
```



Service 클래스의 구성 

service 클래스의 login 메소드에서는 Dao를 이용하여 DB작업 (select)을 하고,  

그 결과가 존재하지 않을 경우, 예외를 발생(throw)시킨다. ( 예외 처리는 Handler에서 )

```java
public class LoginService {

	private MemberDao memberDao = new MemberDao();
	
	public User login( String id, String password) {
		try(Connection conn = ConnectionProvider.getConnection()) {
			Member member = memberDao.selectById(conn, id);
			
			if (member == null) {
			// 회원 정보가 없을 경우
				throw new LoginFailException();
			}
			if (!member.matchPassword(password)) {
			// 비밀번호 불일치 하는경우 
				throw new LoginFailException();
			}
			
			return new User(member.getMemberid(), member.getName());
			
		} catch (Exception e) {
			throw new RuntimeException(e);	
			}
	}
}
```

Service 클래스는 사용자의 입력정보(request)와, 실제 정보(DB)가 만나는 접점이라고 볼 수 있다.

member.matchPassword(password) 에서, member는 실제 DB의 회원정보이고 인자로 들어간 password는  (Handler가 request에서 얻어 넣은) 사용자의 입력정보이다.

​			( request에서 get한  사용자가 입력한 ) 

Handler ---  사용자 입력 id 전달 ---> Service----사용자 입력 id 전달------> DAO

​																																		전달된 id를 이용해 DB 작업(select)

Dao 클래스의 구성 예시

```java
public class MemberDao {

	public Member selectById(Connection conn, String id) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Member member = null;
		try {
			pstmt = conn.prepareStatement("select * from member where memberid = ?");
			
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
	
			if (rs.next()) {
				
			member = new Member(rs.getString("memberid"), rs.getString("name"), 				rs.getString("password"), rs.getTimestamp("regdate"));
				
			}		
			
	
		} catch (SQLException e) {
		
			e.printStackTrace();
		
		}finally {
			
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
	
		return member;
		
	}
```
































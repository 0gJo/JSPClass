[TOC]

Ch19. Filter (필터)

PART 5. 예제프로젝트

Ch20. ServletContextListener 구현



---------------

## Ch19. Filter (필터)

#### 01.필터란?

요청을 처리하는 필터 : 요청이 올바른지 / 자원에 접근할 수 있는 권한을 가졌는지

응답을 처리하는 필터 : 응답데이터를 변경(형변환, 암호화 등) 하거나 취소할 수 있는 기능 

#### 02.필터의 구현 

1 Filter 인터페이스

2 필터 설정하기 : web.xml 이용 OR @WebFilter 애노테이션 사용

3 요청 및 응답 래퍼 클래스

#### 03.필터의 응용

3.1 로그인 검사 필터 (request처리 필터)

3.2 XSL/T 필터 (response처리 필터)

3.3 캐릭터 인코딩 필터

게시판 눌러서 ex01_login_ok에 왔는지  ->  게시판 페이지

로그인 눌러서 								에 왔는지 에 따라 다른 페이지 보여줘야  -> 메인페이지

--------------------

3.3 캐릭터 인코딩 필터

3.2  XSL/T 필터 (responseFilter) (활용: 암호화 등 )

XSL : XML 파일을 원하는 Style 로 



Ch20. ServletContextListener 구현



PART 5. 예제프로젝트

CH21. 회원제 게시판 구현 1: 회원관련 기능

- DB테이블 / Member 클래스
- MemberDao
- JoinRequest class / JoinService class
- JoinHandler
- joinForm





[		]

p553-557 (requestFilter)

PART 5. 예제프로젝트

CH21. 회원제 게시판 구현 1: 회원관련 기능

- 회원가입기능 구현
- 로그인/로그아웃 처리
- 필터를 이용한 로그인 검사 기능
- 암호 변경 기능
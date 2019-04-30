days05


- 게시판만들기 

- 문법 

---
Map<DeptDTO, ArrayList<EmpDTO>>
URL 요청 === GET방식
regist.jsp -> post 방식 ( 파일첨부를 위해 )
[GET 방식] :  http://localhost/JspPro/regist -> Regist.java -->
<a href="/JspPro/board/regist">글쓰기</a>
***action 속성값 삭제 -> 자기자신페이지 url 요청 -> [Post방식] ->Servlet 요청..
=> 하나의 서블릿에 GET, POST 접근
			페이지 보여주기 , SUBMIT 처리
	글쓰기 -----------> 게시판 목록...
	Regist      			      List
  get-->post ------>   get-->
      포워딩    리다이렉트      포워딩
글올리기
리스트보기
내용보기 + 조회수증가

포워딩될때는 request (의 param)이 유지.. 

html 적용비적용
작성완료 -> edit.java Post -> update -> content로 돌아가기..
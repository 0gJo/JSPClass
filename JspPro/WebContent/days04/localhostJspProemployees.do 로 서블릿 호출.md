localhost/JspPro/employees.do 로 서블릿 호출 

1. 서블릿 호출

2. 상태유지

   -DeptEmpDTO (+sql  join 문) 

   -checked-> location.href 에서 다듬어서

   -no ++ -> varStatus="status"  /  ${status.count}

   -select 매번 생성x -> clone

tabs생성

---

job 바꾸면 db변경  -> changeServlet

[ㅇ]sol)select tag의 id값을 empno로 변경.. (찾아갈필요 x)

sol) forwarding x -> redirect

sol) onchange 할때 현재 체크된 부서도 넘겨줘야 (location.href에서 가공)

checkbox  누르고 delete누르면 db삭제 ->deleteServlet



dlist는 업데이트하지않고 elist만 업데이트하는 것 -> Ajax



[		]

jobchange

delete
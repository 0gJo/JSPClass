클라이언트 요청의 구분 : get/post  및 URL로 구분

​						글쓰기 default/ 글쓰기버튼 클릭후 

init()

1. .properties 파일 작성 내용을 load해서 property 객체에 key - value로 등록

​													command (hello or /hello.do) - Handler클래스 위치경로                             

2.  Class.forName(위의 value) 로 클래스 정보 불러와서  newInstance 생성
3.  HashMap에 put으로  command-Handler인스턴스  등록

-----------------------------

MVC 패턴 

클라이언트의 모든 요청을 "하나의 서블릿"(Controller)에서 처리 

클라이언트의 요청(URL)에 맞는 Handler Class(Model)를 찾아 process 시킨 후 결과물을 반환받는다. 

알맞은 뷰 선택 후, 뷰로 포워딩(혹은 리다이렉트)





```java
class Controller extends htttpServlet{
    
    init(){}
    
    doGet(){}
    
    doPost(){}
    
    process(){
        // 클라이언트의 요구분석 ( URI or Parameter 이용) 
        // URI 이용방법
        String command = request.getRequestURI();// /JspPro/hello.do

		if (command.indexOf(request.getContextPath())==0) {
			int beginIndex = request.getContextPath().length();
			command = command.substring(beginIndex);	
		}
        
        // 위에 대응하는 Handler 클래스 객체를 얻어온다
        
        CommandHandler handler = commandHandlerMap.get(command);
        
        // Model에게 일시키고 forwarding 할 페이지를 반환받는다
        // ( Model은 처리한 결과물을 request나 session에 setAtrribute한다 )
        // ( 처리한 결과물은 포워딩된 jsp 페이지에서 사용할 것임)
       
    	viewPage =  handler.process(request, response); // "/board/list"
        
        // 반환받은 페이지로 forwarding 
        if (viewPage!=null) {
			String prefix = "/WEB-INF/view";
			viewPage = prefix + viewPage+".jsp";
			RequestDispatcher dispatcher =	request.getRequestDispatcher(viewPage);
			dispatcher.forward(request, response);	
			
		}
    }
    
    
}
```

WEB-INF 파일에 넣는 이유 : 직접적인 외부접근 제한

(jsp, html 파일)

```java
class Handler implements CommandHandler{
    
    @override
    public String process(request, response){
  		// ( DB 처리 )
  		// 게시글 목록 출력 요청의 경우 DB에서 게시글정보를 읽어와 dto들을 생성해 list에 담기 
    
        
        // 처리한 결과 담기 
        request.setAttribute("list", list);
        
        // fowarding할 페이지 반환 
        return "/board/list";
        
    }
    
} 
```











page와 pageContext


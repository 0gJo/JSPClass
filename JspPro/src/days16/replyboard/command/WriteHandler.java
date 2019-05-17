package days16.replyboard.command;



import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board21.article.model.Writer;
import board21.article.service.WriteRequest;
import board21.auth.service.User;
import days16.replyboard.model.ReplyBoardDTO;
import days16.replyboard.service.WriteService;






public class WriteHandler  implements CommandHandler {
	
	private static final String FORM_VIEW = "/days16/write";
	private WriteService writeService = new WriteService();

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws IOException, Exception {
		
		if (request.getMethod().equals("GET")) {
			return processForm(request, response);
		}else if (request.getMethod().equals("POST")) {
			return processSubmit(request,response);
		}else {
			response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
			return null;
		}
	
		
		
	}

	private String processForm(HttpServletRequest request, HttpServletResponse response) {
		
		return FORM_VIEW;
	}

	private String processSubmit(HttpServletRequest request, HttpServletResponse response)  {
		
		
		//2. 답글  (부모글 정보ref, step, depth) 
		
		
		//1. 새글
		ReplyBoardDTO dto = new ReplyBoardDTO();
		
		dto.setWriter(request.getParameter("writer"));
		dto.setEmail(request.getParameter("email"));
		dto.setSubject(request.getParameter("subject"));
		dto.setContent(request.getParameter("content"));
		dto.setPass(request.getParameter("pass"));
		dto.setIp(request.getRemoteAddr()); //클라이언트의 ip주소가져옴
		
		if (request.getParameter("num")== null) { // 새글 
			System.out.println(dto.getRef());
			dto.setStep(0);
			dto.setDepth(0);
		} else { // 답글
			dto.setRef(Integer.parseInt(request.getParameter("ref")));
			dto.setStep(Integer.parseInt(request.getParameter("step")));
			dto.setDepth(Integer.parseInt(request.getParameter("depth")));
			
			
		}
		
	
		
		WriteService service = new WriteService();
		
		int result = service.write(dto);
	
	//int newArticleNo = writeService.write(writeReq);
	//// replyboard	 : DB에 insert 하고 
		
	
	//request.setAttribute("newArticleNo", newArticleNo);
	//// replyboard	 : ReplyBoardDTO 만들어서 setAttribute 한뒤 
		
		if (result == 1) {
			try {
				response.sendRedirect("list.do");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		
	//sendRedirect (~~list.do)	
	//// replyboard	 : 게시판 목록페이지로 redirect 
	// ListHandler는 ListService.select() 로 주어진 페이지에 해당하는 게시물들 객체를 전달받아서 setAttribute 한뒤 list.jsp 페이지
		
		
		
			return null;

	
	
	
	
	
	
	}

	private WriteRequest createWriteRequest(User user, HttpServletRequest request) {
	
		return new WriteRequest(new Writer(user.getId(), user.getName()), request.getParameter("title"), request.getParameter("content"));
	}

}

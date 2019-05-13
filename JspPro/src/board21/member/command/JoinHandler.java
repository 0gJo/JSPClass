package board21.member.command;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board21.member.service.DuplicatedException;
import board21.member.service.JoinRequest;
import board21.member.service.JoinService;

public class JoinHandler implements CommandHandler {
	private static final String FORM_VIEW = "/board21/joinForm";
	private JoinService joinService = new JoinService();
	
	
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws IOException {
			// GET -> joinForm.jsp 리턴
			// POST -> 입력데이터 잘못된 경우 : joinForm.jsp 
			// 			->  회원가입 성공한 경우 : 회원가입처리 + joinSuccess.jsp 
		
		if (request.getMethod().equals("GET")) {
			return processForm(request,response);
			
		}else if (request.getMethod().equals("POST")) {
			return processSubmit(request,response);
		}else {
			response.setStatus(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
			return null;
		}
		
	}
	
	private String processForm(HttpServletRequest request, HttpServletResponse response) {
		return FORM_VIEW;
	}


	private String processSubmit(HttpServletRequest request, HttpServletResponse response) {
		//joinRequest가 이렇게 왔ㄷ..
		JoinRequest joinReq = new JoinRequest();
		joinReq.setId(request.getParameter("id"));
		joinReq.setName(request.getParameter("name"));
		joinReq.setPassword(request.getParameter("password"));
		joinReq.setConfirmPassword(request.getParameter("confirmPassword"));

		Map<String, Boolean> errors = new HashMap<>();
		
		/////////////////////////////////////////////
		request.setAttribute("errors", errors);
		
		joinReq.Validate(errors);
		// 잘 넘어 왔으면
		
		if (!errors.isEmpty()) { // errors.isEmpty == false 이면  == 에러가 있으면
			return FORM_VIEW;
		}
		
		// 잘 넘어 왔으면 == 회원가입 성공한 경우 
		
		try {
			joinService.join(joinReq);
			return "/board21/joinSuccess";
			
		} catch (DuplicatedException e) {
			errors.put("duplicatedId", Boolean.TRUE);
			return FORM_VIEW;
		}
	
		
	}



	
	
}

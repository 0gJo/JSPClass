package board21.member.command;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board21.auth.service.User;
import board21.member.service.ChangePasswordService;
import board21.member.service.InvalidPasswordException;
import board21.member.service.MemberNotFoundException;

public class ChangePasswordHandler implements CommandHandler {

	private static final String FORM_VIEW = "/board21/changePwdForm";
	private ChangePasswordService changePwdService = new ChangePasswordService();
	
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
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

	private String processSubmit(HttpServletRequest request, HttpServletResponse response) throws Exception {
	User user = 	(User)request.getSession().getAttribute("authUser");
	
	Map<String, Boolean> errors = new HashMap<>();
	request.setAttribute("errors", errors);
	
	String curPwd = request.getParameter("curPwd");
	String newPwd = request.getParameter("newPwd");
	
	if (curPwd== null || curPwd.isEmpty()) {
		errors.put("curPwd", true);
	}
	
	if (newPwd == null || newPwd.isEmpty()) {
		errors.put("newPwd", true);
	}
	
	if (!errors.isEmpty()) {
		return FORM_VIEW;
	}
	
	try {
	changePwdService.changePassword(user.getId(), curPwd, newPwd);
	return "/board21/changePwdSuccess";
	}catch (InvalidPasswordException e) {
		errors.put("badCurPwd", true);
		return FORM_VIEW;
	}catch (MemberNotFoundException e) {
		response.sendError(HttpServletResponse.SC_BAD_REQUEST);
		return null;
	}
	
	
	
	
	
	
	}

}

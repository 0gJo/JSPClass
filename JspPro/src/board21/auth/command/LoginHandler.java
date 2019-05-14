package board21.auth.command;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import board21.auth.service.LoginFailException;
import board21.auth.service.LoginService;
import board21.auth.service.User;
import board21.member.command.CommandHandler;

public class LoginHandler implements CommandHandler {
	
	private static final String FORM_VIEW = "/board21/loginForm";
	private LoginService loginService = new LoginService();

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		if (request.getMethod().equals("GET")) {
			System.out.println("GET");
			return processForm(request,response);
			
		}else if (request.getMethod().equals("POST")) {
			System.out.println("POST");
			return processSubmit(request,response);
		}else {
			response.setStatus(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
			return null;
		}

	}
	private String processForm(HttpServletRequest request, HttpServletResponse response) {
		
		return FORM_VIEW;

	}
	
	
	private String processSubmit(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String id = trim(request.getParameter("id"));
		String password = trim(request.getParameter("password"));
		
		System.out.println(id+password);
		
		
		Map<String, Boolean> errors  = new HashMap<>();
		
		
		
		if (id==null||id.isEmpty()) {
			errors.put("id", Boolean.TRUE);			
		}
		
		if (password== null || password.isEmpty()) {
			errors.put("password", Boolean.TRUE);
		}
		
		request.setAttribute("errors", errors);
		
		if (!errors.isEmpty()) {
			
			return FORM_VIEW;
		}
		
	
		
		try {
		User user = loginService.login(id, password);
		System.out.println(user);
		
		request.getSession().setAttribute("authUser", user);
		
		//response.sendRedirect("/JspPro/WEB-INF/view/board21/index.jsp");
	
		//RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/view/board21/index.jsp");
		//dispatcher.forward(request, response);
		HttpSession session = request.getSession(false);
		
		if (session.getAttribute("referer")!=null) {
			
			response.sendRedirect((String)session.getAttribute("referer"));
			
		}else {
			response.sendRedirect(request.getContextPath()+"/index.do");
		}
		
		
		
		
		return null;
	
		}catch (LoginFailException e) {
			errors.put("idOrPwNotMatch", Boolean.TRUE);
			return FORM_VIEW;
		}
		

	}
	private String trim(String parameter) {
		
		return parameter ==  null? null : parameter.trim();
	}

	

}

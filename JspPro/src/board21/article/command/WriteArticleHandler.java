package board21.article.command;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board21.article.model.Writer;
import board21.article.service.WriteArticleService;
import board21.article.service.WriteRequest;
import board21.auth.service.User;
import board21.member.command.CommandHandler;

public class WriteArticleHandler implements CommandHandler {

	private static final String FORM_VIEW = "/board21/newArticleForm";
	private WriteArticleService writeService = new WriteArticleService();
	
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
	
	
	Map<String, Boolean> errors = new HashMap<>();
	request.setAttribute("errors", errors);
	
	User user = 	(User)request.getSession().getAttribute("authUser");
	
	WriteRequest writeReq = createWriteRequest(user, request);//java.lang.NullPointerException
	
	writeReq.validate(errors);
	

	if (!errors.isEmpty()) {
		return FORM_VIEW;
	}
	
	int newArticleNo = writeService.write(writeReq);
	
	request.setAttribute("newArticleNo", newArticleNo);
	
	return "/board21/newArticleSuccess";

	
	
	
	
	
	
	}

	private WriteRequest createWriteRequest(User user, HttpServletRequest request) {
	
		return new WriteRequest(new Writer(user.getId(), user.getName()), request.getParameter("title"), request.getParameter("content"));
	}

}

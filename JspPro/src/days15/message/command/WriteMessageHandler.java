package days15.message.command;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import days15.guestbook.model.Message;
import days15.guestbook.service.ServiceException;
import days15.guestbook.service.WriteMessageService;



public class WriteMessageHandler  implements CommandHandler {
	
	private static final String FORM_VIEW = "/days15/list";
	private WriteMessageService writemessageService = WriteMessageService.getInstance();

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws IOException, Exception {
		System.out.println("WriteMessageHandler");
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
	
	private String processSubmit(HttpServletRequest request, HttpServletResponse response) {
			
			String guestname = request.getParameter("guestName");
			String password = request.getParameter("password");
			String msg = request.getParameter("message");
		
			Message message = new Message();
			message.setGuestName(guestname);
			message.setPassword(password);
			message.setMessage(msg);
			
			System.out.println(message.getGuestName());
			System.out.println(message.getPassword());
			
		
		try {
			
			writemessageService.write(message);
			System.out.println("writeMessage");
			return "/days15/writeMessage";
			
			
		}catch (ServiceException e) {
			
			System.out.println("service Exception");
			return FORM_VIEW;
			}
		
	}

	private String processForm(HttpServletRequest request, HttpServletResponse response) {
		return FORM_VIEW;
	}
	
	
	
	

}

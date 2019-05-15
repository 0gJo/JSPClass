package days15.message.command;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import days15.guestbook.service.WriteMessageService;



public class WriteMessageHandler  implements CommandHandler {
	
	private static final String FORM_VIEW = "/days15/writeMessage";
	private WriteMessageService writemessageService = new WriteMessageService();

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws IOException, Exception {
		System.out.println("WriteMessageHandler");
		
		return null;
	}

}

package days16.replyboard.command;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class NullHandler implements CommandHandler, board21.member.command.CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		response.sendError(HttpServletResponse.SC_NOT_FOUND);
		return null;
	}

	
	
}


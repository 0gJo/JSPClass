package board21.command;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board21.member.command.CommandHandler;

public class IndexHandler  implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws IOException {
		System.out.println("IndexHandler 호출");
		return "/board21/index";
	}

}

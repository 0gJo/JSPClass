package days10.mvc.hello;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import days10.mvc.command.CommandHandler;

public class HelloHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws IOException {
		//setAttribute
		request.setAttribute("hello", "안녕하세요");
		// view페이지 리턴
		return "/hello";
	}

}

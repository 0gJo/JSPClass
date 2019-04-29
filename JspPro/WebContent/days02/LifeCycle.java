package days02;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LifeCycle extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println(">doGet()");
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println(">doPost()");
	}

	@Override
	public void destroy() {
		//서블릿 객체가 소멸될때 호출
		// == 서버 죽을때
		System.out.println(">destroy()");
	}

	@Override
	public void init() throws ServletException {
		// 서블릿 객체가 생성될때 (웹컨테이너에) 호출
		// == (가장처음)호출받을떄
		System.out.println(">init()");
	}

	
}

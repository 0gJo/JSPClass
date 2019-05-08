package days09;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class CreateSession extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// name, age 세션 저장후 ex05_ok.jsp 리다이렉션
		//***
		//ㄱ. request.getSession() == request.getSession(true)
		// : 세션 객체가 없으면 생성해서 반환
		//ㄴ. request.getSession(false) 
		// : 세션 객체가 없으면  null
		//HttpSession session = request.getSession(false);
		// if (session!=null) { }
		
		String name  = request.getParameter("name");
		int age = Integer.parseInt(request.getParameter("age"));
		
		HttpSession session = request.getSession();
		
		session.setAttribute("name", name);
		session.setAttribute("age", age);
		
		response.sendRedirect("ex05_ok.jsp");
		
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

	
	
}

package days02;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// http://localhost/JspPro/days02/re URL요청에 응답할 서블릿
// 
public class LoginRedirect extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//클라이언트가 id와 pwd를 보냄
		// id와 pwd 값을 확인하고 여부에 따라 다른 page로 redirect 할것..
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		
		//String location = "/days02/Login.jsp?";
		//http://localhost   /days02/Login.jsp?ok ==> 404 에러
		
		//String location =             "./days02/Login.jsp?";
		//http://localhost/JspPro/days02/days02/Login.jsp?ok ==> 404 에러
		
		String location = "/JspPro/days02/Login.jsp?";
		
			
		if (id.equals("admin")&&pwd.equals("1234")) {
			
			location +="ok";
		}else {
			
			location+="error";
		}
		
		response.sendRedirect(location);
		
		
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doPost(req, resp);
	}
	
	
	
}

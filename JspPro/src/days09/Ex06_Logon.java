package days09;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Ex06_Logon extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HashMap<String,String> member = new HashMap<>();
		member.put("admin", "1234"); // 관리자
		member.put("hong", "1234"); // 일반회원
		member.put("kim", "1234"); // 일반회원
		
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		HttpSession session = request.getSession();
		
		if(id.equals("admin") && pass.equals("1234")){
		
			session.setAttribute("auth", "관리자");
			session.setAttribute("memberInfo", new MemberInfo("admin", "관리자", "admin@gmail.com", true,	 25, "king"));
			response.sendRedirect("ex06_default.jsp");
			
		}else if(id.equals("hong") && pass.equals("1234")){
		
			session.setAttribute("auth", "hong");
			response.sendRedirect("ex06_default.jsp");
			
		}else if(id.equals("kim") && pass.equals("1234")){
		
			session.setAttribute("auth", "kim");

			response.sendRedirect("ex06_default.jsp");
			
		}else{
			response.sendRedirect("ex06_default.jsp?error");
		}
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

	
	
}

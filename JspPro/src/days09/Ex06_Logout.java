package days09;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Ex06_Logout extends HttpServlet {

	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session =	request.getSession();
		response.setContentType("text/html;charset=UTF-8");
		
		// 세션값 얻어오기
	String auth = (String)session.getAttribute("auth");
		// 세션 auth값 삭제
	session.invalidate();
		// 로그아웃 경고창 + default.jsp 이동
	PrintWriter out =  response.getWriter();
	out.println("<script type='text/javascript'>");
	out.println("alert('" +auth+ "님 로그아웃 되었습니다')");
	out.println("location.href= 'ex01_default.jsp';");
	out.println("</script>");
	out.close();
	
	response.sendRedirect("ex06_default.jsp");
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

	
	
}

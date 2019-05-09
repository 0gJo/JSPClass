package days10.mvc.simple;

import java.io.IOException;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SimpleController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		processRequest(request, response);
		
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		processRequest(request, response);
	}
	
	protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// URL 분석해서 구분 (greeting하고 싶은지 / 날짜출력 해달라는 요청인지 )
		String type = request.getParameter("type");
		
		// URL에 따라 다른 Model 호출 + // 요청결과 받기
		Object resultObject = null;
		
		
		if (type == null ) {
			
			resultObject = "타입을 선택해주세요";
			
		}else if (type.equals("greeting")) {
			
			resultObject = "안녕하세요";
			
		}else if (type.equals("date")) {
			
			resultObject =  new Date();
			
		
		}else {
			resultObject = "invalid Type";
		}
		
		// 요청결과 심어서 view에 포워딩 

		request.setAttribute("result", resultObject);
		
		RequestDispatcher dispatcher = 	request.getRequestDispatcher("/days10/simpleView.jsp");
		
		dispatcher.forward(request, response);
		
		
	}
	
}

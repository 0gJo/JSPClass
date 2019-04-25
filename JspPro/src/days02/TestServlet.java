package days02;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class TestServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	resp.setContentType("text/html;charset=UTF-8");
		
	PrintWriter out =	resp.getWriter() ;
		
	int num = Integer.parseInt(req.getParameter("num"));
		
	
	int sum = 0;
	
	String result = "";
	
	for (int i = 1; i <= num; i++) {
		
			sum+=i;
		
			result+= i==num? i+"=": i+"+";
	}
	
	result += sum;
	out.println("<!DOCTYPE html>");
	out.println("<html>  ");
	out.println("<head>  ");
	out.println("<title> ");
	out.println("</title> ");
	out.println("</head> ");
	out.println("<body>  ");
	out.println(result);
	out.println("<a href='/JspPro/days02/test01.html'>다시</a> ");
	out.println("</body> ");
	out.println("</html> ");
	         

		
	}
	
	

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doPost(req, resp);
		

		
	}

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.service(req, resp);
	}
		
	
	
	
	
}

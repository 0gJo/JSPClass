package days02;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class TestServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		  response.setContentType("text/html; charset=UTF-8");
		  
		  int num = Integer.parseInt( 	request.getParameter("num")   );
		  
		  //System.out.printf("> param.num = %d\n", num);
		  PrintWriter out = response.getWriter();
		  
		  int sum = 0;
		  out.append("<html><body>");
		  out.append("<h3>");
		  for (int i = 1; i <= num; i++) {
			  out.append( i+"" );
			  if( num != i ) out.append("+");
			  sum += i;
		}
		  out.append("="+ sum);
		  out.append("</h3>");
		  
		  out.append("<a href='/jspPro/days02/test01.html'>한글 다시</a>");
		  out.append("</body></html>");
	}

	@Override
	protected void doPost(HttpServletRequest request
			, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	
	
	
}

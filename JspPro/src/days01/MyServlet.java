package days01;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MyServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	 PrintWriter out = resp.getWriter();
		
		out.println("<html>")                  ;
		out.println("<head>")                  ;
		out.println("<title>")                 ;
		out.println("어노테이션사용 서블릿자동록");
		out.println("</title>")                ;
		out.println("</head>")                 ;
		out.println("<body>")                  ;
		out.println("<h2>hello world</h2>")    ;
		out.println("Served at: ")             ;
		out.println("</body>")                 ;
		out.println("</html>");
		
		
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

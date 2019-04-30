package days01;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDateTime;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// 서블릿 규약
// 1. 접근지정자는 public
// 2. javax.servlet.http.HttpServlet 클래스 상속
public class NowServlet extends HttpServlet{
	
	public String getNow(){
    	return LocalDateTime.now().toString();
    }

	@Override
	protected void doGet(HttpServletRequest request
			, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		
		int age = 20 ;		   
		String today = getNow();
		String name = "홍길동";
		   
		out.println("<!DOCTYPE html>");
		out.println("<html>");
		out.println("<head>");
		out.println("<meta charset='UTF-8'>");
		out.println("<title>jsp/servlet class - k≡n¡k (2019. 4. 24.-오전 10:03:56)</title>");
		out.println("<meta name='viewport' content='width=device-width, initial-scale=1.0'>");
		out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js'></script>");
		out.println("<link rel='stylesheet' type='text/css' href=''>                                                ");
		out.println("<style>                                                                                        ");
		out.println("</style>                                                                                       ");
		out.println("<script>                                                                                       ");
		out.println("   $(document).ready(function (){	                                                            ");
		out.println("   });                                                                                         ");
		out.println("</script>                                                                                      ");
		out.println("</head>                                                                                        ");
		out.println("<body>                                                                                         ");
		out.println("날짜 : <input type='text' value="+ today +" /><br>                           ");
		out.println("이름 : <input type='text' value="+ name +" /><br>                                           ");
		out.println("나이 : <input type='text' value="+ age+" /><br>                                            ");		
		out.println("</body>");
		out.println("</html>");
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.service(req, resp);
	}

}

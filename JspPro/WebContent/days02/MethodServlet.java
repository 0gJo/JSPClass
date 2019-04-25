package days02;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class MethodServlet
 */
/*@WebServlet(urlPatterns= "/days02/method", loadOnStartup=2)*/
@WebServlet(urlPatterns="/days02/method" 
				, initParams= {@WebInitParam(name="user",value="scott")
							, @WebInitParam(name="password",value="tiger")})
public class MethodServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MethodServlet() {
    	super();
       System.out.println("MethodServlet init()");
       
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	/*protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("Service");
	}*/

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");/////////////////중요	
		//System.out.println("DoGet");
		response.setContentType("text/html;charset=UTF-8");
		
		String msg = request.getParameter("msg");
		PrintWriter out = response.getWriter();
		out.append(msg);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		doGet(request, response);
		System.out.println("DoPOst");
	}

}

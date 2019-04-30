package days03;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import days02.DeptDTO;
import sun.nio.fs.DefaultFileTypeDetector;

/**
 * Servlet implementation class ForwardServlet
 */
@WebServlet("/days03/forward.jsp")
public class Test01_ForwardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Test01_ForwardServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/* 서블릿
		PrintWriter out = response.getWriter();
		out.append(c);
		*/
		String message = request.getParameter("message");
		System.out.println("> message : " + message);
		//String message = "안녕하세요. 홍길동 입니다.";
		
		String path = "test01_ok.jsp?message="+ URLEncoder.encode(message, "UTF-8");
		//String path = "test01_ok.jsp?message="+ message;
		response.sendRedirect(path);
		
		
		/*
		String path = "test01_ok.jsp";
		RequestDispatcher  dispatcher =  request.getRequestDispatcher(path);
		dispatcher.forward(request, response);
		*/
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

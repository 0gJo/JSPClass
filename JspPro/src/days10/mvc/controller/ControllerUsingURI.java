package days10.mvc.controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import days10.mvc.command.CommandHandler;
import days10.mvc.command.NullHandler;

public class ControllerUsingURI extends HttpServlet {
	
	private Map<String, CommandHandler> commandHandlerMap =
			new HashMap<>();
	

	@Override
	public void init() throws ServletException {

		String configFile = getInitParameter("configFile");//cmd-Handler 정의한 Properties 파일의 경로
		//   /WEB-INF/commandHandler.properties
		Properties prop = new Properties();

		String configFilePath = getServletContext().getRealPath(configFile); /////
			//
		
		
		FileInputStream fis;
		try {
			fis = new FileInputStream(configFilePath);
			prop.load(fis);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		// prop (key,value ) hello=days10.mvc.hello.HelloHandler
		// HashMap (key.value) : hello,         Handler 클래스 인스턴스
		

       Iterator keyIter=	prop.keySet().iterator();
       
       while (keyIter.hasNext()) {
		String command = (String) keyIter.next();
		String handlerClassName = prop.getProperty(command);
		//days10.mvc.hello.HelloHandler                      hello
		
		try {
			Class<?> handlerClass = 	Class.forName(handlerClassName);
			
			CommandHandler handlerInstance = (CommandHandler)handlerClass.newInstance();
			commandHandlerMap.put(command, handlerInstance);
			
			
		} catch (ClassNotFoundException | InstantiationException | IllegalAccessException e) {
			e.printStackTrace();
		}
		
	}

	}
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		process(request, response);
		
		
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		process(request, response);
		
	}

	
	private void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String command = request.getRequestURI();
		// /JspPro/hello.do
		
		
		if (command.indexOf(request.getContextPath())==0) {
			int beginIndex = request.getContextPath().length();
			command = command.substring(beginIndex);
			
		}
		
		CommandHandler handler = commandHandlerMap.get(command);
		
		if (handler == null) {
			handler = new NullHandler();
		}
		
		String viewPage = null;
		
		viewPage =  handler.process(request, response);
		
		// viewPage로 포워딩
		
		// 내코딩
/*		if (viewPage!=null) {
			
			
		if(viewPage.equals("/JspPro/board/list.do")) {
			response.sendRedirect(viewPage);	
		}else {
			String prefix = "/WEB-INF/view";
			viewPage = prefix + viewPage+".jsp";
			RequestDispatcher dispatcher =	request.getRequestDispatcher(viewPage);
			//Defines an object that receives requests from the clientand sends them to any resource (such as a servlet,HTML file, or JSP file) on the server.
			dispatcher.forward(request, response);	
		}
		
		
		}*/
		
		
		if (viewPage!=null) {
			String prefix = "/WEB-INF/view";
			viewPage = prefix + viewPage+".jsp";
			RequestDispatcher dispatcher =	request.getRequestDispatcher(viewPage);
			//Defines an object that receives requests from the clientand sends them to any resource (such as a servlet,HTML file, or JSP file) on the server.
			dispatcher.forward(request, response);	
			
		}
		
	}
	
	
	
	
	
	
	
}

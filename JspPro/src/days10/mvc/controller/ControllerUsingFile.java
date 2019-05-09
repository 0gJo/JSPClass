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

public class ControllerUsingFile extends HttpServlet{

	private Map<String, CommandHandler> commandHandlerMap =
			new HashMap<>();
	
	@Override
	public void init() throws ServletException {
		
		String configFile = getInitParameter("configFile");//cmd-Handler 정의한 Properties 파일의 경로
									//   /WEB-INF/commandHandler.properties
		Properties prop = new Properties();
		
		String configFilePath = getServletContext().getRealPath(configFile); /////
										//
		
/*		Gets the real path corresponding to the given virtual path. 
		For example, if path is equal to /index.html,
		this method will return the absolute file path on the server's filesystem
		 to which a request of the form http://<host>:<port>/<contextPath>/index.html would be mapped
		 , where <contextPath> corresponds to the context path of this ServletContext. 
		           이 서블릿의 ContextPath는 이 서블릿을 호출하는 URL 패턴 에 해당하는 ..[ http://localhost/JspPro/] controllerUsingFile?cmd=hello

*/
		
		
		System.out.println(getServletContext());
		
		
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
	
		String command = request.getParameter("cmd");
		CommandHandler handler = commandHandlerMap.get(command);
		
		if (handler == null) {
			handler = new NullHandler();
		}
		
		String viewPage = null;
		
		viewPage =  handler.process(request, response);
		
		// viewPage로 포워딩
		if (viewPage!=null) {
		RequestDispatcher dispatcher =	request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);			
		}
	}
	
	

	
	
	
}

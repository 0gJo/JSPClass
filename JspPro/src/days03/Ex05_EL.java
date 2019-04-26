package days03;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import days02.DeptDTO;

public class Ex05_EL extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		ArrayList<DeptDTO> list = new ArrayList<>();
		
		DeptDTO dto = new DeptDTO();
		
		dto.setDeptno(10);
		dto.setDname("ACCOUNTING");
		dto.setLoc("NEW YORK");
		
		list.add(dto);
		
		DeptDTO dto1 = new DeptDTO();
		
		dto1.setDeptno(20);
		dto1.setDname("RESEARCH");
		dto1.setLoc("DALLAS");
		
		list.add(dto1);

		request.setAttribute("list", list);///////////////////////////////////////////중요
		
		//forwarding
		String path ="ex05_ok.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(path);
		dispatcher.forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		super.doGet(request, response);
	}

	
	
}

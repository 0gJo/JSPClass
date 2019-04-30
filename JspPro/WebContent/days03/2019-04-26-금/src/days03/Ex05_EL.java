package days03;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.DBConn;

import days02.DeptDTO;

public class Ex05_EL extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest request
			, HttpServletResponse response) throws ServletException, IOException {
		 
		ArrayList<DeptDTO> list = new ArrayList<>();
		DeptDTO dto = new DeptDTO();
			dto.setDeptno(10);
			dto.setDname("ACCOUNTING");
			dto.setLoc("NEW YORK");
		list.add(dto);
			dto = new DeptDTO();
			dto.setDeptno(20);
			dto.setDname("RESEARCH");
			dto.setLoc("DALLAS");
		list.add(dto);
		/*
		10		
		20	RESEARCH	DALLAS
		30	SALES	CHICAGO
		40	OPERATIONS	BOSTON
		*/
		request.setAttribute("list", list);
		
		// list
		String path = "ex05_ok.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(path);
		dispatcher.forward(request, response);
		
	}

	@Override
	protected void doPost(HttpServletRequest request
			, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	
	

}

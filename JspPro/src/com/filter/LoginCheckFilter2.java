package com.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginCheckFilter2 implements Filter {

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		
		HttpServletRequest req = (HttpServletRequest)request;
		HttpSession session = req.getSession(false);
		
		if (session==null||session.getAttribute("authUser")==null) {
			
			HttpServletResponse res = (HttpServletResponse)response;
			
			session.setAttribute("referer", req.getRequestURI());
			
			res.sendRedirect(req.getContextPath()+"/login.do");
		}else {
			chain.doFilter(request, response);
		}
		
		
		
	}

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		System.out.println("LoginCheckFilter2 init");
		
	}

}

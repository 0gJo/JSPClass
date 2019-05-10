package com.filter;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletResponseWrapper;

public class XSLTResponseWrapper extends HttpServletResponseWrapper {
// 버퍼를 사용하는 응답래퍼클래스
	
	private ResponseBufferWriter buffer = null;
	
	public XSLTResponseWrapper(HttpServletResponse response) {
		super(response);
		buffer = new ResponseBufferWriter();
	}

	@Override
	public PrintWriter getWriter() throws IOException {
		
		return buffer;
	}

	public String getBufferString() {
		return buffer.toString();
	}
	
}

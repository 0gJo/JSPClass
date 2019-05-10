package com.filter;

import java.io.PrintWriter;
import java.io.StringWriter;

public class ResponseBufferWriter extends PrintWriter {
// 응답데이터를 임시로 보관하는 버퍼로 사용할 출력 스트림
	
	public ResponseBufferWriter() {
		super(new StringWriter(4096));
		
	}
	
	public String toString() {
		return ((StringWriter)super.out).toString();
		
	}
	
}

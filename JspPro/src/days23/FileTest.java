package days23;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.oreilly.servlet.multipart.FileRenamePolicy;
import com.util.DBConn;

public class FileTest extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest request
			, HttpServletResponse response) throws ServletException, IOException {
		// request.getMethod()
		String uri = request.getRequestURI();
		Connection conn = DBConn.getConnection();
		String saveDirectory = 
				request.getRealPath("/days23/upload");

		if( uri.indexOf("write.do") != -1) {
			RequestDispatcher dispatcher 
			= request.getRequestDispatcher("ex03_write.jsp");
			dispatcher.forward(request, response);
		}else if( uri.indexOf("list.do") != -1) {
			FileTestDAO dao = FileTestDAO.getInstance();
			ArrayList<FileTestDTO> list = dao.selectFileList(conn);
			request.setAttribute("list", list);
			// list.jsp
			RequestDispatcher dispatcher = 
					request.getRequestDispatcher("ex03_list.jsp");
			dispatcher.forward(request, response);
		}else if( uri.indexOf("write_ok.do") != -1) {
			// ex01_03.java 복사 붙이기
			// pageContext 객체 : jsp  내장된 기본 객체 9 중 하나
			
System.out.println( saveDirectory );
			File saveDir = new File(saveDirectory);
			if( !saveDir.exists() ) saveDir.mkdirs();
			int maxPostSize = 1024*1024*5; // 5MB  단위 byte
			String encoding = "UTF-8";
			FileRenamePolicy policy = new DefaultFileRenamePolicy();

			// 첨부파일은 업로드 된 상태... 
			MultipartRequest mrequest 
			= new MultipartRequest(request, saveDirectory
					, maxPostSize, encoding, policy); 
			
			// 첨부파일 저장...
		String subject = mrequest.getParameter("subject");
			// DB insert -> list.jsp
			FileTestDAO dao = FileTestDAO.getInstance();
			FileTestDTO dto = new FileTestDTO();
		 dto.setSubject(subject);
			File uploadFile = mrequest.getFile("attachFile");
			
			if( uploadFile != null ) { // 첨부파일이 있는 경우에만.
				long uploadFile_length = uploadFile.length();
				String originalfilename = mrequest.getOriginalFileName("attachFile");
				String filesystemname  = mrequest.getFilesystemName("attachFile");
		dto.setFilelength(uploadFile_length);
		dto.setFilesystemname(filesystemname);
		dto.setOriginalfilename(originalfilename);
			}
			
			int result = dao.insert(conn, dto);
			// list.do 포워딩....
			response.sendRedirect("list.do");
			/*
			RequestDispatcher dispatcher = 
					request.getRequestDispatcher("list.do");
			dispatcher.forward(request, response);
			*/
		}else if(uri.indexOf("delete.do") != -1) {
			int num = Integer.parseInt( request.getParameter("num") );
			String filesystemname = request.getParameter("filesystemname");
			// 1. DB delete ~
			FileTestDAO dao = FileTestDAO.getInstance();
			int result = dao.delete( conn, num);
			// 2. /upload/ 폴더에서 첨부 파일 삭제
			// String deleteFilePath = saveDirectory+"/"+filesystemname;
			String deleteFilePath = String.format("%s%s%s",
					 saveDirectory, File.separator ,filesystemname);			
			File attachedFile = new File(deleteFilePath);
			if( attachedFile.exists() ) attachedFile.delete();
			//
			response.sendRedirect("list.do");
		}else if( uri.indexOf("update.do") != -1) {
			int num = Integer.parseInt( request.getParameter("num") );
			FileTestDAO dao = FileTestDAO.getInstance();
			FileTestDTO dto = dao.getDTO(conn, num);
			request.setAttribute("dto", dto);
			
			RequestDispatcher dispatcher 
			= request.getRequestDispatcher("update.jsp");
			dispatcher.forward(request, response);
		}else if(uri.indexOf("update_ok.do") != -1) {
System.out.println( saveDirectory );
            // upload 폴더 생성 유무 -> 생성    init() 옮겨놓으면.. 
			File saveDir = new File(saveDirectory);
			if( !saveDir.exists() ) saveDir.mkdirs();			
			int maxPostSize = 1024*1024*5; // 5MB  단위 byte
			String encoding = "UTF-8";
			FileRenamePolicy policy = new DefaultFileRenamePolicy();

			// 첨부파일은 업로드 된 상태... 
			MultipartRequest mrequest 
			= new MultipartRequest(request, saveDirectory
					, maxPostSize, encoding, policy); 
			
			// 첨부파일 저장...
int num = Integer.parseInt( mrequest.getParameter("num") );	
		String subject = mrequest.getParameter("subject");
			// DB insert -> list.jsp
			FileTestDAO dao = FileTestDAO.getInstance();
			FileTestDTO dto = new FileTestDTO();
dto.setNum(num); 	
		dto.setSubject(subject);
			File uploadFile = mrequest.getFile("attachFile");
			if( uploadFile != null ) { // 첨부파일이 있는 경우에만.
				long uploadFile_length = uploadFile.length();
				String originalfilename = mrequest.getOriginalFileName("attachFile");
				String filesystemname  = mrequest.getFilesystemName("attachFile");
		dto.setFilelength(uploadFile_length);
		dto.setFilesystemname(filesystemname);
		dto.setOriginalfilename(originalfilename);
		
		          // 첨부된 파일이 있다면 이전 첨부파일은 삭제 코딩 추가...
String delete_filesystemname = mrequest.getParameter("filesystemname");
		String deleteFilePath = String.format("%s%s%s",
				 saveDirectory, File.separator
				 ,delete_filesystemname);	
System.out.println(deleteFilePath);
        
		File deleteFile = new File(deleteFilePath);
		if( deleteFile.exists() ) deleteFile.delete();
		
			}else {
				//
			}
			
			int result = dao.update(conn, dto);
			// list.do 포워딩....
			response.sendRedirect("list.do");
			/*
			RequestDispatcher dispatcher = 
					request.getRequestDispatcher("list.do");
			dispatcher.forward(request, response);
			*/
		}
        
		DBConn.close();
	}

	@Override
	protected void doPost(HttpServletRequest request
			, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
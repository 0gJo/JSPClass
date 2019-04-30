package days05;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.Scanner;

import com.util.DBConn;

public class MyBoardController {
	
	private int selectedNumber;
	private Scanner scanner  = null;
	private MyBoardService boardService = null;
	
	private int currentPage = 1;
	private int numberPerPage = 10;
	private int numberOfPageBlocks = 10; // 1,2,3,4... 9,10
	
	
	public  MyBoardController() {
		this.scanner = new Scanner(System.in);
	}

	public MyBoardController(MyBoardService boardService) {
		this();
		this.boardService = boardService;
	}

	public void start() {
		while(true) {
			printMenu();
			selectMenu();
			processMenu();
		}
	}

	private void processMenu() {
		switch (this.selectedNumber) {
		case 1: // 새글
			새글쓰기();
			break;
		case 2: // 목록
			게시글목록조회();
			break;
		case 3: // 보기
			게시글상세보기();
			break;
		case 4: // 수정
			게시글수정();
			break;
		case 5: // 삭제
			게시글삭제();
			break;
		case 6: // 검색
			게시글검색();
			break;
		case 7: // 종료
			exit();
            break;
		} // swith
		
	}

	private void 게시글검색() {
		int searchCondition;  // 검색조건   1,2,3,4  name, subject, content
		String searchWord;         // 검색어
		System.out.print(
				"1. 검색조건 선택( 제목:1, 내용:2, 글쓴이:3, 제목+내용:4 ) ? ");
		searchCondition  = this.scanner.nextInt();
		System.out.print("2. 검색어 입력 ? ");
		searchWord = this.scanner.next();
		
		System.out.print("> 검색된 결과의  페이지 번호 입력 ? ");
		this.currentPage = this.scanner.nextInt();		
		//this.currentPage = 1;
		
		ArrayList<MyBoardDTO> list =
				this.boardService.selectSearchService(
						currentPage
						, numberPerPage
						, searchCondition
						, searchWord);		
		
		System.out.println("\t\t\t\t\t My게시판");
		System.out.println("------------------------------------------------------------------");
		System.out.printf(
				"%s\t%s\t%s\t%s\t%s\n"
				,"글번호","글제목","글쓴이","작성일","조회수");
		System.out.println("------------------------------------------------------------------");
		if( list != null ) {
			Iterator<MyBoardDTO> ir = list.iterator();
			while (ir.hasNext()) {
				MyBoardDTO dto = ir.next();
				System.out.printf(
						"%d\t%s\t%s\t%tF\t%d\n"
						, dto.getSeq(), dto.getSubject(),dto.getName()
						, dto.getRegdate(), dto.getCnt());			
			} // while
			System.out.println("------------------------------------------------------------------");			
			System.out.print("\t\t\t");		
			String pagingBlock =
					this.boardService.pagingBlockSearchService(
							currentPage,  numberPerPage 
							, numberOfPageBlocks
							, searchCondition
							, searchWord);		
			System.out.println(pagingBlock);	
		}else {
			System.out.println("\t 검색 결과 없습니다. ");
		}			
		System.out.println("------------------------------------------------------------------");
		일시정지();
		
	}

	private void 게시글수정() {
		System.out.print(
				"> 수정하고자 하는 게시글 글 번호(seq) 입력 ? ");
		int seq = this.scanner.nextInt();
		this.scanner.nextLine(); //
		
		// 1. 수정하고자 하는 게시글 정보 출력
		// 2. 수정하는 입력/ (제목, 내용)
		MyBoardDTO boardDto = null;
		try {
			boardDto = this.boardService.getBoardDao()
					.selectSeq(seq);
			System.out.println( "subject = "+ boardDto.getSubject() );
			System.out.println( "content = "+ boardDto.getContent() );
		} catch (SQLException e) { 
			//e.printStackTrace();
			System.out.println("수정할  게시글이 존재하지 않습니다.");
			return;
		}
		// 
		System.out.print("> 수정할 글비번, 글제목,글내용 입력 ? ");
		String password = scanner.nextLine();		
		String subject = scanner.nextLine();
		String content = scanner.nextLine();
		
		if( !password.equals(boardDto.getPassword()) ){
			System.out.println("비밀번호 잘못되었습니다.");
			return;
		}
		//		
		boardDto.setSeq(seq);
		boardDto.setSubject(subject);
		boardDto.setContent(content);
		
		int resultCnt = this.boardService.updateService(boardDto);
		if( resultCnt == 1 ) {
			System.out.println("> 수정 완료!!!");
		}
		일시정지();
	}

	private void 게시글상세보기() {
		System.out.print(
				"> 보고자 하는 게시글 글 번호(seq) 입력 ? ");
		int seq = this.scanner.nextInt();		
		MyBoardDTO boardDto =
				this.boardService.viewService(seq);		
		// 해당 게시글 출력 ...
		if ( boardDto != null ) {
			System.out.printf("글번호 : %d\n", seq );
			System.out.printf("조회수 : %d\n", boardDto.getCnt());
			System.out.printf("글쓴이 : %s\n", boardDto.getName());
			System.out.printf("글제목 : %s\n", boardDto.getSubject());
			System.out.printf("글내용 : %s\n", boardDto.getContent());
			
			System.out.println("\n [수정][삭제][목록]");			
		}else {
			System.out.println("해당 게시글 없습니다.");
		}
		일시정지();
		
	}

	private void 게시글삭제() {
		System.out.print(
				"> 삭제할 글번호(seq), 비밀번호(password) 입력 ? ");
		int seq = this.scanner.nextInt();
		String password = this.scanner.next();		
		int resultCnt = 
				this.boardService.deleteService(seq, password);		
		if( resultCnt > 0 ) {
			System.out.println("> 삭제 완료!!!");
		}else if( resultCnt == -1 ) {
			System.out.println("> 비밀번호가 잘못되었습니다.!!!");
		}
		일시정지();
	}

	private void 새글쓰기() {
		// 새글 게시글 정보 입력		
		System.out.print("> name : ");
		
		String name = this.scanner.nextLine();  
		System.out.print("> password : ");
		String password = this.scanner.nextLine(); 
		System.out.print("> email : ");
		String email = this.scanner.nextLine();  
		System.out.print("> subject : ");
		String subject = this.scanner.nextLine();  
		System.out.print("> content : ");
		String content = this.scanner.nextLine();  
		// DTO
		MyBoardDTO boardDto = new MyBoardDTO();
		boardDto.setName(name);
		boardDto.setPassword(password);
		boardDto.setEmail(email);
		boardDto.setSubject(subject);
		boardDto.setContent(content);
		// 
		int resultCnt = this.boardService.insertService(boardDto);
		if( resultCnt == 1 ) {
			System.out.println("> 새글쓰기 완료!!!");
		}
		일시정지();
	}

	private void 게시글목록조회() {
		System.out.print("> 페이지 번호 입력 ? ");
		this.currentPage = this.scanner.nextInt();
		
		// 컨트롤러 :  ArrayList<DTO>  MyBoardService.게시글목록조회()
		ArrayList<MyBoardDTO> list =
				this.boardService.selectService(currentPage, numberPerPage);		
		// 목록출력(View 역활)
		System.out.println("\t\t\t\t\t My게시판");
		System.out.println("------------------------------------------------------------------");
		System.out.printf(
				"%s\t%s\t%s\t%s\t%s\n"
				,"글번호","글제목","글쓴이","작성일","조회수");
		System.out.println("------------------------------------------------------------------");
		Iterator<MyBoardDTO> ir = list.iterator();
		while (ir.hasNext()) {
			MyBoardDTO dto = ir.next();
			System.out.printf(
					"%d\t%s\t%s\t%tF\t%d\n"
					, dto.getSeq(), dto.getSubject(),dto.getName()
					, dto.getRegdate(), dto.getCnt());			
		}
		System.out.println("------------------------------------------------------------------");
		//System.out.println("\t\t [1] 2 3 4 5 6 7 8 9 10 ▶");
		System.out.print("\t\t\t");
		/*
		for (int i = 1; i <=10; i++) {
			System.out.printf(
					this.currentPage == i ? "[%2d] ":"%2d ",  i);
			 
		}
		*/
		String pagingBlock =
				this.boardService.pagingBlockService(
						currentPage,  numberPerPage , numberOfPageBlocks );
		              // 현재페이지번호, 한페이지에 출력할게시글수,   1 ~ 10
		System.out.println(pagingBlock);		
		System.out.println("------------------------------------------------------------------");
		일시정지();
	}

	private void 일시정지() {
		System.out.print("\t\t> 계속하려면 엔터치세요....");
		try {
			System.in.read();
			System.in.skip(System.in.available());
		} catch (IOException e) { 
			e.printStackTrace();
		}
	}

	private void exit() { 
		DBConn.close();
		System.out.println("\t\t\t\t 프로그램 종료!!!");
		System.exit(-1);
	}

	private void selectMenu() { 
		System.out.print("> 메뉴 선택하세요 ? ");
		// 유효성 검사 ***
		this.selectedNumber = this.scanner.nextInt();
		this.scanner.nextLine();
	}

	private void printMenu() {
		String [] menus = {"새글","목록","보기"
				,"수정","삭제","검색","종료"};
		System.out.println("[ 메뉴 ]");
		for (int i = 0; i < menus.length; i++) {
			System.out.printf("%d. %s\t", i+1, menus[i]);
		}
		System.out.println();
	}
	
	private static void skip() {
		try {
			System.in.skip(System.in.available());
		} catch (IOException e) { 
			e.printStackTrace();
		}
	}
}











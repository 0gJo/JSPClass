package days05;

import java.sql.SQLException;
import java.util.ArrayList;

public class MyBoardService {
	private IMyBoardDAO boardDao = null; 
	public IMyBoardDAO getBoardDao() {
		return boardDao;
	}

	public MyBoardService(IMyBoardDAO boardDao) {
		this.boardDao = boardDao;
	}

	public ArrayList<MyBoardDTO> selectService(
			int currentPage
			, int numberPerPage) {
		ArrayList<MyBoardDTO> list = null;
		try {
			list = this.boardDao.select(currentPage, numberPerPage);
			// 로그 기록 : logDao.loginsert()
		} catch (SQLException e) { 
			e.printStackTrace();
		}
		return list;
	}

	public int insertService(MyBoardDTO boardDto) {
		// 1. dao insert
		int resultCnt = 0;
		try {
			resultCnt = this.boardDao.insert(boardDto);
		} catch (SQLException e) { 
			e.printStackTrace();
		}
		// 2. log 기록
		return resultCnt;
	}

	public int deleteService(int seq, String password) {
		// 1. 비밀번호 입력받아서  == seq(password)
		int resultCnt = 0;
		String seq_password;   // 실제 DB 비밀번호
		try {
			seq_password = this.boardDao.getPassword(seq);
			if( !password.equals(seq_password)) return -1;
			resultCnt = this.boardDao.delete(seq);
		} catch (SQLException e) { 
			e.printStackTrace();
		}
		return resultCnt;
	}

	// 트랜잭션 처리...
	public MyBoardDTO viewService(int seq) {
		MyBoardDTO boardDto = null;		
		try {
			// 1. 조회수 1증가
			this.boardDao.increaseCnt(seq);
			// 2. 해당 게시글 조회
			boardDto =  this.boardDao.selectSeq(seq);
		} catch (SQLException e) { 
			e.printStackTrace();
		}		
		return boardDto;
	}

	public int updateService(MyBoardDTO boardDto) {
		int resultCnt = 0;
		try { 
			resultCnt = this.boardDao.update(boardDto);
		} catch (SQLException e) { 
			e.printStackTrace();
		}
		return resultCnt;
	}

	public String pagingBlockService(
			int currentPage                      // 현재페이지
			, int numberPerPage              // 페이지당 게시글수
			, int numberOfPageBlocks) { // 페이지블럭 수
		// 총페이지수
		int numberOfPages  = 0;
		int pageBlockStart = 1;  // 
		int pageBlockEnd   = 10;
		String pagingBlock = "";
		try {
			numberOfPages  = 
					this.boardDao.getNumberOfPages(numberPerPage);
			pageBlockStart = ( currentPage - 1) / numberOfPageBlocks * numberOfPageBlocks + 1;
			pageBlockEnd = pageBlockStart + numberOfPageBlocks - 1;
			pageBlockEnd = pageBlockEnd > numberOfPages ? numberOfPages : pageBlockEnd;
			if(pageBlockStart != 1) pagingBlock += "◀  ";
			for (int i = pageBlockStart; i <= pageBlockEnd; i++) {
				pagingBlock += 
						String.format(currentPage == i ? "[%2d] ":"%2d ",  i);
			}
			if(pageBlockEnd != numberOfPages) pagingBlock += "  ▶";
		} catch (SQLException e) {
			e.printStackTrace();
		}		
		return pagingBlock;
	}

	public ArrayList<MyBoardDTO> selectSearchService(int currentPage, int numberPerPage, int searchCondition,
			String searchWord) {
		ArrayList<MyBoardDTO> list = null;
		try {
			list = this.boardDao.selectSearch(
					currentPage, numberPerPage
					, searchCondition, searchWord);
			// 로그 기록 : logDao.loginsert()
		} catch (SQLException e) { 
			e.printStackTrace();
		}
		return list;
	}

	public String pagingBlockSearchService(int currentPage, int numberPerPage, int numberOfPageBlocks,
			int searchCondition, String searchWord) {
		// 총페이지수
		int numberOfPages  = 0;
		int pageBlockStart = 1;  // 
		int pageBlockEnd   = 10;
		String pagingBlock = "";
		try {
			numberOfPages  = 
					this.boardDao.getSearchNumberOfPages(
							numberPerPage
							, searchCondition
							, searchWord);
			pageBlockStart = ( currentPage - 1) / numberOfPageBlocks * numberOfPageBlocks + 1;
			pageBlockEnd = pageBlockStart + numberOfPageBlocks - 1;
			pageBlockEnd = pageBlockEnd > numberOfPages ? numberOfPages : pageBlockEnd;
			if(pageBlockStart != 1) pagingBlock += "◀  ";
			for (int i = pageBlockStart; i <= pageBlockEnd; i++) {
				pagingBlock += 
						String.format(currentPage == i ? "[%2d] ":"%2d ",  i);
			}
			if(pageBlockEnd != numberOfPages) pagingBlock += "  ▶";
		} catch (SQLException e) {
			e.printStackTrace();
		}		
		return pagingBlock;
	}

}











package days05;

import java.sql.SQLException;
import java.util.ArrayList;

public interface IMyBoardDAO {
	// 게시글 작성
	int insert(MyBoardDTO boardDto) throws SQLException;
	
	// 게시글 목록
	ArrayList<MyBoardDTO> select(int curPage, int pageSize) throws SQLException;

	int delete(int seq) throws SQLException;

	String getPassword(int seq) throws SQLException;

	void increaseCnt(int seq) throws SQLException;

	MyBoardDTO selectSeq(int seq) throws SQLException;

	int update(MyBoardDTO boardDto) throws SQLException;

	// 총페이지수 반환 메서드
	int getNumberOfPages(int numberPerPage) throws SQLException;

	ArrayList<MyBoardDTO> selectSearch(int currentPage, int numberPerPage
			, int searchCondition, String searchWord) throws SQLException;

	int getSearchNumberOfPages(int numberPerPage
			, int searchCondition, String searchWord) throws SQLException;
	
}











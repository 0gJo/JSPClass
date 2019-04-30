package days05;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class MyBoardDAOImpl implements IMyBoardDAO {
	
	private Connection connection = null;
	private Statement stmt = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	// DI = 생성자, setter 
	public MyBoardDAOImpl(Connection connection) {
		super();
		this.connection = connection;
	}

	public void setConnection(Connection connection) {
		this.connection = connection;
	}


	@Override
	public int insert(MyBoardDTO boardDto) throws SQLException {
		String sql="insert into tbl_myboard " +
		" ( seq, name, password, email, subject, content, tag, userip) "+
		" values "+
		" ( seq_myboard.nextval,?,?,?,?,?,'y','211.63.89.163')";		
		this.pstmt = this.connection.prepareStatement(sql);
			// ?,?,?,?,?   바인딩변수값 설정.
			this.pstmt.setString(1, boardDto.getName());
			this.pstmt.setString(2, boardDto.getPassword());
			this.pstmt.setString(3, boardDto.getEmail());
			this.pstmt.setString(4, boardDto.getSubject());
			this.pstmt.setString(5, boardDto.getContent());
		int resultCnt = this.pstmt.executeUpdate();		
		this.pstmt.close();
		return resultCnt;
	}

	
    // currentPage 			현재페이지
	// numberPerPage		페이지당 출력 게시글 수
	@Override
	public ArrayList<MyBoardDTO> select(
			                 int currentPage
			                , int numberPerPage) throws SQLException {
		ArrayList<MyBoardDTO> list = null;
		
		String sql = " select *                                                     ";
			    sql+=     " from (                                                       ";
				sql+=   "     select rownum no, t.*                                    ";
				sql+=   "     from (                                                   ";
				sql+=   "         select  seq, name, email, subject, cnt, regdate      ";
				sql+=   "         from tbl_myboard                                     ";
				sql+=   "         order by seq desc                                    ";
				sql+=   "     ) t                                                      ";
				sql+=   " ) b                                                          ";
				sql+=   " where b.no between ? and ?                  ";
				
				//sql+=   " where b.no between (%1$d-1)*%2$d+1 and %1$d*%2$d                  ";				
				//sql = String.format(sql, currentPage, numberPerPage);
				
				//this.stmt = this.connection.createStatement();
				//this.rs     = this.stmt.executeQuery(sql);
				int start = (currentPage-1)*numberPerPage+1;
				int end   = currentPage*numberPerPage ;
				this.pstmt = this.connection.prepareStatement(sql);
				this.pstmt.setInt(1, start);
				this.pstmt.setInt(2, end);
				this.rs =	this.pstmt.executeQuery();	
			
				if (this.rs.next()) {
					list = new ArrayList<>();
					MyBoardDTO dto = null;
					do {
						dto = new MyBoardDTO();
						// seq, name, email, subject, cnt, regdate
							dto.setSeq( this.rs.getInt("seq") );
							dto.setName(this.rs.getString("name"));
							dto.setEmail(this.rs.getString("email"));
							dto.setSubject(this.rs.getString("subject"));
							dto.setCnt(this.rs.getInt("cnt"));
							dto.setRegdate(this.rs.getDate("regdate"));
						list.add(dto);  // 
					} while (this.rs.next());
				}
				
				this.rs.close();
				//this.stmt.close();
				this.pstmt.close();
		
		return list;
	}

	@Override
	public int delete(int seq) throws SQLException {
		String sql = "delete from tbl_myboard "
				+ " where seq = ?";
		this.pstmt = this.connection.prepareStatement(sql);
		this.pstmt.setInt(1, seq);
		int resultCnt = this.pstmt.executeUpdate();		
		this.pstmt.close();		
		return resultCnt;
	}

	@Override
	public String getPassword(int seq) throws SQLException {
		String password = null;
		String sql = "select password from tbl_myboard "
				+ " where seq = ?";
		this.pstmt = this.connection.prepareStatement(sql);
		this.pstmt.setInt(1, seq);
		this.rs =  this.pstmt.executeQuery();
		this.rs.next();
		password = this.rs.getString("password");
		
		this.pstmt.close();
		this.rs.close();
		return password;
	}

	@Override
	public void increaseCnt(int seq) throws SQLException {
		String sql ="update tbl_myboard		 "
				+ "set  cnt = cnt + 1		 "
				+ "where seq = ?";
		this.pstmt = this.connection.prepareStatement(sql);
		this.pstmt.setInt(1, seq);
		int resultCnt = this.pstmt.executeUpdate();
		this.pstmt.close();
	}

	@Override
	public MyBoardDTO selectSeq(int seq) throws SQLException {
		String sql = 
				   " select name, email, subject, content, cnt, regdate , password "
		        +" from tbl_myboard " 
				+" where seq = ?";
		this.pstmt = connection.prepareStatement(sql);
		this.pstmt.setInt(1, seq);
		MyBoardDTO boardDto = null;
		this.rs = this.pstmt.executeQuery();
		if( this.rs.next() ) {
			boardDto = new MyBoardDTO();
				boardDto.setName( 	rs.getString("name") );
				boardDto.setEmail( 	rs.getString("email") );
				boardDto.setSubject( rs.getString("subject") );
				boardDto.setContent( rs.getString("content") );
				boardDto.setCnt( 		 rs.getInt("cnt") );
				boardDto.setRegdate( rs.getDate("regdate") ); 
				//
				boardDto.setPassword(rs.getString("password"));
		}
		this.pstmt.close();
		this.rs.close();
		
		return boardDto;
	}

	@Override
	public int update(MyBoardDTO boardDto) throws SQLException {
		
		String sql =" update tbl_myboard " +
					       " set subject=?, content=? " +
					       " where seq = ? ";
		
		this.pstmt = connection.prepareStatement(sql);
			this.pstmt.setString(1, boardDto.getSubject());
			this.pstmt.setString(2, boardDto.getContent());
			this.pstmt.setInt(3, boardDto.getSeq());
		int resultCnt = this.pstmt.executeUpdate();
		
		this.pstmt.close();
		return resultCnt ;
	}

	@Override
	public int getNumberOfPages(int numberPerPage) throws SQLException {
		int numberOfPages = 0;
		String sql = "select count(*)  numberOfPostings     " + 
				            "  , ceil( count(*)/? )   numberOfPages " + 
				            "  from tbl_myboard";
		this.pstmt = connection.prepareStatement(sql);		
		this.pstmt.setInt(1, numberPerPage );
	    this.rs = this.pstmt.executeQuery();
	    if( rs.next() ) {
	    	numberOfPages = rs.getInt(2);
	    }
	    this.pstmt.close();
	    this.rs.close();
	    return numberOfPages ;
	}

	@Override
	public ArrayList<MyBoardDTO> selectSearch(int currentPage, int numberPerPage, int searchCondition,
			String searchWord) throws SQLException {
ArrayList<MyBoardDTO> list = null;
		
		String sql = " select *                                                     ";
			    sql+=     " from (                                                       ";
				sql+=   "     select rownum no, t.*                                    ";
				sql+=   "     from (                                                   ";
				sql+=   "         select  seq, name, email, subject, cnt, regdate      ";
				sql+=   "         from tbl_myboard                                     ";
				switch (searchCondition) {
				case 1: sql+=   "    where regexp_like( subject, ? , 'i') "; break;
				case 2: sql+=   "    where regexp_like( content, ? , 'i')  "; break;
				case 3: sql+=   "    where regexp_like( name, ? , 'i')  "; break;
				case 4: sql+=   "    where regexp_like( subject, ? , 'i')   or regexp_like( content, ? , 'i')  ";break;
		        
				/*
				case 1: // 제목
					sql+=   "    where subject like ? ";    
					break;
				case 2: // 내용
					sql+=   "    where content like ? ";
					break;
				case 3:  // 글쓴이
					sql+=   "    where name like ? ";
					break;
				case 4:   // 제목 + 내용
					sql+=   "    where subject like ?  or content like ? ";
					break;
					*/
				}
				sql+=   "         order by seq desc                                    ";
				sql+=   "     ) t                                                      ";
				sql+=   " ) b                                                          ";
				sql+=   " where b.no between ? and ?                  ";
			
				System.out.println(sql);
				
				int start = (currentPage-1)*numberPerPage+1;
				int end   = currentPage*numberPerPage ;
				this.pstmt = this.connection.prepareStatement(sql);
				
				//this.pstmt.setString(1, "%"+searchWord+"%");
				this.pstmt.setString(1, searchWord);
				if( searchCondition == 4 ) {
					this.pstmt.setString(2, searchWord);
					this.pstmt.setInt(3, start);  // 3
					this.pstmt.setInt(4, end);   // 4
				}else {
					this.pstmt.setInt(2, start);  // 3
					this.pstmt.setInt(3, end);   // 4
				}				
				
				this.rs =	this.pstmt.executeQuery();	
			
				if (this.rs.next()) {
					list = new ArrayList<>();
					MyBoardDTO dto = null;
					do {
						dto = new MyBoardDTO();						
							dto.setSeq( this.rs.getInt("seq") );
							dto.setName(this.rs.getString("name"));
							dto.setEmail(this.rs.getString("email"));
							dto.setSubject(this.rs.getString("subject"));
							dto.setCnt(this.rs.getInt("cnt"));
							dto.setRegdate(this.rs.getDate("regdate"));
						list.add(dto);  // 
					} while (this.rs.next());
				}
				
				
				
				this.rs.close();
				this.pstmt.close();
		
		return list;
	}

	@Override
	public int getSearchNumberOfPages(int numberPerPage
			, int searchCondition, String searchWord) throws SQLException {
		int numberOfPages = 0;
		String sql = "select count(*)  numberOfPostings     " + 
				            "  , ceil( count(*)/? )   numberOfPages " + 
				            "  from tbl_myboard " ;
		switch (searchCondition) {
		case 1: sql+=   "    where regexp_like( subject, ? , 'i') "; break;
		case 2: sql+=   "    where regexp_like( content, ? , 'i')  "; break;
		case 3: sql+=   "    where regexp_like( name, ? , 'i')  "; break;
		case 4: sql+=   "    where regexp_like( subject, ? , 'i')   or regexp_like( content, ? , 'i')  ";break;
            /*		
			case 1: sql+=   "    where subject like ? "; break;
			case 2: sql+=   "    where content like ? "; break;
			case 3: sql+=   "    where name like ? "; break;
			case 4: sql+=   "    where subject like ?  or content like ? ";break;
			*/
		}
		
		this.pstmt = connection.prepareStatement(sql);
		
		this.pstmt.setInt(1, numberPerPage );
		//this.pstmt.setString(2, "%"+searchWord +"%");
		this.pstmt.setString(2, searchWord );
		if( searchCondition == 4) 	
			this.pstmt.setString(3, searchWord);
		
	    this.rs = this.pstmt.executeQuery();
	    if( rs.next() ) {
	    	numberOfPages = rs.getInt(2);
	    }
	    this.pstmt.close();
	    this.rs.close();
	    return numberOfPages ;
	}

}











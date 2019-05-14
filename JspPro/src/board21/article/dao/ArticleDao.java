package board21.article.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.util.JdbcUtil;

import board21.article.model.Article;
import board21.article.model.Writer;

public class ArticleDao {

	public int insert(Connection conn, Article article) throws SQLException {
	

		PreparedStatement pstmt = null;
		Statement stmt = null;
		ResultSet rs =  null;
		
		try {
		pstmt = conn.prepareStatement("insert into article21 " + 
				"(article_no, writer_id, writer_name, title, content ,read_cnt)  " + 
				"values(seq_article21.nextval, ?, ?, ?, ?, 0)");
		
		pstmt.setString(1, article.getWriter().getId());
		pstmt.setString(2, article.getWriter().getName());
		pstmt.setString(3, article.getTitle());
		pstmt.setString(4, article.getContent());

		int insertedCount = pstmt.executeUpdate();
		
		int newArticleNo = 0;
		
		if (insertedCount>0) {
			stmt = conn.createStatement();
			rs = stmt.executeQuery("select article_no from article21");
			
			if (rs.next()) {newArticleNo = rs.getInt(1);}
			
		}
		
		return newArticleNo;
		
		}finally {
			JdbcUtil.close(pstmt);
			
			
		}
		
	}

	
	public int selectCount(Connection conn) throws SQLException {
		
		Statement stmt = null;
		ResultSet rs = null;
		
		
		try {
		stmt = conn.createStatement();
		rs = stmt.executeQuery("select count(*) from article21");
		
		if (rs.next()) {
			return rs.getInt(1);
		}
		
		return 0;
		
		}finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(stmt);
		}
		
		
		
	}
	
	
	public List<Article> select (Connection conn, int startRow, int size) throws SQLException{
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		
		try {
			
			
			String sql = " select *                                                     ";
			sql+=     " from (                                                       ";
			sql+=   "     select rownum no, t.*                                    ";
			sql+=   "     from (                                                   ";
			sql+=   "         select  *      ";
			sql+=   "         from article21                                     ";
			sql+=   "         order by article_no desc                                    ";
			sql+=   "     ) t                                                      ";
			sql+=   " ) b                                                          ";
			sql+=   " where b.no between ? and ?                  ";	
			
			
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, startRow+size-1);
			//size : 한 페이지당 게시글수

			rs = pstmt.executeQuery();
			
			List<Article>  result = new ArrayList<>();
			
			while (rs.next()) {
				result.add(convertArticle(rs));
			}
			
			return result;
			
		}finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
			
		}
		
		
	}


	private Article convertArticle(ResultSet rs) throws SQLException {
		
		Article new_article = new Article(rs.getInt("article_no"), new Writer(rs.getString("writer_id"), rs.getString("writer_name")), rs.getString("title"), rs.getString("content"),rs.getDate("regdate"), rs.getDate("moddate"), rs.getInt("read_cnt"));
		return new_article;
	}
	
	
}

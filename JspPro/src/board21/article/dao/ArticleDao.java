package board21.article.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.util.JdbcUtil;

import board21.article.model.Article;

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
	
}

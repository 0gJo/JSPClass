package board21.article.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.Date;

import javax.naming.NamingException;

import com.util.ConnectionProvider;
import com.util.JdbcUtil;

import board21.article.dao.ArticleDao;
import board21.article.model.Article;

public class WriteArticleService {

	
	private ArticleDao articleDao = new ArticleDao();
	
	public int write(WriteRequest req) {
		
		Connection conn = null;
		
	   try {
		conn= 	ConnectionProvider.getConnection();
		conn.setAutoCommit(false);
		
		Article article = toArticle(req);
		
		int savedArticleNo = articleDao.insert(conn, article);
		
		if (savedArticleNo == 0) {
			
			throw new RuntimeException("fail to insert article");
			
		}
		
		conn.commit();
		
		return savedArticleNo;
		
		
	} catch (NamingException e) {
		e.printStackTrace();
		JdbcUtil.rollback(conn);
		throw new RuntimeException(e);
	} catch (SQLException e) {
		e.printStackTrace();
		JdbcUtil.rollback(conn);
		throw new RuntimeException(e);
	}finally {
		JdbcUtil.close(conn);
	}

		
		
	}

	private Article toArticle(WriteRequest req) {
		
		return new Article(null, req.getWriter(), req.getTitle(), req.getContent(), new Date(), new Date(),0 );
	}
	
	
}

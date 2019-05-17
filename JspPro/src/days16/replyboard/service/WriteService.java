package days16.replyboard.service;

import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.NamingException;

import com.util.ConnectionProvider;
import com.util.JdbcUtil;

import days16.replyboard.dao.ReplyBoardDAO;
import days16.replyboard.model.ReplyBoardDTO;

public class WriteService {

	
	
public int write(ReplyBoardDTO dto) {
		
	ReplyBoardDAO dao = ReplyBoardDAO.getInstance();
	
		Connection conn = null;
		
	   try {
		conn= ConnectionProvider.getConnection();
		conn.setAutoCommit(false);
		
		System.out.println(conn);
		
		
		int savedArticleNo = dao.insert(conn, dto);
		
		if (savedArticleNo == 0) {
			
			//throw new RuntimeException("fail to insert article");
			
		}
		
		//conn.commit();
		
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
	
	
	
}

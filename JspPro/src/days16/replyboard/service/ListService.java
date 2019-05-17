package days16.replyboard.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.naming.NamingException;

import com.util.ConnectionProvider;

import days16.replyboard.dao.ReplyBoardDAO;
import days16.replyboard.model.ReplyBoardDTO;



public class ListService {
	private ReplyBoardDAO dao = ReplyBoardDAO.getInstance();
	private int size = 10;

	public List select() {
		try (Connection conn = ConnectionProvider.getConnection()) {
			
			//int total = dao.selectCount(conn);
			
			List<ReplyBoardDTO> list = dao.selectList(conn);
			
			return list;
			
		} catch (SQLException | NamingException e) {
			throw new RuntimeException(e);
		}
	}
}

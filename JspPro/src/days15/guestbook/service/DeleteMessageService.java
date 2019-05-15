package days15.guestbook.service;

import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.NamingException;

import com.util.ConnectionProvider;
import com.util.JdbcUtil;

import days15.guestbook.dao.MessageDao;
import days15.guestbook.model.Message;


public class DeleteMessageService {

	private static DeleteMessageService instance = new DeleteMessageService();

	public static DeleteMessageService getInstance() {
		return instance;
	}

	private DeleteMessageService() {
	}

	public void deleteMessage(int messageId, String password) {
		Connection conn = null;
		try {
			conn = ConnectionProvider.getConnection();
			conn.setAutoCommit(false);

			MessageDao messageDao = MessageDao.getInstance();
			Message message = messageDao.select(conn, messageId);
			if (message == null) {
				throw new MessageNotFoundException("메시지 없음");
			}
			if (!message.matchPassword(password)) {
				throw new InvalidPassowrdException("bad password");
			}
			messageDao.delete(conn, messageId);

			conn.commit();
		} catch (SQLException ex) {
			JdbcUtil.rollback(conn);
			throw new ServiceException("삭제 실패:" + ex.getMessage(), ex);
		} catch (InvalidPassowrdException | MessageNotFoundException ex) {
			JdbcUtil.rollback(conn);
			throw ex;
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn);
		}
	}
}
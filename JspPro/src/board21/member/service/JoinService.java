package board21.member.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.Date;

import javax.naming.NamingException;

import com.util.ConnectionProvider;
import com.util.JdbcUtil;

import board21.member.dao.MemberDao;
import board21.member.model.Member;

public class JoinService {
	// 회원가입 기능 제공
	
	private MemberDao memberDao = new MemberDao();
	
	public void join(JoinRequest joinReq) {
		Connection conn = null;
		
		try {
			conn = ConnectionProvider.getConnection();
			conn.setAutoCommit(false);
			
		// 있는지 확인
		Member member = memberDao.selectById(conn, joinReq.getId());
		
		if (member!=null) { // 존재하면 
			JdbcUtil.rollback(conn);
			throw new DuplicatedException();
		}
		
		// 없으면 db에 가입시키기
		memberDao.insert(conn, new Member(joinReq.getId(), joinReq.getName(), joinReq.getPassword(), new Date()));
	
		conn.commit();
	
		} catch (NamingException | SQLException e) {
			e.printStackTrace();
			JdbcUtil.rollback(conn);
			throw new RuntimeException(e);
			
		}finally {
			JdbcUtil.close(conn);
		}
		
		
		
		
		
	}
	
}

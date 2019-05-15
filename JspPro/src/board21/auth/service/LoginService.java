package board21.auth.service;

import java.sql.Connection;

import com.util.ConnectionProvider;

import board21.member.dao.MemberDao;
import board21.member.model.Member;

public class LoginService {

	private MemberDao memberDao = new MemberDao();
	
	public User login( String id, String password) {
		try(Connection conn = ConnectionProvider.getConnection()) {
			Member member = memberDao.selectById(conn, id);
			
			if (member == null) {
				// 회원 정보가 없을 경우
				throw new LoginFailException();
			}
			
			if (!member.matchPassword(password)) {
			// 비밀번호 불일치 하는경우 
				throw new LoginFailException();
			}
			
			return new User(member.getMemberid(), member.getName());
			
		} catch (Exception e) {
			throw new RuntimeException(e);	
			}
		
	}
}

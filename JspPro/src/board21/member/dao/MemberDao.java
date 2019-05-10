package board21.member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Date;

import com.util.JdbcUtil;

import board21.member.model.Member;

public class MemberDao {

	public Member selectById(Connection conn, String id) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Member member = null;
		try {
			pstmt = conn.prepareStatement("select * from member where memberid = ?");
			
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			
			
			if (rs.next()) {
				
				member = new Member(rs.getString("memberid"), rs.getString("name"), rs.getString("password"), rs.getTimestamp("regdate"));
				
			}
			
			
			
			
		} catch (SQLException e) {
		
			e.printStackTrace();
		
		}finally {
			
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
	
		return member;
		
	}
	
	
	private Date toDate(Timestamp date) {
		
		return date==null? null : new Date(date.getTime());
	}
	
	
	public void insert(Connection conn, Member mem) {
		
		try {
			PreparedStatement pstmt = conn.prepareStatement("insert into member values(?,?,?,?)");
			pstmt.setString(1, mem.getMemberid());
			pstmt.setString(2, mem.getName());
			pstmt.setString(3, mem.getPassword());
			pstmt.setTimestamp(4, new Timestamp(mem.getRegDate().getTime()));
			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		
	}
	
}

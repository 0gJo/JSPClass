package days02;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;

// DBCP[DataBaseConnectionPool] 커넥션객체풀장
public class DBCPInit extends HttpServlet{ 

	@Override
	public void init() throws ServletException { 
		loadJDBCDriver();
		initConnectionPool();
	}

	private void initConnectionPool() {
		Connection connection = null;
		String url = this.getInitParameter("url") ; // Type 4
		String user = this.getInitParameter("user");
		String password = this.getInitParameter("password");	
		try { 
			connection = DriverManager.getConnection(url, user, password);
			System.out.println("> 커넥션 객체 생성 후 DBCP 생성 완료!!!");
		} catch (SQLException e) { 
			e.printStackTrace();
		}
	}

	private void loadJDBCDriver() { 
		// 만약에 className 파라미터가 없으면 null를 반환한다.
		String className = this.getInitParameter("className");
		try {
			Class.forName(className);			
			System.out.println("> JDBC 드라이버 로딩 완료!!!");
		} catch (ClassNotFoundException e) { 
			e.printStackTrace();
		}
	}

}

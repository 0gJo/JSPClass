package days02;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;


//DataBaseConnectionPool
public class DBCPInit extends HttpServlet{

	
	
	public DBCPInit() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	public void init() throws ServletException {
		
		loadJDBCDriver();
		initConnectionPool();
		
		//jdbcPro/src/com/util
	}

	private void initConnectionPool() {
		Connection connection = null;
		//String className = "oracle.jdbc.driver.OracleDriver";
		//this : 이 서블릿class
		String url =  this.getInitParameter("url");//"jdbc:oracle:thin:@localhost:1521:xe"; // Type 4
		String user = this.getInitParameter("user");//"scott";
		String password =this.getInitParameter("password");//"tiger";			
		String className = this.getInitParameter("className");
		try {
			Class.forName(className);
			connection = DriverManager.getConnection(url, user, password);
			System.out.println("커낵션 객체 생성후 DBCP 생성완료");
		} catch (SQLException | ClassNotFoundException e) { 
			e.printStackTrace();
		}
		
	}

	private void loadJDBCDriver() {
		// 만약 classNameParam 없으면 null
		String className = this.getInitParameter("className");//"oracle.jdbc.driver.OracleDriver";
		try {
			Class.forName(className);
			System.out.println("JDBC 드라이버 로딩완료");
		} catch (ClassNotFoundException e) { 
			e.printStackTrace();
		}
		
	}

	
	
}

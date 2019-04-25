package com.util;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.Enumeration;
import java.util.Vector;

// 커넥션 풀 :   미리 커넥션 객체를 풀에 생성해서 빌려주고 받고... 재사용.
public class ConnPool{
	// 1. 컬렉션 객체 생성 
	private Vector<Connection> buffer = new Vector<>();
	// 2.  static  생성
	private static ConnPool connPool = new ConnPool();
	// 3. 생성자  private
	private ConnPool() {}
	
	static{
		try{
			initConnPool();
		}catch(SQLException e){
			System.out.println("---Connection Create Error---");
			e.printStackTrace();
		}catch(ClassNotFoundException e2){
			System.out.println("---Driver Calss Not Found Error--");
			e2.printStackTrace();
		}
	}

	public static void initConnPool()
			throws SQLException, ClassNotFoundException{
		// 제거..... 
		destroyConnPool();
		//                   non static  this.buffer   
		Vector temp = ConnPool.getConnPool().getConnPoolBuffer();
		// 
		ConnFactory factory = ConnFactory.getDefaultFactory();
		// 
		for(int i=0; i< factory.getMaxConn() ; i++){
			Connection conn = factory.createConnection();
			temp.addElement(conn);
			System.out.println("ConnPool add : New Connection Created.." + conn);
		}
	}

	public synchronized static void destroyConnPool(){
		// 
		Vector temp = ConnPool.getConnPool().getConnPoolBuffer();
		// 
		Enumeration en = temp.elements();
		while(en.hasMoreElements()){
			Connection conn = (Connection)en.nextElement();
			if(conn!=null){
				try{
					conn.close();
					System.out.println("Connnection Closed.." + conn);
				}catch(SQLException e){e.printStackTrace();}
			}
		}
	}

	// 싱글톤
	public static ConnPool getConnPool(){
		if(connPool == null){
			connPool = new ConnPool();
		}
		return connPool;
	}

	//  synchronized
	public synchronized Connection getConnection() throws InterruptedException{
		while(buffer.size()==0){
			this.wait();  // 
		}
		Connection conn = 
				(Connection)this.buffer.remove(buffer.size()-1);
		System.out.println("Connection 대여 getConnection()" + conn);
		return conn;
	}

	// synchronized
	public synchronized void releaseConnection(Connection conn){
		this.buffer.addElement(conn);
		System.out.println("Connection 반환 releaseConnection()" + conn);
		this.notifyAll();
	}

	private Vector getConnPoolBuffer(){
		return this.buffer;
	}

}










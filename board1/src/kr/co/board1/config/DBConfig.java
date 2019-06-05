package kr.co.board1.config;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConfig {
	//데이터베이스 정보
	final static String HOST = "jdbc:mysql://192.168.0.161:3306/lyj";
	final static String USER = "lyj";
	final static String PASS = "1234";
	
	public static Connection getConnection() throws Exception {	//class 메서드로 만들면 new를 사용하지 않아도됨 
																//static은 static 만 사용가능 
		
		//1단계 - JDBC 드라이버 로드 
		Class.forName("com.mysql.jdbc.Driver");
				
		//2단계 - 데이터베이스 접속
		Connection conn = DriverManager.getConnection(HOST,USER,PASS);
		
		return conn;
				
	}
		
}

package kr.co.farmstory.config;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConfig {
	//?��?��?��베이?�� ?���?
	final static String HOST = "jdbc:mysql://192.168.0.161:3306/lyj";
	final static String USER = "lyj";
	final static String PASS = "1234";
	
	public static Connection getConnection() throws Exception {	//class 메서?���? 만들�? new�? ?��?��?���? ?��?��?��?�� 
																//static?? static �? ?��?���??�� 
		
		//1?���? - JDBC ?��?��?���? 로드 
		Class.forName("com.mysql.jdbc.Driver");
				
		//2?���? - ?��?��?��베이?�� ?��?��
		Connection conn = DriverManager.getConnection(HOST,USER,PASS);
		
		return conn;
				
	}
		
}

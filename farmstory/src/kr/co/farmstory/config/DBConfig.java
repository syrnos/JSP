package kr.co.farmstory.config;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConfig {
	//?°?´?„°ë² ì´?Š¤ ? •ë³?
	final static String HOST = "jdbc:mysql://192.168.0.161:3306/lyj";
	final static String USER = "lyj";
	final static String PASS = "1234";
	
	public static Connection getConnection() throws Exception {	//class ë©”ì„œ?“œë¡? ë§Œë“¤ë©? newë¥? ?‚¬?š©?•˜ì§? ?•Š?•„?„?¨ 
																//static?? static ë§? ?‚¬?š©ê°??Š¥ 
		
		//1?‹¨ê³? - JDBC ?“œ?¼?´ë²? ë¡œë“œ 
		Class.forName("com.mysql.jdbc.Driver");
				
		//2?‹¨ê³? - ?°?´?„°ë² ì´?Š¤ ? ‘?†
		Connection conn = DriverManager.getConnection(HOST,USER,PASS);
		
		return conn;
				
	}
		
}

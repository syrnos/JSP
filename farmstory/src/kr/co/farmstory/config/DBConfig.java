package kr.co.farmstory.config;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConfig {
	//?°?΄?°λ² μ΄?€ ? λ³?
	final static String HOST = "jdbc:mysql://192.168.0.161:3306/lyj";
	final static String USER = "lyj";
	final static String PASS = "1234";
	
	public static Connection getConnection() throws Exception {	//class λ©μ?λ‘? λ§λ€λ©? newλ₯? ?¬?©?μ§? ????¨ 
																//static?? static λ§? ?¬?©κ°??₯ 
		
		//1?¨κ³? - JDBC ??Ό?΄λ²? λ‘λ 
		Class.forName("com.mysql.jdbc.Driver");
				
		//2?¨κ³? - ?°?΄?°λ² μ΄?€ ? ?
		Connection conn = DriverManager.getConnection(HOST,USER,PASS);
		
		return conn;
				
	}
		
}

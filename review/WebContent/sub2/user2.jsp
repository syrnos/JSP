<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	//파라미터 수신 
	
	//1단계 
	Class.forName("com.mysql.jdbc.Driver");
	//2단계 
	
	String host = "jdbc:mysql://192.168.0.161:3306/lyj";
	String user = "lyj";
	String pass = "1234";
	
	Connection conn = DriverManager.getConnection(host,user,pass);
	
	String sql = "INSERT INTO `REVIEW_USER2` set name=?, birth=?, addr=?, rdate=?";
	PreparedStatement psmt = conn.prepareStatement(sql);
	//4단계 
	
	//5단계 
	
	//6단계 
	
	//리다이렉트
	response.sendRedirect("../review2.jsp");


%>
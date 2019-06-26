<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	//파라미터 수신 
	String uid = request.getParameter("uid");
	String name = request.getParameter("name");
	String hp = request.getParameter("hp");
	String age = request.getParameter("age");
	
	//1단계 
	Class.forName("com.mysql.jdbc.Driver");
	//2단계 
	
	String host = "jdbc:mysql://192.168.0.161:3306/lyj";
	String user = "lyj";
	String pass = "1234";
	
	Connection conn = DriverManager.getConnection(host,user,pass);
	
	//3단계 
	Statement stmt = conn.createStatement(); 
	//4단계 
	String sql = "INSERT INTO `REVIEW_USER1` ";
			sql += "VALUES ('"+uid+"','"+name+"','"+hp+"',"+age+", NOW());";
					
	stmt.executeUpdate(sql);
	//5단계 
	
	//6단계 
	stmt.close();
	conn.close();
	
	//리다이렉트
	response.sendRedirect("../review2.jsp");


%>
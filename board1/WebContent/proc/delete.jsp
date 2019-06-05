<%@page import="java.sql.PreparedStatement"%>
<%@page import="kr.co.board1.config.SQL"%>
<%@page import="kr.co.board1.config.DBConfig"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String seq = request.getParameter("seq");
	String parent = request.getParameter("parent");				//댓글 삭제 
	String pg = request.getParameter("pg");
	
	//1단계, 2단계
	Connection conn = DBConfig.getConnection();
	
	//3단계
	PreparedStatement psmt = conn.prepareStatement(SQL.DELETE_BOARD);
	psmt.setString(1, seq);
	
	//4단계 
	psmt.executeUpdate();
	
	//5단계
	
	//6단계
	
	conn.close();
	psmt.close();
	
	if(parent == null){
		response.sendRedirect("../list.jsp?pg="+pg);
	} else {
		response.sendRedirect("../view.jsp?seq="+parent+"&pg="+pg);	//댓글 삭제
	}
	
%>
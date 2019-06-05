<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="kr.co.board1.bean.UserBean"%>
<%@page import="kr.co.board1.config.SQL"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="kr.co.board1.config.DBConfig"%>
<%@page import="org.json.simple.JSONObject"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String parent = request.getParameter("parent");
	String content = request.getParameter("content");
	String regip = request.getRemoteAddr();
	
	//현재 로그인 사용자 세선 열기
	UserBean ub = (UserBean) session.getAttribute("user");
	
	//1단계, 2단계
	Connection conn = DBConfig.getConnection();
	
	//3단계
	PreparedStatement psmt = conn.prepareStatement(SQL.INSERT_COMMENT);
	psmt.setString(1, parent);
	psmt.setString(2, content);
	psmt.setString(3, ub.getUid());
	psmt.setString(4, regip);
	
	
	//4단계
	psmt.executeUpdate();
	
	//5단계
	
	
	//6단계
	psmt.close();
	conn.close();
	
	
	//JSON 데이터 생성
	Date date = new Date();
	SimpleDateFormat sdf = new SimpleDateFormat("yy-MM-dd");
	String today = sdf.format(date);
	
	JSONObject json = new JSONObject();
	json.put("content", content);
	json.put("nick", ub.getNick());
	json.put("rdate", today);
	out.print(json);
%>
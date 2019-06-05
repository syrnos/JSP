<%@page import="kr.co.board1.config.DBConfig"%>
<%@page import="kr.co.board1.config.SQL"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="org.json.simple.JSONObject"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");		//습관적으로 지정해놓으면 좋음 

	String hp = request.getParameter("hp");
	
	//1단계, 2단계 DBC 드라이버 로드, 데이터베이스 접속
	Connection conn = DBConfig.getConnection();
	
	//3단계 - SQL 실행객체 생성
	//Statement stmt = conn.createStatement();
	PreparedStatement psmt = conn.prepareStatement(SQL.SELECT_HP_COUNT);
	psmt.setString(1,hp);
	
	//4단계 - SQL 실행
//	ResultSet rs = stmt.executeQuery("SELECT COUNT(*) FROM `JSP_USER` WHERE hp='"+hp+"';");
	ResultSet rs = psmt.executeQuery();
	
	//5단계 - 결과셋 처리(SELECT)
	int count = 0;					//값을 초기화 해주는것이 좋음 
	
	if(rs.next()){
		count = rs.getInt(1);
	}
	
	//6단계 - 데이터베이스 종료
	rs.close();
	psmt.close();
	conn.close();
	
	// JSON 데이터생성 및 전송
	//String json = "{'result' : 1}";
	JSONObject json = new JSONObject();
//	json.put("result",1);
//	json.put("name","홍길동");
//	json.put("gender",1);
//	json.put("hp","010-1111-1111");
	json.put("result",count);
	
	out.print(json);
	
%>
<%@page import="kr.co.board1.config.SQL"%>
<%@page import="kr.co.board1.config.DBConfig"%>
<%@page import="java.util.concurrent.locks.StampedLock"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	String terms = null;
	String privacy = null;

	//jsp에선 알아서 예외처리를 해주기 때문에 try catch를 하지 않아도 됨
	
	try{
		//1단계, 2단계 DBC 드라이버 로드, 데이터베이스 접속
		conn = DBConfig.getConnection();
		
		//3단계 - SQL 실행객체 생성
		stmt = conn.createStatement();
		
		//4단계 - SQL 실행
	//	rs = stmt.executeQuery("SELECT * FROM `JSP_TERMS`;");
		rs = stmt.executeQuery(SQL.SELECT_TERMS);
		
		//5단계 - 결과셋 처리(SELECT)
		if(rs.next()) {
			terms = rs.getString(1);
			privacy = rs.getString(2);
		}
	
	}catch(Exception e){
		e.printStackTrace();
	} finally {
		//6단계 - 데이터베이스 종료
		rs.close();
		stmt.close();
		conn.close();
	}
%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<title>terms</title>
		<link rel="stylesheet" href="/board1/css/style.css" />	
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
		
		<script src="/board1/js/termsCheck.js"></script>
		
			
	</head>

	<body>
		<div id="terms">
			<section>
				<table>
					<caption>회원약관</caption>
					<tr>
						<td>
							<textarea readonly><%= terms %></textarea>
							<div>
								<label><input type="checkbox" name="chk1" />&nbsp;동의합니다.</label>        
							</div>
						</td>
					</tr>
				</table>
			</section>			
			<section>
				<table>
					<caption>개인정보 취급방침</caption>
					<tr>
						<td>
							<textarea readonly><%= privacy %></textarea>
							<div>
								<label><input type="checkbox" name="chk2" />&nbsp;동의합니다.</label>        
							</div>
						</td>
					</tr>
				</table>
			</section>
			
			<div>
				<a href="/board1/user/login.jsp" class="btnCancel">취소</a>
			 	<a href="/board1/user/register.jsp" class="btnNext">다음</a>	
			<!-- 	<a href="#" class="btnNext">다음</a>	 a태그는 자체적인 클릭 함수가 들어있음-->
			</div>
			
		</div>
	</body>
</html>












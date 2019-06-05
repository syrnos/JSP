<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.io.BufferedOutputStream"%>
<%@page import="java.io.BufferedInputStream"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="kr.co.board1.bean.UserBean"%>
<%@page import="kr.co.board1.config.SQL"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="kr.co.board1.config.DBConfig"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
/*
	 // enctype="multipart/form-data" 이것을 사용하면 requst로 전송 불가 
	request.setCharacterEncoding("UTF-8");
   
	String subject = request.getParameter("subject");
	String content = request.getParameter("content");
	String regip = request.getRemoteAddr();
*/
	//테스트용 
	String path = "/users/macbook/test";

	//배포용
	//String path = request.getServletContext().getRealPath("/data");
	int maxSize = 1024 * 1024 * 1;	//10MB

//	MultipartRequest mr = new MultipartRequest(request, "파일 저장경로", "최대허용파일용량", "UTF-8", new DefaultFileRenamePolicy());
	
	//Multipart Form-data전송 request 처리 
	MultipartRequest mr = new MultipartRequest(request, path, maxSize, "UTF-8", new DefaultFileRenamePolicy());
	
	String subject = mr.getParameter("subject");
	String content = mr.getParameter("content");
	String fileName = mr.getFilesystemName("file");				//파일 이름이 넘어옴
	String regip = request.getRemoteAddr();
	String newName = null;
	int file = 0;
	
	//세션에서 사용자 아이디 가져오기
	UserBean ub = (UserBean) session.getAttribute("user");
	String uid = ub.getUid();
	
	if(fileName != null) {
		file = 1;
		
		//1. 파일명 생성
		int i = fileName.lastIndexOf(".");								//확장자명 찾기  
		String ext = fileName.substring(i);								//확장자 구하기 
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss_");	//파일명 
		String now = sdf.format(new Date());
		
		newName = now+uid+ext;  			//20190524194512_abcd.txt
		
		//2. 파일명 변경 
		//1단계 - 파일객체 생성
		File oldFile = new File(path+"/"+fileName);
		File newFile = new File(path+"/"+newName);
		
		//2단계 - 스트림 생성
		FileInputStream fis = new FileInputStream(oldFile);	
		FileOutputStream fos = new FileOutputStream(newFile);	
		
		//3단계 - 스트림에 버퍼 연결
		BufferedInputStream bis = new BufferedInputStream(fis);
		BufferedOutputStream bos = new BufferedOutputStream(fos);
		
		
		//4단계 - 데이터 읽기와 쓰기(Copy & Paste)
		while(true) {
			
			//입력 버퍼스트림으로 데이터 읽기
			int value = bis.read();
			
			if(value == -1) {
				//원본은 이제 필요없으므로 삭제 (mac)
				oldFile.delete();
				break;
			}
			
			//출력 버퍼스트림으로 데이터 쓰기 
			bos.write(value);
		}
		
		/*
		//원본은 이제 필요없으므로 삭제 
		oldFile.delete();
		*/
		
		//5단계 - 스트림 해제
		bis.close();
		bos.close();
		fis.close();
		fos.close();
		
		/*
		//원본은 이제 필요없으므로 삭제 (windows)
		oldFile.delete();
		*/
	}
	
	//게시물 내용 INSERT
	//1단계, 2단계 DBC 드라이버 로드, 데이터베이스 접속
	Connection conn = DBConfig.getConnection();
	
	//트렌젝션 시작 begin
	conn.setAutoCommit(false);
	
	//3단계 - SQL 실행객체 생성
	Statement stmt = conn.createStatement();			//밑에서 select 할 statement
	
	PreparedStatement psmt = conn.prepareStatement(SQL.INSERT_BOARD);
	psmt.setString(1,subject);
	psmt.setString(2,content);
	psmt.setInt(3,file);
	psmt.setString(4,uid);
	psmt.setString(5,regip);

	//4단계 - SQL 실행
	psmt.executeUpdate();
	ResultSet rs = stmt.executeQuery(SQL.SELECT_MAX_SEQ);
	
	//트렌젝션 끝 commit
	conn.commit();				//begin, commit : 하나의 실행으로 만듬 
	
	//5단계 - 결과셋 처리(SELECT일 경우)
	int parent = 0;
	
	if(rs.next()){
		parent = rs.getInt(1);
	}
	
	//6단계 - 데이터베이스 종료
	psmt.close();
	conn.close();
	
	if(fileName != null) {
		
		//첨부파일 내용 INSERT
		
		//1단계,2단계
		Connection conn1 = DBConfig.getConnection();
		
		//3단계
		PreparedStatement psmt1 = conn1.prepareStatement(SQL.INSERT_FILE);
		psmt1.setInt(1,parent);
		psmt1.setString(2,fileName);
		psmt1.setString(3,newName);
		
		//4단계
		psmt1.executeUpdate();
		
		//5단계
		
		//6단계
		psmt1.close();
		conn1.close();
		
	}
	
	response.sendRedirect("../list.jsp");

%>
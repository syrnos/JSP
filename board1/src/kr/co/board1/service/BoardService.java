package kr.co.board1.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import kr.co.board1.bean.BoardBean;
import kr.co.board1.config.DBConfig;
import kr.co.board1.config.SQL;

public class BoardService {
	
	//싱글톤 객체
	private static BoardService serivce = new BoardService();
	private BoardService() {}
	
	public static BoardService getInstance() {					//외부로 보내줄수 있게 만듬 
		return serivce;
	}
	
	//목록용 카운트 번호 구하기
	public int getListStartCount(int total, int start) {
		return total - start;
	}
	
	//현재 페이지 
	public int getCurrentPage(String pg) {
		int current = 0;
		if(pg ==  null) {
			current = 1;
		}else {
			current = Integer.parseInt(pg);
		}
		return current;
	}
	
	//Limit용 Start값 구하기
	public int getStartForLimit(String pg) {
		int start = 0;
		
		//null 체크
		if(pg == null) {					
			start = 1;
		} else {
			start = Integer.parseInt(pg);	//null은 숫자로 못바꿈 
		}
		
		
		return (start-1) * 10;
	}
	
	//페이지 그룹 계산하기
	public int[] getPageGroupStartEnd(String pg, int totalPage) {
		
		int[] groupStartEnd = new int[2];
		
		int current = getCurrentPage(pg);							//현재 페이지
		int currentGroup = (int) Math.ceil(current/10.0);				//페이지 그룹  페이지수/10 해서 나머지를 올림 Math.ceil(올림)
		int groupStart = (currentGroup - 1) * 10 +1 ;
		int groupEnd = currentGroup * 10;
		
		if(groupEnd > totalPage){
			groupEnd = totalPage;
		}
		
		groupStartEnd[0] = groupStart;
		groupStartEnd[1] = groupEnd;
		
		return groupStartEnd; 
	}
	
	//전체 페이지 수 구하기
	public int getTotalPage(int boardTotal){
		
		//전체 페이지 수 계산
		int pageTotal = 0;
		
		if(boardTotal % 10 == 0){
			pageTotal = boardTotal / 10;					//전체 게시물/10
		}else {
			pageTotal = boardTotal / 10 + 1;								
		}
		
		return pageTotal;
	}
	
	//전체 게시물 구하기 
	public int getTotalBoard() throws Exception {
		
		//1단계, 2단계 DBC 드라이버 로드, 데이터베이스 접속
		Connection conn = DBConfig.getConnection();
		
		//3단계 - SQL 실행객체 생성
		Statement stmt = conn.createStatement();	// PreparedStatement : 맵핑할때 사용
		
		//4단계 - SQL 실행		(SELECT COUNT(*) FROM `JSP_BOARD`);
		ResultSet rs = stmt.executeQuery(SQL.SELECT_COUNT_TOTAL);
		
		//5단계 - 결과셋 처리(SELECT)
		int total = 0;
		
		if(rs.next()) {
			total = rs.getInt(1);
			//int total = rs.getInt("COUNT(*)"); 	둘중 하나 사용 가능 
			
		}
		
		//6단계 - 데이터베이스 종료
		conn.close();
		stmt.close();
		rs.close();
		
		return total;
	}
	
	//게시물 목록 구하기
	public List<BoardBean> getBoardList(int start) throws Exception {
		//1단계, 2단계 DBC 드라이버 로드, 데이터베이스 접속
		Connection conn = DBConfig.getConnection();
		
		//3단계 - SQL 실행객체 생성
		PreparedStatement psmt = conn.prepareStatement(SQL.SELECT_LIST);
		psmt.setInt(1, start); 						//psmt.setInt(1, x); x : start 
		
		//4단계 - SQL 실행	
		ResultSet rs = psmt.executeQuery();					//select는 executeQuery
		
		//5단계 - 결과셋 처리(SELECT)
		
		List<BoardBean> list = new ArrayList<BoardBean>();
		
		while(rs.next()){
			BoardBean bb = new BoardBean();
			bb.setSeq(rs.getInt(1));
			bb.setParent(rs.getInt(2));
			bb.setComment(rs.getInt(3));
			bb.setCate(rs.getString(4));
			bb.setTitle(rs.getString(5));
			bb.setContent(rs.getString(6));
			bb.setFile(rs.getInt(7));
			bb.setHit(rs.getInt(8));
			bb.setUid(rs.getString(9));
			bb.setRegip(rs.getString(10));
			bb.setRdate(rs.getString(11));
			bb.setNick(rs.getString(12));
			

			list.add(bb);
		}
		
		//6단계 - 데이터베이스 종료
		rs.close();
		psmt.close();
		conn.close();
		
		return list;
	}
	
	//게시물 추가하기
	public void insertBoard() {
		
		
	}

	//조회수 업데이트 
	public void updateHit(String seq) throws Exception {
		
		//1단계, 2단계
		Connection conn = DBConfig.getConnection();
		
		//3단계
		PreparedStatement psmt = conn.prepareStatement(SQL.UPDATE_HIT);
		psmt.setString(1, seq);
		
		//4단계
		psmt.executeUpdate();
		//5단계
		
		//6단계
		conn.close();
		psmt.close();
		
	}
	
	// 글보기 SELECT
	 public BoardBean viewBoard(String seq) throws Exception {
		//1단계, 2단계
		Connection conn = DBConfig.getConnection();
		
		//3단계
		PreparedStatement psmt = conn.prepareStatement(SQL.SELECT_VIEW);		//PreparedStatement : select
		psmt.setString(1, seq);				//숫자여도 String 사용하면 알아서 인식됨 
		
		//4단계
		ResultSet rs = psmt.executeQuery();	
		//5단계
		
		BoardBean bb = new BoardBean();
		
		if(rs.next()) {
			bb.setSeq(rs.getInt(1));
			bb.setParent(rs.getInt(2));
			bb.setComment(rs.getInt(3));
			bb.setCate(rs.getString(4));
			bb.setTitle(rs.getString(5));
			bb.setContent(rs.getString(6));
			bb.setFile(rs.getInt(7));
			bb.setHit(rs.getInt(8));
			bb.setUid(rs.getString(9));
			bb.setRegip(rs.getString(10));
			bb.setRdate(rs.getString(11));
			bb.setOldName(rs.getString(13));
			bb.setNewName(rs.getString(14));
			bb.setDownload(rs.getInt(15));
			
		}
		
		//6단계
		rs.close();
		psmt.close();
		conn.close();
		
		return bb;
	 }
	 
	 //댓글 리스트 
	 public List<BoardBean> commentList(String parent) throws Exception {
		//1단계, 2단계
		Connection conn = DBConfig.getConnection();
		
		//3단계
		PreparedStatement psmt = conn.prepareStatement(SQL.SELECT_COMMENT_LIST);
		psmt.setString(1, parent);
		
		//4단계
		ResultSet rs = psmt.executeQuery();			//결과값 
		
		//5단계
		List<BoardBean> list = new ArrayList<>();
		while(rs.next()) {
			BoardBean bb = new BoardBean();
			bb.setSeq(rs.getInt(1));
			bb.setParent(rs.getInt(2));
			bb.setComment(rs.getInt(3));
			bb.setCate(rs.getString(4));
			bb.setTitle(rs.getString(5));
			bb.setContent(rs.getString(6));
			bb.setFile(rs.getInt(7));
			bb.setHit(rs.getInt(8));
			bb.setUid(rs.getString(9));
			bb.setRegip(rs.getString(10));
			bb.setRdate(rs.getString(11));
			bb.setNick(rs.getString(12));
			
			list.add(bb);
			
		}
		
		//6단계
		conn.close();
		psmt.close();
		rs.close();
		
		return list;
	 }
	 
	 //다운로드 카운트 수 구하기 
	 public void updateDownload(String parent) throws Exception {
			
		//1단계, 2단계
		Connection conn = DBConfig.getConnection();
		
		//3단계
		PreparedStatement psmt = conn.prepareStatement(SQL.UPDATE_DOWNLOAD_COUNT);
		psmt.setString(1, parent);
		
		//4단계
		psmt.executeUpdate();
		//5단계
		
		//6단계
		conn.close();
		psmt.close();
		
	}
}

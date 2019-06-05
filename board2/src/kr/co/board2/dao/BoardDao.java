package kr.co.board2.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import kr.co.board2.config.DBConfig;
import kr.co.board2.config.SQL;
import kr.co.board2.vo.BoardVO;

public class BoardDao {
	
	private static BoardDao instance = new BoardDao();
	
	public static BoardDao getInstance() {
		return instance;
	}
	
	private BoardDao() {}
	
	public void insertBoard(BoardVO bvo) throws Exception  {
		
		//1단계, 2단계
		Connection conn = DBConfig.getConnection();
		
		//3단계 
		PreparedStatement psmt = conn.prepareStatement(SQL.INSERT_BOARD);
		psmt.setString(1, bvo.getTitle());
		psmt.setString(2, bvo.getContent());
		psmt.setInt(3, bvo.getFile());
		psmt.setString(4, bvo.getUid());
		psmt.setString(5, bvo.getRegip());
		
		//4단계
		psmt.executeUpdate();
		
		//5단계
		
		//6단계
		psmt.close();
		conn.close();
	}
	
	public List<BoardVO> selectList(int start) throws Exception {
		
		//1단계, 2단계
		Connection conn = DBConfig.getConnection();
		
		//3단계
		PreparedStatement psmt = conn.prepareStatement(SQL.SELECT_LIST);
		psmt.setInt(1, start);
		
		//4단계
		ResultSet rs = psmt.executeQuery();
		
		//5단계
		List<BoardVO> list = new ArrayList<>();
		
		while(rs.next()) {
			BoardVO vo = new BoardVO();
			vo.setSeq(rs.getInt(1));
			vo.setParent(rs.getInt(2));
			vo.setComment(rs.getInt(3));
			vo.setCate(rs.getString(4));
			vo.setTitle(rs.getString(5));
			vo.setContent(rs.getString(6));
			vo.setFile(rs.getInt(7));
			vo.setHit(rs.getInt(8));
			vo.setUid(rs.getString(9));
			vo.setRegip(rs.getString(10));
			vo.setRdate(rs.getString(11));
			vo.setNick(rs.getString(12));
			
			list.add(vo);
			
		}
		
		//6단계 
		rs.close();
		psmt.close();
		conn.close();
		
		return list;
		
	}
	
	public int getTotalCount() throws Exception {
		
		//1단계,2단계
		Connection conn = DBConfig.getConnection();
		
		//3단계 
		Statement stmt = conn.createStatement();
		
		//4단계
		ResultSet rs = stmt.executeQuery(SQL.SELECT_COUNT_TOTAL);
		
		//5단계
		int total = 0;
		
		if(rs.next()) {
			total = rs.getInt(1);
		}
		
		
		//6단계
		rs.close();
		stmt.close();
		conn.close();
		
		return total;
	}
	
}

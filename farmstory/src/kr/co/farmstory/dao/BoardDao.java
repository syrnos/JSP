package kr.co.farmstory.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import kr.co.farmstory.config.DBConfig;
import kr.co.farmstory.config.SQL;
import kr.co.farmstory.vo.BoardVO;

public class BoardDao {

	//싱글톤 객체로 만듬
	private static BoardDao instance = new BoardDao();
	
	public static BoardDao getInstance() {
		return instance;
	}
	
	private BoardDao() {}
	
	public void write(BoardVO vo) throws Exception {
		
		//1단계,2단계
		Connection conn = DBConfig.getConnection();
		
		//3단계
		PreparedStatement psmt = conn.prepareStatement(SQL.INSERT_BOARD);
		psmt.setString(1, vo.getCate());
		psmt.setString(2, vo.getTitle());
		psmt.setString(3, vo.getContent());
		psmt.setInt(4, vo.getFile());
		psmt.setString(5, vo.getUid());
		psmt.setString(6, vo.getRegip());
		
		//4단계
		psmt.executeUpdate();
		
		//5단계
		
		
		//6단계
		psmt.close();
		conn.close();
	}
	
	public List<BoardVO> list(String cate, int start) throws Exception {
		
		//1단계, 2단계
		Connection conn = DBConfig.getConnection();
		
		//3단계
		PreparedStatement psmt = conn.prepareStatement(SQL.SELECT_LIST);
		psmt.setString(1, cate);
		psmt.setInt(2, start);
		
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

}

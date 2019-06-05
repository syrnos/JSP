package kr.co.board1.config;

public class SQL {
	
	//회원관련 
	public static final String SELECT_TERMS = "SELECT * FROM `JSP_TERMS`;";
	public static final String SELECT_USER = "SELECT * FROM `JSP_USER` WHERE uid=? AND pass=PASSWORD(?);";
	
	public static final String INSERT_USER = "INSERT INTO `JSP_USER` SET "			//final 상수로 고정 
							+ "uid=?,"
							+ "pass=PASSWORD(?),"
							+ "name=?,"
							+ "nick=?,"
							+ "email=?,"
							+ "hp=?,"
							+ "zip=?,"
							+ "addr1=?,"
							+ "addr2=?,"
							+ "regip=?,"
							+ "rdate=NOW()";
	
	public static final String SELECT_USER_COUNT = "SELECT COUNT(*) FROM `JSP_USER` WHERE uid=?;";		//? 프리페어 스테이트 먼트
	public static final String SELECT_NICK_COUNT = "SELECT COUNT(*) FROM `JSP_USER` WHERE nick=?;";		//? 프리페어 스테이트 먼트
	public static final String SELECT_EMAIL_COUNT = "SELECT COUNT(*) FROM `JSP_USER` WHERE email=?;";		//? 프리페어 스테이트 먼트
	public static final String SELECT_HP_COUNT = "SELECT COUNT(*) FROM `JSP_USER` WHERE hp=?;";		//? 프리페어 스테이트 먼트
	
	//게시판관련 
	
	public static final String INSERT_BOARD = "INSERT INTO `JSP_BOARD` SET "
			 				+ "title=?,"
			 				+ "content=?,"
			 				+ "file=?,"
			 				+ "uid=?,"
			 				+ "regip=?,"
			 				+ "rdate=NOW()";
	
	public static final String SELECT_MAX_SEQ = "SELECT MAX(seq) FROM `JSP_BOARD`";			
	//방금전에 insert된 seq 		max : 가장 최근 번호 
	public static final String INSERT_FILE = "INSERT INTO `JSP_FILE`(`parent`,`oldname`,`newname`,`rdate`) VALUES (?,?,?,NOW())";
	
	//다운로드 카운트 수 
	public static final String UPDATE_DOWNLOAD_COUNT = "UPDATE `JSP_FILE` SET download=download+1 WHERE parent=?";
	
	public static final String SELECT_LIST = "SELECT a.*, b.nick FROM `JSP_BOARD` AS a "
											+ "JOIN `JSP_USER` AS b ON a.uid = b.uid "
											+ "WHERE parent=0 "							// 게시판 댓글이 게시판 목록에 나오지 않게 함(댓글)
											+ "ORDER BY seq DESC "
											+ "LIMIT ?, 10";
	
	public static final String SELECT_COUNT_TOTAL = "SELECT COUNT(*) FROM `JSP_BOARD";
	
	public static final String SELECT_VIEW = "SELECT * FROM `JSP_BOARD` AS a "
											+ "LEFT JOIN `JSP_FILE` AS b "
											+ "ON a.seq = b.parent "
											+ "WHERE seq=?";
	
	public static final String UPDATE_HIT = "UPDATE `JSP_BOARD` SET hit=hit+1 WHERE seq=?";
	
	public static final String DELETE_BOARD = "DELETE FROM `JSP_BOARD` AS a "
											+ "LEFT JOIN `JSP_FILE` AS b "
											+ "ON a.seq = b.parent "
											+ "WHERE seq=?";
	
	public static final String INSERT_COMMENT = "INSERT INTO `JSP_BOARD` SET "
												+ "parent=?,"
												+ "content=?,"
												+ "uid=?,"
												+ "regip=?,"
												+ "rdate=NOW()";
	
	public static final String SELECT_COMMENT_LIST = "SELECT a.*, b.nick FROM `JSP_BOARD` AS a "
													+ "JOIN `JSP_USER` AS b ON a.uid = b.uid "
													+ "WHERE parent=? ORDER BY seq ASC";  	
													//쿼리 		질의하다 		데이터베이스에 
	
	
	
//public : 외부에서 바로참조
//static : sql클래스 맴버 참여하려면 바로 클래스변수로 참조하기 위해서 
//final : 상수로 고정시킴
	
}
/*
public static final String INSERT_BOARD = "INSERT INTO `JSP_BOARD` SET "
//						+ "seq=?,"					자동으로 숫자가 들어가서 제외	
//						+ "parent=?,"				게시판 댓글이라 제외 
//						+ "comment=?,"				댓글번호 
//						+ "cate=?,"					카테고리 
		 				+ "title=?,"
		 				+ "content=?,"
//						+ "file=?,";				파일첨부 
//						+ "hit=?,";					조회수
		 				+ "uid=?,"
		 				+ "regip=?,"
		 				+ "rdate=NOW()";
*/
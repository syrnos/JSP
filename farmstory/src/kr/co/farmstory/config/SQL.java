package kr.co.farmstory.config;

public class SQL {
	
	//?��?���??�� 
	public static final String SELECT_TERMS = "SELECT * FROM `JSP_TERMS`;";
	public static final String SELECT_USER = "SELECT * FROM `JSP_USER` WHERE uid=? AND pass=PASSWORD(?);";
	
	public static final String INSERT_USER = "INSERT INTO `JSP_USER` SET "			//final ?��?���? 고정 
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
	
	public static final String SELECT_USER_COUNT = "SELECT COUNT(*) FROM `JSP_USER` WHERE uid=?;";		//? ?��리페?�� ?��?��?��?�� 먼트
	public static final String SELECT_NICK_COUNT = "SELECT COUNT(*) FROM `JSP_USER` WHERE nick=?;";		//? ?��리페?�� ?��?��?��?�� 먼트
	public static final String SELECT_EMAIL_COUNT = "SELECT COUNT(*) FROM `JSP_USER` WHERE email=?;";		//? ?��리페?�� ?��?��?��?�� 먼트
	public static final String SELECT_HP_COUNT = "SELECT COUNT(*) FROM `JSP_USER` WHERE hp=?;";		//? ?��리페?�� ?��?��?��?�� 먼트
	
	//게시?���??�� 
	
	public static final String INSERT_BOARD = "INSERT INTO `JSP_BOARD` SET "
			 				+ "cate=?,"
			 				+ "title=?,"
			 				+ "content=?,"
			 				+ "file=?,"
			 				+ "uid=?,"
			 				+ "regip=?,"
			 				+ "rdate=NOW()";
	
	public static final String SELECT_MAX_SEQ = "SELECT MAX(seq) FROM `JSP_BOARD`";			
	//방금?��?�� insert?�� seq 		max : �??�� 최근 번호 
	public static final String INSERT_FILE = "INSERT INTO `JSP_FILE`(`parent`,`oldname`,`newname`,`rdate`) VALUES (?,?,?,NOW())";
	
	//?��?��로드 카운?�� ?�� 
	public static final String UPDATE_DOWNLOAD_COUNT = "UPDATE `JSP_FILE` SET download=download+1 WHERE parent=?";
	
	public static final String SELECT_LIST = "SELECT a.*, b.nick FROM `JSP_BOARD` AS a "
											+ "JOIN `JSP_USER` AS b ON a.uid = b.uid "
											+ "WHERE parent=0 AND cate=? "							// 게시?�� ?���??�� 게시?�� 목록?�� ?��?���? ?���? ?��(?���?)
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
													//쿼리 		질의?��?�� 		?��?��?��베이?��?�� 
	
	
	
//public : ?���??��?�� 바로참조
//static : sql?��?��?�� 맴버 참여?��?���? 바로 ?��?��?���??���? 참조?���? ?��?��?�� 
//final : ?��?���? 고정?��?��
	
}
/*
public static final String INSERT_BOARD = "INSERT INTO `JSP_BOARD` SET "
//						+ "seq=?,"					?��?��?���? ?��?���? ?��?���??�� ?��?��	
//						+ "parent=?,"				게시?�� ?���??��?�� ?��?�� 
//						+ "comment=?,"				?���?번호 
//						+ "cate=?,"					카테고리 
		 				+ "title=?,"
		 				+ "content=?,"
//						+ "file=?,";				?��?��첨�? 
//						+ "hit=?,";					조회?��
		 				+ "uid=?,"
		 				+ "regip=?,"
		 				+ "rdate=NOW()";
*/
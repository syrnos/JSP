package kr.co.farmstory.config;

public class SQL {
	
	//?öå?õêÍ¥??†® 
	public static final String SELECT_TERMS = "SELECT * FROM `JSP_TERMS`;";
	public static final String SELECT_USER = "SELECT * FROM `JSP_USER` WHERE uid=? AND pass=PASSWORD(?);";
	
	public static final String INSERT_USER = "INSERT INTO `JSP_USER` SET "			//final ?ÉÅ?àòÎ°? Í≥†Ï†ï 
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
	
	public static final String SELECT_USER_COUNT = "SELECT COUNT(*) FROM `JSP_USER` WHERE uid=?;";		//? ?îÑÎ¶¨Ìéò?ñ¥ ?ä§?Öå?ù¥?ä∏ Î®ºÌä∏
	public static final String SELECT_NICK_COUNT = "SELECT COUNT(*) FROM `JSP_USER` WHERE nick=?;";		//? ?îÑÎ¶¨Ìéò?ñ¥ ?ä§?Öå?ù¥?ä∏ Î®ºÌä∏
	public static final String SELECT_EMAIL_COUNT = "SELECT COUNT(*) FROM `JSP_USER` WHERE email=?;";		//? ?îÑÎ¶¨Ìéò?ñ¥ ?ä§?Öå?ù¥?ä∏ Î®ºÌä∏
	public static final String SELECT_HP_COUNT = "SELECT COUNT(*) FROM `JSP_USER` WHERE hp=?;";		//? ?îÑÎ¶¨Ìéò?ñ¥ ?ä§?Öå?ù¥?ä∏ Î®ºÌä∏
	
	//Í≤åÏãú?åêÍ¥??†® 
	
	public static final String INSERT_BOARD = "INSERT INTO `JSP_BOARD` SET "
			 				+ "title=?,"
			 				+ "content=?,"
			 				+ "file=?,"
			 				+ "uid=?,"
			 				+ "regip=?,"
			 				+ "rdate=NOW()";
	
	public static final String SELECT_MAX_SEQ = "SELECT MAX(seq) FROM `JSP_BOARD`";			
	//Î∞©Í∏à?†Ñ?óê insert?êú seq 		max : Í∞??û• ÏµúÍ∑º Î≤àÌò∏ 
	public static final String INSERT_FILE = "INSERT INTO `JSP_FILE`(`parent`,`oldname`,`newname`,`rdate`) VALUES (?,?,?,NOW())";
	
	//?ã§?ö¥Î°úÎìú Ïπ¥Ïö¥?ä∏ ?àò 
	public static final String UPDATE_DOWNLOAD_COUNT = "UPDATE `JSP_FILE` SET download=download+1 WHERE parent=?";
	
	public static final String SELECT_LIST = "SELECT a.*, b.nick FROM `JSP_BOARD` AS a "
											+ "JOIN `JSP_USER` AS b ON a.uid = b.uid "
											+ "WHERE parent=0 "							// Í≤åÏãú?åê ?åìÍ∏??ù¥ Í≤åÏãú?åê Î™©Î°ù?óê ?Çò?ò§Ïß? ?ïäÍ≤? ?ï®(?åìÍ∏?)
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
													//ÏøºÎ¶¨ 		ÏßàÏùò?ïò?ã§ 		?ç∞?ù¥?Ñ∞Î≤†Ïù¥?ä§?óê 
	
	
	
//public : ?ô∏Î∂??óê?Ñú Î∞îÎ°úÏ∞∏Ï°∞
//static : sql?Å¥?ûò?ä§ Îß¥Î≤Ñ Ï∞∏Ïó¨?ïò?†§Î©? Î∞îÎ°ú ?Å¥?ûò?ä§Î≥??àòÎ°? Ï∞∏Ï°∞?ïòÍ∏? ?úÑ?ï¥?Ñú 
//final : ?ÉÅ?àòÎ°? Í≥†Ï†ï?ãú?Ç¥
	
}
/*
public static final String INSERT_BOARD = "INSERT INTO `JSP_BOARD` SET "
//						+ "seq=?,"					?ûê?èô?úºÎ°? ?à´?ûêÍ∞? ?ì§?ñ¥Í∞??Ñú ?†ú?ô∏	
//						+ "parent=?,"				Í≤åÏãú?åê ?åìÍ∏??ù¥?ùº ?†ú?ô∏ 
//						+ "comment=?,"				?åìÍ∏?Î≤àÌò∏ 
//						+ "cate=?,"					Ïπ¥ÌÖåÍ≥†Î¶¨ 
		 				+ "title=?,"
		 				+ "content=?,"
//						+ "file=?,";				?åå?ùºÏ≤®Î? 
//						+ "hit=?,";					Ï°∞Ìöå?àò
		 				+ "uid=?,"
		 				+ "regip=?,"
		 				+ "rdate=NOW()";
*/
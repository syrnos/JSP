package kr.co.farmstory.config;

public class SQL {
	
	//??κ΄?? ¨ 
	public static final String SELECT_TERMS = "SELECT * FROM `JSP_TERMS`;";
	public static final String SELECT_USER = "SELECT * FROM `JSP_USER` WHERE uid=? AND pass=PASSWORD(?);";
	
	public static final String INSERT_USER = "INSERT INTO `JSP_USER` SET "			//final ??λ‘? κ³ μ  
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
	
	public static final String SELECT_USER_COUNT = "SELECT COUNT(*) FROM `JSP_USER` WHERE uid=?;";		//? ?λ¦¬ν?΄ ?€??΄?Έ λ¨ΌνΈ
	public static final String SELECT_NICK_COUNT = "SELECT COUNT(*) FROM `JSP_USER` WHERE nick=?;";		//? ?λ¦¬ν?΄ ?€??΄?Έ λ¨ΌνΈ
	public static final String SELECT_EMAIL_COUNT = "SELECT COUNT(*) FROM `JSP_USER` WHERE email=?;";		//? ?λ¦¬ν?΄ ?€??΄?Έ λ¨ΌνΈ
	public static final String SELECT_HP_COUNT = "SELECT COUNT(*) FROM `JSP_USER` WHERE hp=?;";		//? ?λ¦¬ν?΄ ?€??΄?Έ λ¨ΌνΈ
	
	//κ²μ?κ΄?? ¨ 
	
	public static final String INSERT_BOARD = "INSERT INTO `JSP_BOARD` SET "
			 				+ "title=?,"
			 				+ "content=?,"
			 				+ "file=?,"
			 				+ "uid=?,"
			 				+ "regip=?,"
			 				+ "rdate=NOW()";
	
	public static final String SELECT_MAX_SEQ = "SELECT MAX(seq) FROM `JSP_BOARD`";			
	//λ°©κΈ? ? insert? seq 		max : κ°??₯ μ΅κ·Ό λ²νΈ 
	public static final String INSERT_FILE = "INSERT INTO `JSP_FILE`(`parent`,`oldname`,`newname`,`rdate`) VALUES (?,?,?,NOW())";
	
	//?€?΄λ‘λ μΉ΄μ΄?Έ ? 
	public static final String UPDATE_DOWNLOAD_COUNT = "UPDATE `JSP_FILE` SET download=download+1 WHERE parent=?";
	
	public static final String SELECT_LIST = "SELECT a.*, b.nick FROM `JSP_BOARD` AS a "
											+ "JOIN `JSP_USER` AS b ON a.uid = b.uid "
											+ "WHERE parent=0 "							// κ²μ? ?κΈ??΄ κ²μ? λͺ©λ‘? ??€μ§? ?κ²? ?¨(?κΈ?)
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
													//μΏΌλ¦¬ 		μ§μ??€ 		?°?΄?°λ² μ΄?€? 
	
	
	
//public : ?ΈλΆ??? λ°λ‘μ°Έμ‘°
//static : sql?΄??€ λ§΄λ² μ°Έμ¬?? €λ©? λ°λ‘ ?΄??€λ³??λ‘? μ°Έμ‘°?κΈ? ??΄? 
//final : ??λ‘? κ³ μ ??΄
	
}
/*
public static final String INSERT_BOARD = "INSERT INTO `JSP_BOARD` SET "
//						+ "seq=?,"					???Όλ‘? ?«?κ°? ?€?΄κ°?? ? ?Έ	
//						+ "parent=?,"				κ²μ? ?κΈ??΄?Ό ? ?Έ 
//						+ "comment=?,"				?κΈ?λ²νΈ 
//						+ "cate=?,"					μΉ΄νκ³ λ¦¬ 
		 				+ "title=?,"
		 				+ "content=?,"
//						+ "file=?,";				??Όμ²¨λ? 
//						+ "hit=?,";					μ‘°ν?
		 				+ "uid=?,"
		 				+ "regip=?,"
		 				+ "rdate=NOW()";
*/
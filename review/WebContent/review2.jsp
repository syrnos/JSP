<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>review1</title>
</head>
<body>
	<h3>2.JSP 데이터베이스 프로그래밍</h3>
	
	<h4>REVIEW_USER1</h4>
	<form action="./sub2/user1.jsp">
		<input type="text" name="uid" placeholder="아이디 입력"/> <br/>
		<input type="text" name="name" placeholder="이름 입력"/> <br/>
		<input type="text" name="hp" maxlength="13" placeholder="휴대폰 13자리 입력"/> <br/>
		<input type="number" name="age" placeholder="나이 입력"/> <br/>
		<input type="submit" value="저장" /> <br/>
	</form>
	
	<h4>REVIEW_USER2</h4>
	<form action="./sub2/user2.jsp">
		<input type="text" name="uid" placeholder="이름 입력"/> <br/>
		<input type="date" name="birth" placeholder="생년월일 입력"/> <br/>
		<input type="text" name="addr"placeholder="주소 입력"/> <br/>
		<input type="submit" value="저장" /> <br/>
	</form>
	
</body>
</html>
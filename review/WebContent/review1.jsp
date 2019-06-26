<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>review1</title>
</head>
<body>
	<h3>1.JSP 내장객체</h3>
	
	<h4>request</h4>
	<a href="./sub1/request1.jsp?uid=abcd">request1.jsp</a>
	<a href="./sub1/request2.jsp?uid=abcd&name=홍길동">request2.jsp</a>
	<a href="./sub1/request3.jsp?uid=abcd&name=홍길동&hobby=등산&hobby=영화">request3.jsp</a>
	
	<br/><br/><br/>
	
	<form action="./sub1/request4.jsp">
		<input type="text" name="id" placeholder="아이디를 입력하세요." /> <br/>
		<input type="text" name="pw" placeholder="비번을 입력하세요." /> <br/>
		<input type="text" name="nm" placeholder="이름을 입력하세요." /> <br/>
		<input type="text" name="ag" placeholder="나이를 입력하세요." /> <br/>
		<input type="submit" value="전송" />
	</form>
	
	<h4>나의 시</h4>
	<form action="./sub1/request5.jsp" method="post">
		<input type="text" name="author" placeholder="적성자를 입력하세요." /> <br/>
		<textarea name="poem" rows="10" cols="50" placeholder="시를 지으세요."></textarea> <br/>
		<input type="submit" value="전송" />
	</form>
	
	
	<h3>response 객체</h3>
	<a href="./sub1/response1.jsp">resopnse1</a>
	<a href="./sub1/response2.jsp">resopnse2</a>
	
	<h3>session 객체</h3>
	<a href="./sub1/session1.jsp?uid=kimss&name=김철학">session1</a>
	<a href="./sub1/session2.jsp">session2</a>
	
</body>
</html>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8" />
		<title>글목록</title> 
		<link rel="stylesheet" href="./css/style.css" />
	</head>
	<body>
		<div id="board">
			<h3>글목록</h3>
			<!-- 리스트 -->
			<div class="list">
				<p class="logout">${ user.nick }님! 반갑습니다. <a href="/board2/user/logout.do">[로그아웃]</a><p>
				<table>
					<tr>
						<td>번호</td>
						<td>제목</td>
						<td>글쓴이</td>
						<td>날짜</td>
						<td>조회</td>
					</tr>
					
					<c:forEach var="vo" items="${requestScope.list }">		
					<tr>
						<td>${count = count -1}</td>
						<td><a href="#">${vo.title}</a>&nbsp;[${vo.comment}]</td>
						<td>${vo.nick}</td>
						<td>${vo.rdate.substring(2, 10)}</td>
						<td>${vo.hit}</td>
					</tr>
					
					</c:forEach>
				</table>
			</div>
			<!-- 페이징 -->
			<nav class="paging">
				<span> 
					<a href="#" class="prev">이전</a>
					<c:forEach var="i" begin="1" end="${requestScope.page}">
					<a href="/board2/list.do?pg=${i}" class="num">${i}</a>
					</c:forEach>
					
					<a href="#" class="next">다음</a>
				</span>
			</nav>
			<a href="/board2/write.do" class="btnWrite">글쓰기</a>
		</div>
	</body>

</html>



<!-- <a href="/board2/write.do"를 실행하면 writeservice 실행  -->

<!-- end="${requestScope.page}">  ${page} page로 requestScope 생략 가능 -->





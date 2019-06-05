<%@page import="jdk.management.resource.internal.TotalResourceContext"%>
<%@page import="kr.co.board1.service.BoardService"%>
<%@page import="kr.co.board1.config.SQL"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="kr.co.board1.bean.BoardBean"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="kr.co.board1.config.DBConfig"%>
<%@page import="kr.co.board1.bean.UserBean"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	UserBean ub = (UserBean) session.getAttribute("user");		//(UserBean) 캐스팅
	String nick = null;
	List<BoardBean> list = new ArrayList<>();
	//		선언			 = 		생성
	int totalPage = 0;
	int listCount = 0;
	int[] groupStartEnd = new int[2];			//배열은 객체라서 null로 초기화 
	int current = 0;
	
	if(ub == null) {
		//로그인을 안했을때
		response.sendRedirect("./user/login.jsp?result=101");
	} else {
		request.setCharacterEncoding("UTF-8");
		String pg = request.getParameter("pg");
		
		//로그인을 했을때 
		nick = ub.getNick();
		
		BoardService bs = BoardService.getInstance();
		
		int total = bs.getTotalBoard();
		totalPage = bs.getTotalPage(total);
		
		
		int start = bs.getStartForLimit (pg);
		list = bs.getBoardList(start);
		
		//목록 출력용 번호
		listCount = bs.getListStartCount(total,start);
		
		//목록 페이지 그룹 번호
		groupStartEnd = bs.getPageGroupStartEnd(pg,totalPage);
		
		//현재 페이지 번호
		current = bs.getCurrentPage(pg);
		
		
	}
%>
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
				<p class="logout"><%= nick %>님! 반갑습니다. <a href="/board1/user/proc/logout.jsp">[로그아웃]</a><p>
				<table>
					<tr>
						<td>번호</td>
						<td>제목</td>
						<td>글쓴이</td>
						<td>날짜</td>
						<td>조회</td>
					</tr>
				<% for(BoardBean bb : list) { %>
					<tr>
						<td><%= listCount-- %></td>
						<td><a href="./view.jsp?pg=<%= current %>&seq=<%= bb.getSeq() %>"><%= bb.getTitle() %></a>&nbsp;[<%= bb.getComment() %>]</td>
						<td><%= bb.getNick() %></td>
						<td><%= bb.getRdate().substring(2, 10) %></td>
						<td><%= bb.getHit() %></td>
					</tr>
				<% } %>
				</table>
			</div>
			
			<!-- 페이징 -->
			<nav class="paging">
				<span> 
				<% if(groupStartEnd[0] > 1) { %>
				<a href="./list.jsp?pg=<%= groupStartEnd[0] - 1 %>" class="prev">이전</a>
				<% }%>
				
				<% for(int i = groupStartEnd[0]; i <= groupStartEnd[1]; i++) {%>
				
				<a href="./list.jsp?pg=<%= i %>" class="num <%= (current == i)?"current":"" %>"><%= i %></a>
				
				<!-- <a href="./list.jsp?pg=<%= i %>" class="num current"><%= i %></a>			 current  -->
				
				<% } %>
				
				<% if(groupStartEnd[1] < totalPage) {  %>
				<a href="./list.jsp?pg=<%= groupStartEnd[1] + 1 %>" class="next">다음</a>
				<% } %>
				</span>
			</nav>
			<a href="/board1/write.jsp" class="btnWrite">글쓰기</a>
		</div>
	</body>

</html>











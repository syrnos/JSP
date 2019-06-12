<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../_head.jsp" %>
<jsp:include page="./_aside_${grp}.jsp"/>
	    <!-- 컨텐츠 내용 시작 -->

		<div id="board">
			<h3>글목록</h3>
			<!-- 리스트 -->
			<div class="list">
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
						<td><a href="/farmstory/board/view.do?seq=${vo.seq}">${vo.title}</a>&nbsp;[${vo.comment}]</td>
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
					<a href="/farmstory/board/list.do?pg=${i}" class="num">${i}</a>
					</c:forEach>
					
					<a href="#" class="next">다음</a>
				</span>
			</nav>
			<a href="/farmstory/board/write.do" class="btnWrite">글쓰기</a>
		</div>
		
		
	<!-- 컨텐츠 내용 끝 -->
    </article>
  </section>
</section>

<%@ include file="../_footer.jsp" %>




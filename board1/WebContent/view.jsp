<%@page import="java.util.List"%>
<%@page import="kr.co.board1.service.BoardService"%>
<%@page import="kr.co.board1.bean.BoardBean"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="kr.co.board1.config.SQL"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="kr.co.board1.config.DBConfig"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	request.setCharacterEncoding("UTF-8");
	
	String pg = request.getParameter("pg");
	String seq = request.getParameter("seq");
	
//	String parent = request.getParameter("parent");
	
	BoardService service = BoardService.getInstance();
	
	service.updateHit(seq);
	BoardBean bb = service.viewBoard(seq);
	
	//댓글 리스트 가져오기 
	List<BoardBean> commentList = service.commentList(seq);	//ArrayList보다 List가 더 다형성에 있어서 좋음 

%>

<html>
	<head>
		<meta charset="UTF-8" />
		<title>글보기</title> 
		<link rel="stylesheet" href="./css/style.css" />
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	</head>
	<body>
		<div id="board">
			<h3>글보기</h3>
			<div class="view">
				<form action="#" method="post">
					<table>
						<tr>
							<td>제목</td>
							<td><input type="text" name="subject" value="<%= bb.getTitle() %>" readonly />
							</td>
						</tr>
						
						<%
							if(bb.getFile() == 1) {
						%>
						<tr>
							<td>첨부파일</td>
							<td>
								<a href="./proc/download.jsp?oldName=<%= bb.getOldName() %>&newName=<%= bb.getNewName() %>"><%= bb.getOldName() %></a>
								<span><%= bb.getDownload() %> 다운로드</span>
							</td>
						</tr>
						<%
							}
						%>
						<tr>
							<td>내용</td>
							<td>
								<textarea name="content" rows="20" readonly><%=bb.getContent() %></textarea>
							</td>
						</tr>
					</table>
					<div class="btns">
						<a href="./proc/delete.jsp?pg=<%= pg %>&seq=<%= bb.getSeq() %>" class="cancel del">삭제</a>
						<a href="#" class="cancel mod">수정</a>
						<a href="./list.jsp?pg=<%= pg %>" class="cancel">목록</a>
					</div>
				</form>
			</div><!-- view 끝 -->
			
			<!-- 댓글리스트 -->
			<style>
				.comments > .comment:nth-of-type(1) {
					display: none;
				}
			</style>
			<section class="comments">
				<h3>댓글목록</h3>
				<div class="comment">
					<span>
						<span class="nick">닉네임</span>
						<span class="rdate">날짜</span>
					</span>
					<textarea>내용</textarea>
					<div>
						<a href="#" class="del">삭제</a>
						<a href="#" class="mod">수정</a>
					</div>
				</div>
				<% 
					for(BoardBean comment :commentList) { 
				%>
				<div class="comment">
					<span>
						<span class="nick"><%= comment.getNick() %></span>
						<span class="rdate"><%= comment.getRdate().substring(2,10) %></span>
					</span>
					<textarea><%= comment.getContent() %></textarea>
					<div>
						<a href="./proc/delete.jsp?seq=<%= comment.getSeq()%>&parent=<%=seq %>&pg=<%=pg %>" class="del">삭제</a>
						<a href="#" class="mod">수정</a>
					</div>
				</div>
				<% 
					} 
				
					if(commentList.size() == 0) {
				%>
				<p class="empty">
					등록된 댓글이 없습니다.
				</p>
				<% 
					}
				%>
				
			</section>
			
			<!-- 댓글쓰기 -->
			<section class="comment_write">												<!--class="comment_write"   -->
				<h3>댓글쓰기</h3>
				<div>
					<form action=".proc/commentWrite.jsp" method="post">
						<input type="hidden" name="parent" value="<%= bb.getSeq() %>" />
								<!-- 사용자 정보는 파라미터로 전송하지 않는게 좋음 -->
						<textarea name="comment" rows="5"></textarea>
						<div class="btns">
							<a href="#" class="cancel">취소</a>
							<input type="submit" class="submit" value="작성완료" />		<!--class="submit"  -->
						</div>
					</form>
					<script>
					 	$(function() {
					 		
					 		var comments = $('.comments');
					 		var btnSubmit = $('.comment_write .submit'); 			/* 위 주석 comment_write의 submit */
							
							
							btnSubmit.click(function(){
								
								var textarea = $('.comment_write textarea');
						 		var parent = $('.comment_write input[name=parent]').val();
						 		var content = textarea.val();
						 		var commentView = $('.comments > .comment:nth-of-type(1)');
								
								if(content == "") {
									alert('댓글 내용을 입력하세요.');
									$textarea.focus();											//커서
									/* return false; */	
								} else {
									var jsonData = {parent: parent, content: content};		//{key : value}    ++content == var content
									
									$.ajax({
										url: './proc/commentWrite.jsp',			//뒤에 ./proc/commentWrite.jsp?uid=홍길동 ?가 들어가면 type : get
										type: 'post',
										dataType: 'json',
										data: jsonData,
										success: function(result){							//응답받는 이벤트 함수 
											var commentNew = commentView.clone();			//클론(객체 복사)
											
											commentNew.find('.nick').text(result.nick);
											commentNew.find('.rdate').text(result.rdate);
											commentNew.find('textarea').text(result.content);
											
											comments.append(commentNew);						//추가한다 
											
											// empty 문구삭제
											var empty = $('.empty');
											
											if(empty.is(':visible')){							//visible : 화면에 보이면
												empty.remove();												
											}											
											
										}										
									});
								}
								return false;										/* 폼 전송 취소(페이지 이동을 안함) */
							});
							
						});
					 	
					</script>
				</div>
			</section>
		</div><!-- board 끝 -->
	</body>

</html>











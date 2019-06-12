<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../_head.jsp" %>

<section id="sub" class="croptalk">
	<div><img src="../img/sub_top_tit3.png" alt="CROP TALK"></div>
	<section>
	  <aside>
	    <img src="../img/sub_aside_cate3_tit.png" alt="농작물이야기"/>
	    <ul class="lnb">
	      <li class="on"><a href="./story.html">농작물이야기</a></li>
	      <li><a href="./grow.html">텃밭가꾸기</a></li>
	      <li><a href="./school.html">귀농학교</a></li>
	    </ul>
	  </aside>
	  <article>
	    <nav>
	      <img src="../img/sub_nav_tit_cate3_tit1.png" alt="농작물이야기"/>
	      <p>
	        HOME > 농작물이야기 > <span>농작물이야기</span>
	      </p>
	    </nav>
	    <!-- 컨텐츠 내용 시작 -->
		<div id="board">
			<h3>글보기</h3>
			<div class="view">
				<form action="#" method="post">
					<table>
						<tr>
							<td>제목</td>
							<td><input type="text" name="subject" value="제목" readonly />
							</td>
						</tr>
						<tr>
							<td>첨부파일</td>
							<td>
								<a href="#">파일명</a>
								<span>1회 다운로드</span>
							</td>
						</tr>
						<tr>
							<td>내용</td>
							<td>
								<textarea name="content" rows="20" readonly>내용</textarea>
							</td>
						</tr>
					</table>
					<div class="btns">
						<a href="#" class="cancel del">삭제</a>
						<a href="#" class="cancel mod">수정</a>
						<a href="#" class="cancel">목록</a>
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
				
				<div class="comment">
					<span>
						<span class="nick">닉네임</span>
						<span class="rdate">19-05-31</span>
					</span>
					<textarea>댓글내용</textarea>
					<div>
						<a href="#" class="del">삭제</a>
						<a href="#" class="mod">수정</a>
					</div>
				</div>
				<p class="empty">등록된 댓글이 없습니다.</p>
			</section>
			
			<!-- 댓글쓰기 -->
			<section class="comment_write">
				<h3>댓글쓰기</h3>
				<div>
					<form action="./proc/commentWrite.jsp" method="post">
						<input type="hidden" name="parent" value="" />
						<textarea name="comment" rows="5"></textarea>
						<div class="btns">
							<a href="#" class="cancel">취소</a>
							<input type="submit" class="submit" value="작성완료" />
						</div>
					</form>
					<script>
						$(function(){
							
							var comments = $('.comments');
							var btnSubmit = $('.comment_write .submit');
							
							btnSubmit.click(function(){
								var commentView = $('.comments > .comment:nth-of-type(1)');
								var textarea = $('.comment_write textarea');								
								var parent = $('.comment_write input[name=parent]').val();
								var content = textarea.val();
								
								if(content == ""){									
									alert('댓글 내용을 입력하세요.');
									textarea.focus();									
								}else{
									var jsonData = {parent: parent, content:content};
									
									$.ajax({
										url: './proc/commentWrite.jsp',
										type: 'post',
										dataType: 'json',
										data: jsonData,
										success: function(result){
											var commentNew = commentView.clone();
											
											commentNew.find('.nick').text(result.nick);
											commentNew.find('.rdate').text(result.rdate);
											commentNew.find('textarea').text(result.content);
											
											comments.append(commentNew);
											
											// empty 문구삭제
											var empty = $('.empty');
											
											if(empty.is(':visible')){
												empty.remove();												
											}											
											
										}										
									});		
								}
								
								return false; // 폼전송 취소
								
							});
							
							
						});

					</script>
				</div>
			</section>
		</div><!-- board 끝 -->


	<!-- 컨텐츠 내용 끝 -->
    </article>
  </section>
</section>

<%@ include file="../_footer.jsp" %>













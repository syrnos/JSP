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
			<h3>글쓰기</h3>
			<div class="write">
				<form action="/farmstory/board/write.do" method="post">					
					<table>
						<tr>
							<td>제목</td>
							<td><input type="text" name="subject" placeholder="제목을 입력하세요." required /></td>
						</tr>				
						<tr>
							<td>내용</td>
							<td>
								<textarea name="content" rows="20" required></textarea>
							</td>
						</tr>
						<tr>
							<td>첨부</td>
							<td>
								<input type="file" name="file" />
							</td>
						</tr>
					</table>
					<div class="btns">
						<a href="#" class="cancel">취소</a>
						<input type="submit" class="submit" value="작성완료" />
					</div>
				</form>
			</div>
		</div>


	<!-- 컨텐츠 내용 끝 -->
    </article>
  </section>
</section>
<%@ include file="../_footer.jsp" %>



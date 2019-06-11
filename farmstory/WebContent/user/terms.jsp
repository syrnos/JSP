<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../_head.jsp" %>
		<div id="terms">
			<section>
				<table>
					<caption>사이트 이용약관</caption>
					<tr>
						<td>
							<textarea readonly>${ requestScope.vo.getTerms() }</textarea>
												<!-- fm으로 썻을때  -->
							<div>
								<label><input type="checkbox" name="chk1" />&nbsp;동의합니다.</label>        
							</div>
						</td>
					</tr>
				</table>
			</section>			
			<section>
				<table>
					<caption>개인정보 취급방침</caption>
					<tr>
						<td>
							<textarea readonly>${ vo.privacy }</textarea>
												<!-- 간단하게 썻을 때  -->
							<div>
								<label><input type="checkbox" name="chk2" />&nbsp;동의합니다.</label>        
							</div>
						</td>
					</tr>
				</table>
			</section>
			
			<div>
				<a href="/farmstory/user/login.jsp" class="btnCancel">취소</a>
				<a href="/farmstory/user/register.jsp" class="btnNext">다음</a>
			<!-- a태그의 링크는 get 방식 -->
			</div>
			
		</div>
<%@ include file="../_footer.jsp" %>
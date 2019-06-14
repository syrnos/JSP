<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../_head.jsp" %>
      <main>
        <div class="slider">

          <img src="/farmstory/img/main_slide_img_tit.png" class="slogan" alt="사람과 자연을 사랑하는 팜스토리"/>

          <ul>
            <li><img src="/farmstory/img/main_slide_img1.jpg" alt="슬라이드1"/></li>
            <li><img src="/farmstory/img/main_slide_img2.jpg" alt="슬라이드2"/></li>
            <li><img src="/farmstory/img/main_slide_img3.jpg" alt="슬라이드3"/></li>
          </ul>

          <article>
            <img src="/farmstory/img/main_banner_txt.png" alt="GRAND OPEN"/>
            <img src="/farmstory/img/main_banner_tit.png" alt="팜스토리 오픈기념 30%할인 이벤트"/>
            <img src="/farmstory/img/main_banner_img.png" alt="이미지"/>
          </article>

        </div>
        <div class="banner">
          <a href="#"><img src="/farmstory/img/main_banner_sub1_tit.png" alt="팜스토리 오늘의 식단"/></a>
          <a href="#"><img src="/farmstory/img/main_banner_sub2_tit.png" alt="팜스토리 나도 요리사"/></a>
        </div>

        <div class="latest">
          <article>
            <img src="/farmstory/img/main_latest1_tit.png" alt="텃밭가꾸기">
            <img src="/farmstory/img/main_latest1_img.jpg" alt="이미지">
            <table border="0">
     		<c:forEach var="vo" items="${list1}">
		        <tr>
		          <td>></td>
		          <td>${vo.title}</td>
		          <td>${vo.rdate.substring(2, 10)}</td>
		        </tr>
	        </c:forEach>
              
            </table>
          </article>
          <article>
            <img src="/farmstory/img/main_latest2_tit.png" alt="텃밭가꾸기">
            <img src="/farmstory/img/main_latest2_img.jpg" alt="이미지">
            <table border="0">
              <c:forEach var="vo" items="${list2}">
		        <tr>
		          <td>></td>
		          <td>${vo.title}</td>
		          <td>${vo.rdate.substring(2, 10)}</td>
		        </tr>
	        </c:forEach>
            </table>
          </article>
          <article>
            <img src="/farmstory/img/main_latest3_tit.png" alt="텃밭가꾸기">
            <img src="/farmstory/img/main_latest3_img.jpg" alt="이미지">
            <table border="0">
             <c:forEach var="vo" items="${list3}">
		        <tr>
		          <td>></td>
		          <td>${vo.title}</td>
		          <td>${vo.rdate.substring(2, 10)}</td>
		        </tr>
	        </c:forEach>
            </table>
          </article>

        </div>

        <div class="info">
          <div></div>
          <div></div>
          <div></div>
        </div>

      </main>
<%@ include file="../_footer.jsp" %>
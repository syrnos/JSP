<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<section id="sub" class="croptalk">
	<div><img src="../img/sub_top_tit3.png" alt="CROP TALK"></div>
	<section>
	  <aside>
	    <img src="../img/sub_aside_cate3_tit.png" alt="농작물이야기"/>
	    <ul class="lnb">
	      <li class="${cate=='story'?'on':''}"><a href="/farmstory/board/list.do?grp=croptalk&cate=story">농작물이야기</a></li>
	      <li class="${cate=='grow'?'on':''}"><a href="/farmstory/board/list.do?grp=croptalk&cate=grow">텃밭가꾸기</a></li>
	      <li class="${cate=='school'?'on':''}"><a href="/farmstory/board/list.do?grp=croptalk&cate=school">귀농학교</a></li>
	    </ul>
	  </aside>
	  <article>
	    <nav>
	      <img src="../img/sub_nav_tit_cate3_tit_${cate}.png" alt="농작물이야기"/>
	      <p>
	        HOME > 농작물이야기 > 
	        
	        <c:if test="${cate=='story'}"><span>농작물이야기</span> </c:if>
	        <c:if test="${cate=='grow'}"><span>텃밭가꾸기</span> </c:if>
	        <c:if test="${cate=='school'}"><span>귀농학교</span> </c:if>
	        
	        
	        
	        
	      </p>
	    </nav>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>팜스토리</title>
    <link rel="stylesheet" href="/farmstory/css/style.css"/>
    <link rel="stylesheet" href="/farmstory/css/board.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="/farmstory/js/slider.js"></script>
  </head>
  <body>
    <div id="wrapper">
      <header>
        <a href="/farmstory/index.do"><img src="/farmstory/img/logo.png" alt="로고"></a>
        <p>
          <a href="/farmstory/index.do">HOME |</a>
          
		<c:if test="${sessionScope.user == null }">     <!-- LoginService.java 에 session.setAttribute("user", vo); 참고  -->     
          <a href="/farmstory/user/terms.do">회원가입 |</a>
          <a href="/farmstory/user/login.do">로그인 |</a>
        </c:if>
          
       <c:if test="${sessionScope.user != null}">
          <a href="/farmstory/user/logout.do">로그아웃 |</a>
       </c:if>
          <a href="#">고객센터</a>
        </p>

        <img src="/farmstory/img/head_txt_img.png" alt="3만원이상 무료배송/팜카드 10%적립" />

        <ul>
          <li><a href="/farmstory/introduction/hello.do">팜스토리소개</a></li>
          <li><a href="/farmstory/market.do"><img src="/farmstory/img/head_menu_badge.png" alt="badge"/>장보기</a></li>
          <li><a href="#">농작물이야기</a></li>
          <li><a href="#">이벤트</a></li>
          <li><a href="#">커뮤니티</a></li>
        </ul>

      </header>

      
<%@page import="kr.co.board1.bean.UserBean"%>
<%@page import="java.lang.ProcessBuilder.Redirect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% 
	UserBean ub = (UserBean) session.getAttribute("user");

	if(ub == null){
		//로그인화면 포워딩 (로그인이 안했을때)
		pageContext.forward("./user/login.jsp");
		
	} else{
		//로그인 했을때
		pageContext.forward("./list.jsp");
	}
%>



<!-- login.jsp로 포워딩 하기위해 사용함 
	../   : 상대경로
	/bodrd1/ : 절대경로
	맨처음 / : root
	include forward Redirect는 상대경로를 사용해야함 
	
-->
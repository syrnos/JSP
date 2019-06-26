<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>session1</title>
</head>
<body>
	<h3>세션</h3>
	
	<%
		String uid = request.getParameter("uid");
		String name = request.getParameter("name");
	
		// 세션 저장 
		session.setAttribute("uid", uid);	
		session.setAttribute("name", name);	
	
		response.sendRedirect("./session1-1.jsp");
	
	%>
</body>
</html>
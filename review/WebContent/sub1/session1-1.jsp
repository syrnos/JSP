<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>session1-1</title>
</head>
<body>
	<h3>세션 출력</h3>
	<%
		String uid = (String) session.getAttribute("uid");
		String name = (String) session.getAttribute("name");
	%>
	<p>
		uid : <%= uid %> <br/>
		name : <%= name %>
	</p>
</body>
</html>
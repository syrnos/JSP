<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>request1</title>
</head>
<body>
	<h3>파라미터 결과출력</h3>
	<%
		String uid = request.getParameter("uid");
	
	%>
	
	<p>
		uid : <%= uid %>
	</p>
	
</body>
</html>
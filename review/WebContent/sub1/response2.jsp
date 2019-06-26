<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>response2</title>
</head>
<body>
	<h3>리다이렉트</h3>
	
	<%
	
		response.sendRedirect("./request1.jsp?uid=kimch");
	
	%>
</body>
</html>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>request5</title>
</head>
<body>

	<%
		request.setCharacterEncoding("UTF-8");
		String author = request.getParameter("author");
		String poem = request.getParameter("poem");
	%>
	
	<p>
		작가 : <%= author %> <br/>
		
		<textarea rows="10" cols="50" readonly="readonly">
			<%= poem %>
		</textarea>
		
	</p>

</body>
</html>
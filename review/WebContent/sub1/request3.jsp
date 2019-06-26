<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>request3</title>
</head>
<body>
	<h3>파라미터 결과출력</h3>
	
	<%
		String uid = request.getParameter("uid");
		String name = request.getParameter("name");
		String hobbies[] = request.getParameterValues("hobby");
	%>
	
	<p>
		uid : <%= uid %> <br/>
		name : <%= name %> <br/>
		hobby : 
		<%
			for(String hobby : hobbies) {
				out.print(hobby + " ");
			}	
		%>
		
	</p>
</body>
</html>
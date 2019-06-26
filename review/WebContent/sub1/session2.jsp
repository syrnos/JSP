<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>session2</title>
</head>
<body>
	<h3>세션</h3>
	<%
		List<Map<String, String>> list = new ArrayList<>();
		
		Map<String, String> map = new HashMap<>();
		map.put("name","김유신");
		map.put("birth","1992-05-03");
		map.put("hp","010-1234-1111");
		map.put("addr","김해시");
		
		list.add(map);	
		
		// 세션 저장
		session.setAttribute("list", list);
		
		response.sendRedirect("./session2-1.jsp");
	%>

</body>
</html>
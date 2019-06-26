<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>session2-1</title>
</head>
<body>
	<h3>세션 출력</h3>
	<%
		List<Map<String,String>> list = (List<Map<String,String>>) session.getAttribute("list");
		
		Map<String, String> map = list.get(0);
		
	%>
	<p>
		name : <%= map.get("name") %> <br/>
		birth : <%= map.get("birth")%> <br/>
		hp : <%= map.get("hp")%> <br/>
		addr : <%=map.get("addr")%> <br/>
		
	</p>
</body>
</html>
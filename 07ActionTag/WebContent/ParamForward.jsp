<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String param1 = request.getParameter("param1");
	String param2 = request.getParameter("param2");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ParamForward</title>
</head>
<body>
	<%= param1 %>
	<%= param2 %>
</body>
</html>
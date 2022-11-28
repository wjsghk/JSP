<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	session.setMaxInactiveInterval(1200);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>session</title>
</head>
<body>
<h2>session 설정 확인</h2>
<ul>
<li>세션 유지기간 : <%= session.getMaxInactiveInterval() %></li>
<li>세션 아이디 :<%= session.getId()%></li>
</ul>
</body>
</html>
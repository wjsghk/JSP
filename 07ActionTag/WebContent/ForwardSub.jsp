<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ForwardSub.jsp</title>
</head>
<body>
	<h2>포워드된 페이지 입니다.</h2>
	<p><%=pageContext.getAttribute("pAtrr") %></p>
	<p><%=request.getAttribute("rAtrr") %></p>
</body>
</html>
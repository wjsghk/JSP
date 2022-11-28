<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
pageContext.setAttribute("pAtrr","이순신");
request.setAttribute("rAtrr","홍길동");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Forward.jsp</title>
</head>
<body>
	<jsp:forward page="./ForwardSub.jsp"></jsp:forward>
</body>
</html>
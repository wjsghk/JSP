<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="common.JDBConnect"%>
<%
	JDBConnect jdbc = new JDBConnect();
	out.print("<h1>DB연결 성공</h1>");
	jdbc.close();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jdbcTest2</title>
</head>
<body>

</body>
</html>
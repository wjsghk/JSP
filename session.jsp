<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList" %>
<%
	ArrayList<String> lists = new ArrayList<String>();
	lists.add("리스트");
	lists.add("컬렉션");
	session.setAttribute("lists",lists);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Session의 클라이언트부분</title>
</head>
<body>
	<a href="SessionLocation.jsp">SessionLocation.jsp바로가기</a>
</body>
</html>
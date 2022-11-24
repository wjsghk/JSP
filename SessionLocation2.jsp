<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList" %>
<%
	ArrayList<String> lists = (ArrayList)session.getAttribute("lists");
	for(String str : lists){
		out.print(str + "<br>");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SessionLocation2=>session의 서버부분</title>
</head>
<body>
	<h2>페이지 이동후 session 영역의 속성 읽기2</h2>
</body>
</html>
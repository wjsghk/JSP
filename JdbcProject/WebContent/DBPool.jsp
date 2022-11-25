<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import = "common.DBConnPool" %>
    <%
    	DBConnPool pool = new DBConnPool();
	    out.print("<h1>DB연결 성공</h1>");
		pool.close();
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DBPool</title>
</head>
<body>
	
</body>
</html>
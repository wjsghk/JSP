<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="common.JDBConnect"%>
<%
	String driver = application.getInitParameter("OracleDriver");
	String url =application.getInitParameter("OracleURL");
	String id =application.getInitParameter("OracleId");
	String pwd =application.getInitParameter("OraclePwd");
	
	
	JDBConnect jdbc = new JDBConnect(driver,url,id,pwd);
	out.print("<h1>DB연결 성공</h1>");
	jdbc.close();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JdbcTest3</title>
</head>
<body>
	
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %><!-- sql을 가져오려면 꼭 작성해야한다. -->
<%
	Connection conn = null;
	
	String url ="jdbc:oracle:thin:@localhost:1521:orcl";

	try{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn = DriverManager.getConnection(url,"musthave","1234");//(DB주소를 대입을 해도되고 위에 url이라는 변수를 만들어서 대입해도 된다,DB아이디,DB비밀번호)가 들어간다.
		
		conn.close();
	}catch(Exception e){
		e.printStackTrace();
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jdbcTest</title>
</head>
<body>
	DB연결 성공
</body>
</html>
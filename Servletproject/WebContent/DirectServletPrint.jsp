<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>web.xml에서 매핑 후 Servlet에서 직접 출력하기</h2>
	<form method="post" action="./DirectServletPrint.do">
		아이디 : <input type="text" name = "id"/>
		비밀번호 : <input type="password" name = "pwd"/>
		<input type="submit" value="바로가기"/>
		
	</form>
</body>
</html>
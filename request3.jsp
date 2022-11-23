<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ResponseLogin,ResponseWelcome의 클라이언트</title>
</head>
<body>
	<form action="./ResponseLogin.jsp" method="post">
		아이디 : <input type="text" name="user_id"/><br/>
		패스워드 :	<input type="text" name="user_pwd"/><br/>
		<input type="submit" name="로그인"/>
	</form>
</body>
</html>
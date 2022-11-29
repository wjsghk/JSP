<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>useBean</title>
</head>
<body>
	<h2>useBean 액션 태그</h2>
	<h3>자바빈즈 생성하기</h3>
	<jsp:useBean id="person" class="common.Person" scope="request"></jsp:useBean>
	
	<jsp:setProperty property="name" name="person" value="임꺽정"/>
	<jsp:setProperty property="age" name="person" value="10"/>
	
	<ul>
	<li><jsp:getProperty property="name" name="person"/></li>
	<li><jsp:getProperty property="age" name="person"/></li>
	</ul>
</body>
</html>
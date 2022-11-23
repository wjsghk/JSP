<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body><!-- 클라이언트 -->
<form method="post" action="RequestParameter.jsp"><!-- 다양한 <input>태그 사용,request2와 관련 -->
	아이디 : <input type="text" name="id" value=""/><br/>
	성별 : 
	<input type="radio" name="sex" value="man"/>남자
	<input type="radio" name="sex" value="woman" checked="checked"/>여자
	<br/>
	관심사항 :
	<input type="checkbox" name="favo" value="eco" />경제
	<input type="checkbox" name="favo" value="ppl" checked="checked"/>정치
	<input type="checkbox" name="favo" value="ent" />연예<br/>
	자기소개 :<br/>
	<textarea name="intro" cols="30" rows="4"></textarea>
	<br/>
	<input type="submit" value="전송하기"/>
	</form>
</body>
</html>
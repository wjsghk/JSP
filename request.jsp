<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>1. 클라이언트와 서버의 환경정보 읽기</h2>
	<a href="./RequestWebInfo.jsp?eng=Hello&han=안녕">
	  GET 방식 전송=>?를사용한ㄷ.
		  <!--query parameters( 물음표 뒤에 = 로 연결된 key value pair 부분)을 url 뒤에 덧붙여서 추가적인 정보를 서버 측에 전달하는 것이다. 
           클라이언트가 어떤 특정 리소스에 접근하고 싶어하는지 정보를 담는다. -->
	</a>
	<br />
	<form action="RequestWebInfo.jsp" method="post"><!--action => 파일이름으로 이동한다.	 -->
		영어 : <input type="text" name="eng" value="Bye" /><br />
		한글 : <input type="text" name="han" value="잘 가" /><br />
	<!-- name="eng",name="han"이 파라메터의 역할을한다. -->
		<input type="submit" value="POST 방식 전송" /> 
	<!-- 서버요청방식 -->
	<!-- get , post -->
	<!-- post방식은 표현방법이 <form>하나밖에없다 -->
	<!-- post방식은 주소창에 값이 비노출 -->
	<!-- get방식은 주소창에 값이 노출 -->
	<!-- 서버 <---- 클라이언트 : request (get, post) -->
	<!-- 클라이언트 <---- 서버 : response -->
	</form>
</body>
</html>
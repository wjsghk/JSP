<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="./Common/Link.jsp"></jsp:include>
	<h2>로그인 페이지</h2>
	<span style="color: red; font-size: 1.2em;">
		<%= request.getAttribute("LoginErrMsg") == null ? 
				"" : request.getAttribute("LoginErrMsg") %> 
	</span>
	<%
	if (session.getAttribute("UserId") == null){ //로그인상태 확인 {-->실행문묶는범위 잘 확인
		//로그아웃상태
	%>
	<script>
	function validateForm(form){
		if (!form.user_id.value){
			alert("아이디를 입력하세요.");
			return false;
		}
		if (form.user_pw.value ==""){
			alert("패스워드를 입력하세요.");
			return false;
		}
	}
	</script>
	<form action="LoginProcess.jsp" method="post" name="loginFrm"  //validateFrom(this)부분에 true값이들어오면 "LoginProcess.jsp"로 페이지이동
		onsubmit="return validateForm(this);">
		아이디 : <input type="text" name="user_id" /><br />
		패스워드 : <input type="password" name="user_pw" /><br />
		<input type="submit" value="로그인하기" />
	</form>
	<% 
	}else { //로그인된 상태
	%>
		<%= session.getAttribute("UserName") %> 회원님, 로그인하셨습니다.<br />
		<a href="Logout.jsp">[로그아웃]</a>
	<%
	}
	%>
</body>
</html>
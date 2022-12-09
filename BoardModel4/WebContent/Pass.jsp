<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파일 첨부형 게시판</title>
<script type="text/javascript">
	function validateForm(form){ //비밀번호를 입력했는지 확인해주는 자바스크립트 함수를 정의
		if (form.pass.value == ""){
			alert("비밀번호를 입력하세요^-^")
			form.pass.focus();
			return false;
		}
	}
</script>
</head>
<body>
<h2>파일 첨부형 게시판 - 비밀번호 검증(Pass)</h2>
	<form name="writeFrm" method="post" action="pass.do" onsubmit="return validateForm(this);">
	<!--이번 폼에서는 파일을 첨부하지 않으므로 entype속성은 필요없어요~  -->
	<input type="hidden" name="idx" value="${ param.idx }" />
	<input type="hidden" name="mode" value="${ param.mode }" />
	<!--삭제,수정할 게시물의 일련번호와 모드를 hidden타입 입력상자에저장해요~  -->
<table border="1" width="90%">
	<tr>
		<td>비밀번호</td>
		<td>
			<input type="password" name="pass" style="width:100px;" />
		</td>
	</tr>
	<tr>
		<td colspan="2" align="center">
			<button type="submit">검증하기</button>
			<button type="reset">RESET</button>
			<button type="button" onclick="location.href='list.do';">
				목록 바로가기
			</button>
		</td>
	</tr>
</table>
</form>
</body>
</html>
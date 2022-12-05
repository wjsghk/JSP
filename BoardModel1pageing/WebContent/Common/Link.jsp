<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<table border="1" width="90%">
	<tr>
	<td align="center">
<!-- 	로그인 여부에 따른 메뉴 변화 -->

		<!-- ./ =>현재 위치에서 찾기 -->
		<!-- ../ => 하나 상위 위치에서 찾기 -->
		<% if (session.getAttribute("UserId") == null) { %>
			<a href="LoginForm.jsp">로그인</a>
		<% } else { %>
			<a href="Logout.jsp">로그아웃</a>
		<% }  %>
			<!--8장과 9장의 회원제 게시판 프로젝트에서 사용할 링크 -->
			&nbsp;&nbsp;&nbsp; <!-- 메뉴 사이의 공백 확보용 특수문자 -->
			<a href="List.jsp">게시판(페이징X)</a>
			&nbsp;&nbsp;&nbsp;
			<a href="List.jsp">게시판(페이징0)</a>
		</td>
	</tr>
</table>	
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="model1.board.BoardDTO" %>
<%@page import="model1.board.BoardDAO" %>

<%
String num =request.getParameter("num"); 	//일렬번호 받기

BoardDAO dao =new BoardDAO(application);	//DAO생성
dao.updateVisitCount(num);					//조회수 증가  DAO.jsp파일에 코드를 추가한다.
BoardDTO dto = dao.selectView(num);			//게시물 가져오기  DAO.jsp파일에 코드를 추가한다.
dao.close();								//DB연결 해제
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function deletePost(){
	
}
</script>
</head>
<body>
<jsp:include page="./Common/Link.jsp"/>
<h2>회원제 게시판-상세보기(View)</h2>
<form name="writeFrm">
	<input type="hidden" name="num" value="<%=num %>"/>
	<table border="1" width="90%">
		<tr>
			<td>번호</td>
			<td><%=dto.getNum() %></td>
			<td>번호</td>
			<td><%=dto.getName() %></td>
		</tr>
		
		<tr>
			<td>작성일</td>
			<td><%=dto.getPostdate() %></td>
			<td>조회수</td>
			<td><%=dto.getVisitcount() %></td>
		</tr>
		
		<tr>
			<td>제목</td>
			<td colspan="3"><%=dto.getTitle() %></td>
		</tr>
		
		<tr>
			<td>내용</td>
			<td colspan="3" height="100">
			<%= dto.getContent().replace("\r\n", "<br/>") %></td>
		</tr>
		
		<tr>
			<td colspan="4" align="center">
				<%
				if (session.getAttribute("UserId") !=null
					&& session.getAttribute("UserId").toString().equals(
							dto.getId())){
					%>
					<button type="button" onclick="location.href='Edit.jsp?num=<%= dto.getNum() %>';">수정하기</button>
					<button type="button" onclick="deletePost();">삭제하기</button>
					<%
					}
					%>
					<button type="button" onclick="location.href='List.jsp';">목록보기</button>
			</td>
		</tr>
	</table>
</form>
</body>
</html>
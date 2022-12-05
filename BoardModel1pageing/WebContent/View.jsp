<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model1.board.boardDAO"%>
<%@ page import="model1.board.boardDTO"%>
<%
String num= request.getParameter("num"); //일련번호 받기

boardDAO dao = new boardDAO(application); //DAO 생성
dao.updateVisitCount(num);				  //조회수 증가
boardDTO dto = dao.selectView(num);		  //게시물 가져오기
dao.close();							  //DB 연결 해제
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원제 게시판</title>
<script>
function deletePost(){
	//0. form태그를 객체로 가지고 온다.
	let form =document.writeFrm;
	//1.전송방식
	form.method = "post";
	//2.이동할 페이지
	form.action ="DeleteProcess.jsp"
	//3.submit기능 실행
	form.submit();
}
</script>
</head>
<body>
	<jsp.include page="./Common/Link.jsp" /> <!-- 공통링크 -->
		<h2>회원제 게시판 - 상세 보기(View)</h2>
		<form name="writeFrm" method="post">
			<input type="hidden" name="num" value="<%=num %>" />
			<table border="1" width="90%">
				<tr>
					<td>번호</td>
					<td><%= dto.getNum() %></td>
					<td>작성자</td>
					<td><%= dto.getName() %></td>
				</tr>
				<tr>
					<td>작성일</td>
					<td><%= dto.getPostdate() %></td>
					<td>조회수</td>
					<td><%= dto.getVisitcount() %></td>
				</tr>
				<tr>
					<td>제목</td>
					<td colspan="3"><%= dto.getTitle() %></td>
				</tr>
					<td>내용</td>
					<td colspan="3" height="100">
						<%= dto.getContent().replace("\r\n", "<br/>")%></td>
				</tr>
				<tr>
					<td colspan="4" align="center">
					<% 
					if(session.getAttribute("UserId") !=null
					   && session.getAttribute("UserId").toString().equals(
					                                           dto.getId())) {
					%>
					<button type="button"
								onclick="location.href='Edit.jsp?num=<%= dto.getNum() %>';">
							수정하기</button>
					<button type="button" onclick="deletePost();">삭제하기</button>
					<%
					}
					%>
					<button type="button" onclick="location.href='List.jsp';">
						목록보기
					</button>
				</td>
			</tr>					                                           
		</table>
	</form>
</body>
</html>
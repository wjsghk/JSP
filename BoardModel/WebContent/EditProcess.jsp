<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="model1.board.BoardDTO" %>
<%@page import="model1.board.BoardDAO" %>
<%@include file="../IsLoggedIn.jsp" %><!-- 로그인 확인 -->
<%
	//수정내용 얻기
	String num = request.getParameter("num");
	String title = request.getParameter("title");
	String content =request.getParameter("content");
	//DTO에 저장
	BoardDTO dto =new BoardDTO();
	dto.setNum(num);
	dto.setTitle(title);
	dto.setContent(content);
	//DB에 반영
	BoardDAO dao = new BoardDAO(application);
	int affected = dao.updateEdit(dto);
	dao.close();
	//성공/실패 처리
	if(affected ==1){
		//성공시 상세보기 페이지로 이동
		response.sendRedirect("View.jsp?num=" + dto.getNum());
	}
	else{
		//실패시 이전 페이지로 이동
		JSFunction.alertBack("수정하기에 실패하였습니다.",out);
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EditProcess</title>
</head>
<body>

</body>
</html>
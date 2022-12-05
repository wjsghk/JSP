<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model1.board.boardDAO" %>
<%@ page import="model1.board.boardDTO" %>
<%@ include file="./IsLoggedIn.jsp"%>

<%
	//폼값 받기
	String title =request.getParameter("title");
	String content = request.getParameter("content");
	
	//폼값을 DTO객체에 저장
	boardDTO dto =new boardDTO();
	dto.setTitle(title);
	dto.setContent(content);
	dto.setId(session.getAttribute("UserId").toString());
	
	//DAO 객체를 통해 DB에 DTO저장
	boardDAO dao = new boardDAO(application);
	int iResult = dao.insertWrite(dto);
	dao.close();
	
	//성공 or 실패
	if (iResult ==1) {
		response.sendRedirect("List.jsp");
	} else {
		JSFunction.alertBack("글쓰기에 실패하였습니다.", out);
	}
%>
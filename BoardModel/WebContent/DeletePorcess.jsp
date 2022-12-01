<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="model1.board.BoardDTO" %>
<%@page import="model1.board.BoardDAO" %>
<%@include file="../IsLoggedIn.jsp" %><!-- 로그인 확인 -->
<%
String num = request.getParameter("num"); //num=>일련번호 얻기
BoardDTO dto =new BoardDTO();	//DTO객체생성
BoardDAO dao = new BoardDAO(application);//DAO객체 생성
dto = dao.selectView(num);//주어진 일련번호에 해당하는 기존 게시물 얻기

//로그인된 사용자 ID 얻기
String sessionId = session.getAttribute("UserId").toString();
int delResult = 0;

if(sessionId.equals(dto.getId())){//작성자가 본인인지 확인
	//작성자가 본인이면///
	dto.setNum(num);
	delResult = dao.deletePost(dto);//삭제
	dao.close();
	
	//성공.실패 처리
	if(delResult == 1){
		JSFunction.alertLocation("삭제되었습니다.","List.jsp",out); //성공시 목록페이지로 이동
	}else{
		JSFunction.alertBack("삭제에 실패하였습니다.",out);  //실패ㅣ 이전 페이지로 이동
	}
}
else{//작성자가 본인이 아니라면 이전 페이지로 이동
	JSFunction.alertBack("본인만 삭제할 수 있습니다.",out);
	return;
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DeletePorcess</title>
</head>
<body>

</body>
</html>
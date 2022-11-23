<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");//한글 깨짐 방지 코드
	String id = request.getParameter("id");
	String sex = request.getParameter("sex");
	
	//체크박스경우엔 배열형식으로 띈다 이유는 체크박스가 여러개이기 때문에 
	String favoStr = "";
	String[] favo = request.getParameterValues("favo");
	for(String fa : favo){
		favoStr += fa + ", ";
	}
	String intro = request.getParameter("intro");
%>
<!DOCTYPE html><!-- request2의 서버 -->
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<ul>
		<li><%=id %></li><%--위에 변수명을 가져온거다--%>
		<li><%=sex %></li><%--위에 변수명을 가져온거다--%>
 		<li><%=favoStr %></li> <%--위에 변수명을 가져온거다--%>
		<li><%=intro %></li><%--위에 변수명을 가져온거다--%>
	</ul>
</body>
</html>
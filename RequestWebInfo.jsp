<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    request.setCharacterEncoding("UTF-8");//한글 깨짐 방지 코드
    String eng = request.getParameter("eng");
    String han = request.getParameter("han");
    
    
    %><!-- 파라미터의 이름은 문자열이기 때문에 큰따음표를 이용한다.     -->

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>클라이언트 서버의 환경정보 읽기</h2>
	<ul>
	<li><%=eng %></li>
	<li><%=han %></li>
	<li><%=request.getRequestURL() %></li>
	<li><%=request.getRequestURI() %></li>
	<li><%=request.getRealPath("/") %></li>
	<li><%=request.getQueryString() %></li>
	</ul>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="common.Person" %> 
<%
	String requestString = (String)request.getAttribute("requestString");
	Person person = (Person)request.getAttribute("requestPerson");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>forward 방식으로 이동한 페이지입니다.</h1>
	<%=requestString %>
	<br>
	<%=person.getName() %>
	<%=person.getAge() %>
</body>
</html>
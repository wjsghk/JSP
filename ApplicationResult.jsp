<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import= "java.util.*" %>
<%@ page import= "common.Person" %>

<%
	Map<String,Person> maps =(Map<String,Person>)application.getAttribute("maps");
	Set<String> keys= maps.keySet();
	for(String key : keys){
		Person person = maps.get(key);
		out.print("이름 : " + person.getName());
		out.print(" ");
		out.print("나이 : " + person.getAge());
		out.print("<br>");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ApplicationResult=>application의 서버 부분</title>
</head>
<body>

</body>
</html>
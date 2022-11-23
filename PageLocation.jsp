<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="common.Person" %>
<%
   Object pInt = (Integer)(pageContext.getAttribute("pageInteger"));
   Object str =(String)(pageContext.getAttribute("pageString"));
   Object p = (Person)(pageContext.getAttribute("pagePerson"));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   <ul>
      <li><%=(pInt == null) ? "값 없음" : pInt %></li>   
      <li><%=(str == null) ? "값 없음" :str %></li>   
      <li><%=(str == null) ? "값 없음" :((Person)p).getName()%></li>   
   </ul>
</body>
</html>
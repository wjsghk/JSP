<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import = "java.util.Date"%>
<%@ page import ="common.Person" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL -set 1</title>
</head>
<body>

	<!--page 영역에 저장된다. -->
	<%-- <c:set></c:set> --%>     <%--<c:set /> --%>
	<c:set var="directVar" value="100" /> <!-- int directVar =100  -->
	<c:set var="elVar" value="${ directVar mod 5}" />
	<c:set var="expVar" value="<%= new Date() %>" />
	<c:set var="betweenVar">변수값 요렇게 설정</c:set>
	
	directVar : ${ pageScope.directVar } <br>
	elVar : ${ directVar } <br>
	expVar : ${ expVar } <br>
	betweenVar : ${ betweenVar } <br>
	
	<c:set var="personVar1" value='<%= new Person("이병일",29) %>' scope="request" />
	${ requestScope.personVar1.name } <br>
	${ personVar1.age } <br>
	
	<p>personVar1 변수 삭제후</p>
	
	<c:remove var="personVar1" scope="request" />
	${ requestScope.personVar1.name } <br>
	${ personVar1.age } <br>
</body>
</html>
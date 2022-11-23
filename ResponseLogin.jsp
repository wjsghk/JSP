<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    request.setCharacterEncoding("UTF-8");//한글 깨짐 방지 코드
    String id = request.getParameter("user_id");
    String pwd = request.getParameter("user_pwd");
    
    if(id.equalsIgnoreCase("must")&& pwd.equalsIgnoreCase("1234")){
    	response.sendRedirect("ResponseWelcome.jsp"); //page 보내는 코드,아이디 비번 일치하는경우
    }else{//아이비,비번이 일치하지 않을땐 request로 이동
    	response.sendRedirect("request3.jsp");
    }
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>requset3의 서버부분</title>
</head>
<body>

</body>
</html>
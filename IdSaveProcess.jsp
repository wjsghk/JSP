<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="utils.CookieManager" %>
<%@ page import="utils.JSFunction" %>

<%
	String user_id = request.getParameter("user_id");
	String user_pw = request.getParameter("user_pw");
	String save_check = request.getParameter("save_check");
	
	//로그인 성공 실패 유무
	if("must".equals(user_id) && "1234".equals(user_pw)){
		//아이디 저장 체크 유무
		if(save_check !=null && save_check.equals("Y")){
			CookieManager.makeCookie(response, "loginId", user_id, 86400);
		}else{
			CookieManager.deleteCookie(response, "loginId");
		}
		
		JSFunction.alertLocation("로그인 성공", "IdSave.jsp", out);
	}else{
		JSFunction.alertBack("로그인실패", out);	
	}
%>
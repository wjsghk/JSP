package com.nonage.controller.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class JoinFormAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	//1.DAO를 이용한 데이터 처리	
		
	//2.view페이지 지정(__.jsp)하고 페이지 이동
	String url = "/member/join.jsp";
	RequestDispatcher dispatcher=request.getRequestDispatcher(url);
	dispatcher.forward(request, response);
	}

}

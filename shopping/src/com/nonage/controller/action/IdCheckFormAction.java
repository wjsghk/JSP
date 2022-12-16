package com.nonage.controller.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nonage.dao.MemberDAO;

public class IdCheckFormAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "/member/idcheck.jsp";
		String id = request.getParameter("id").trim();
		//1.DAO를 이용한 데이터 처리
		MemberDAO memberDAO=MemberDAO.getInstance();
		int message = memberDAO.confirmID(id);
		
		request.setAttribute("message",	message);
		request.setAttribute("id",	id);
		
		//2.view페이지 지정(__.jsp)하고 페이지 이동
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}

}

package com.dh.hobbyist.payment.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dh.hobbyist.member.model.vo.Member;
import com.dh.hobbyist.payment.model.service.PaymentService;
import com.dh.hobbyist.payment.model.vo.Payment;

@WebServlet("/readyToInsert.pa")
public class ReadyToInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ReadyToInsertServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int scheduleCode = Integer.parseInt(request.getParameter("scheduleCode"));
		int memberCode = ((Member) request.getSession().getAttribute("loginMember")).getMemberCode();
		
		Payment p = new PaymentService().showPayView(scheduleCode, memberCode);
		
		String page = "";
		if(p != null) {
			page = "views/lesson/payForm.jsp";
			request.setAttribute("p", p);
		}else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "잘못된 경로로 접근 하셨습니다.");
		}
		
		request.getRequestDispatcher(page).forward(request, response);
	}	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

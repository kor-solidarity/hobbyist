package com.dh.hobbyist.payment.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dh.hobbyist.member.model.vo.Member;
import com.dh.hobbyist.payment.model.service.PaymentService;
import com.dh.hobbyist.payment.model.vo.Order;
import com.dh.hobbyist.payment.model.vo.RegisterPayment;

@WebServlet("/paymentList.me")
public class PaymentListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public PaymentListServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int memberCode = ((Member) request.getSession().getAttribute("loginMember")).getMemberCode();
		
		ArrayList<RegisterPayment> pList = new PaymentService().payList(memberCode);
		ArrayList<Order> orderList = new PaymentService().orderList(memberCode);
		
		for(int i = 0; i < pList.size(); i++) {
			pList.get(i).setStartDate(orderList.get(i).getFirstOrder());
			pList.get(i).setEndDate(orderList.get(i).getLastOrder());
			
		}
		String page = "";
		if(pList != null) {
			page = "views/member/myPage/myPayment/payLesson.jsp";
			request.setAttribute("pList", pList);
			
			request.getRequestDispatcher(page).forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

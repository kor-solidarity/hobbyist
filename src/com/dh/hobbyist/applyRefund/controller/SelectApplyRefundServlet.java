package com.dh.hobbyist.applyRefund.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dh.hobbyist.applyRefund.model.service.ApplyRefundService;
import com.dh.hobbyist.applyRefund.model.vo.ApplyRefund;
import com.dh.hobbyist.lesson.model.vo.MyRegiLesson;
import com.dh.hobbyist.member.model.vo.Member;
import com.dh.hobbyist.payment.model.service.PaymentService;
import com.dh.hobbyist.payment.model.vo.Payment;

@WebServlet("/applyRefund.me")
public class SelectApplyRefundServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SelectApplyRefundServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int paymentCode = Integer.parseInt(request.getParameter("paymentCode"));
		int memberCode = ((Member) request.getSession().getAttribute("loginMember")).getMemberCode();
		
		MyRegiLesson myReg = new ApplyRefundService().showMyReg(paymentCode, memberCode);
		
		
		ApplyRefund ap = new ApplyRefundService().showApplyRefundView(paymentCode, memberCode);
		
		String page = "";
		if(myReg != null && ap != null) {
			page = "views/member/myPage/myLesson/applyRefundForm.jsp";
			request.setAttribute("myReg", myReg);
			request.setAttribute("ap", ap);
		} else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "잘못된 경로로 접근하셨습니다.");
		}
		
		request.getRequestDispatcher(page).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

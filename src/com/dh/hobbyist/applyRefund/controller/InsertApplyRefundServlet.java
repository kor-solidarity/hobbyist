package com.dh.hobbyist.applyRefund.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dh.hobbyist.applyRefund.model.service.ApplyRefundService;
import com.dh.hobbyist.applyRefund.model.vo.ApplyRefund;
import com.dh.hobbyist.member.model.vo.Member;

@WebServlet("/insertApplyRefund.me")
public class InsertApplyRefundServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public InsertApplyRefundServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int paymentCode = Integer.parseInt(request.getParameter("paymentCode"));
		int refundCost = Integer.parseInt(request.getParameter("refundCost"));
		String reason = request.getParameter("selectReason");
		String reasonDetail = request.getParameter("refundDetail");
		int memberCode = ((Member) request.getSession().getAttribute("loginMember")).getMemberCode();
		
		ApplyRefund arf = new ApplyRefund();
		
		arf.setPaymentCode(paymentCode);
		arf.setRefundCost(refundCost);
		arf.setReason(reason);
		arf.setReasonDetail(reasonDetail);
		arf.setMemberCode(memberCode);
		
		int result = new ApplyRefundService().insertApplyRefund(arf);
		
		String page = "";
		if(result > 0) {
			page = "selectMyRegi.le";
		}else {
			page="views/common/errorPage.jsp";
			request.setAttribute("msg", "환불신청이 정상적으로 완료되지 않았습니다.");
		}
		
		request.getRequestDispatcher(page).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

package com.dh.hobbyist.refund.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dh.hobbyist.refund.model.service.RefundService;
import com.dh.hobbyist.refund.model.vo.Refund;

@WebServlet("/approveRefund.ad")
public class ApproveRefundServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ApproveRefundServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int num = Integer.parseInt(request.getParameter("num"));
		int refundCost = Integer.parseInt(request.getParameter("refundCost"));
		int refundPoint = Integer.parseInt(request.getParameter("refundPoint"));
		int reCollectPoint = Integer.parseInt(request.getParameter("reCollectPoint"));
		
		Refund r = new Refund();
		
		r.setPayCode(num);
		r.setRefundCost(refundCost);
		r.setRefundPoint(refundPoint);
		r.setGivePoint(reCollectPoint);
		
		int result = new RefundService().approveRefund(r);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

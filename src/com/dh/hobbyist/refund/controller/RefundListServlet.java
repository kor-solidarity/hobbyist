package com.dh.hobbyist.refund.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dh.hobbyist.member.model.vo.Member;
import com.dh.hobbyist.refund.model.service.RefundService;
import com.dh.hobbyist.refund.model.vo.Refund;

@WebServlet("/refundList.me")
public class RefundListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public RefundListServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int memberCode = ((Member) request.getSession().getAttribute("loginMember")).getMemberCode();
		
		ArrayList<Refund> rList = new RefundService().refundList(memberCode);
		
		String page = "";
		if(rList != null) {
			page = "views/member/myPage/myPayment/refundLesson.jsp";
			request.setAttribute("rList", rList);
			
			request.getRequestDispatcher(page).forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

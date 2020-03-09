package com.dh.hobbyist.payment.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dh.hobbyist.lesson.model.vo.MyRegiLesson;
import com.dh.hobbyist.member.model.vo.Member;
import com.dh.hobbyist.payment.model.service.PaymentService;

@WebServlet("/paymentList.me")
public class PaymentListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public PaymentListServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int memberCode = ((Member) request.getSession().getAttribute("loginMember")).getMemberCode();
		
		ArrayList<MyRegiLesson> pList = new ArrayList<MyRegiLesson>();
		
		
		pList = new PaymentService().payList(memberCode);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

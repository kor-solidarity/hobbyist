package com.dh.hobbyist.payment.controller;

import java.io.IOException;
import java.sql.Timestamp;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dh.hobbyist.payment.model.service.PaymentService;
import com.dh.hobbyist.payment.model.vo.Payment;
import com.google.gson.Gson;

@WebServlet("/payment.pa")
public class PaymentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public PaymentServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int scheduleCode = Integer.parseInt(request.getParameter("scheduleCode"));
		int mCode = Integer.parseInt(request.getParameter("memberCode"));
		String impUid = request.getParameter("impUid");
		int price = Integer.parseInt(request.getParameter("price"));
		int usingPoint = Integer.parseInt(request.getParameter("usingPoint"));
		int givePoint = Integer.parseInt(request.getParameter("givePoint"));
		int artistCode = Integer.parseInt(request.getParameter("artistCode"));
		
		Payment p = new Payment();
		
		p.setMemberCode(mCode);
		p.setImpNum(impUid);
		p.setPayCost(price);
		p.setArtistCode(artistCode);
		p.setScheduleCode(scheduleCode);
		p.setUsingPoint(usingPoint);
		p.setGivePoint(givePoint);
		p.setPayDate(new Timestamp(System.currentTimeMillis()));
		
		System.out.println(p);
		int result = new PaymentService().insertPayment(p);
		
		String page = "";
		if(result > 0) {
			page = "views/common/successPage.jsp";
		}else {
			page = "views/common/errorPage.jsp";
		}
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		new Gson().toJson(page, response.getWriter());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

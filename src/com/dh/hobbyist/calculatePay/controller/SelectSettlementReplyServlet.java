package com.dh.hobbyist.calculatePay.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dh.hobbyist.calculatePay.model.service.CalculatePayService;
import com.dh.hobbyist.calculatePay.model.vo.PaySettlement;
import com.dh.hobbyist.calculatePay.model.vo.SettlementInquiry;
import com.google.gson.Gson;

/**
 * Servlet implementation class SelectSettlementReplyServlet
 */
@WebServlet("/selectSettlementReply.cp")
public class SelectSettlementReplyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectSettlementReplyServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int settleCode = Integer.parseInt(request.getParameter("code"));
		
		List<SettlementInquiry> inquiryList = new CalculatePayService().selectSettlementInquiryList(settleCode);
		
		PaySettlement ps = new CalculatePayService().selectOnePaySettlement(settleCode);
		
		Map<String, Object> calculationInfo = new HashMap<>();
		
		calculationInfo.put("paySettlement", ps);
		calculationInfo.put("inquiryList", inquiryList);
		
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		
		new Gson().toJson(calculationInfo, response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

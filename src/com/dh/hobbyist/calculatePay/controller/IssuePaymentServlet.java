package com.dh.hobbyist.calculatePay.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dh.hobbyist.calculatePay.model.service.CalculatePayService;
import com.dh.hobbyist.calculatePay.model.vo.PaySettlement;
import com.google.gson.Gson;

/**
 * Servlet implementation class IssuePaymentServlet
 */
@WebServlet("/issuePayment.cp")
public class IssuePaymentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public IssuePaymentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int settleCode = Integer.parseInt(request.getParameter("code"));
		
		PaySettlement ps = new CalculatePayService().selectOnePaySettlement(settleCode);
		Date settleDate = new CalculatePayService().selectSettleDate(settleCode);
		
		Map<String, Object> settleInfo = new HashMap<>();
		
		settleInfo.put("paySettlement", ps);
		settleInfo.put("settleDate", settleDate);
		
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		
		new Gson().toJson(settleInfo, response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

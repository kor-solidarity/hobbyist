package com.dh.hobbyist.calculatePay.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dh.hobbyist.calculatePay.model.service.CalculatePayService;
import com.dh.hobbyist.calculatePay.model.vo.Accounts;
import com.dh.hobbyist.calculatePay.model.vo.Settlement;

/**
 * Servlet implementation class CalculatePayServlet
 */
@WebServlet("/calculate.cp")
public class CalculatePayServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CalculatePayServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<Accounts> list = new CalculatePayService().selectPayList();
		
		for(int i = 0; i < list.size(); i++) {
			System.out.println(list.get(i));
		}
		
		ArrayList<Settlement> settleList = new CalculatePayService().selectSettlementList();
		
		System.out.println("settleList : " + settleList);
		
		//int result = new CalculatePayService().insertPayment(list, settleList);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

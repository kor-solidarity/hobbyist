package com.dh.hobbyist.applyRefund.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dh.hobbyist.applyRefund.model.service.ApplyRefundService;
import com.dh.hobbyist.applyRefund.model.vo.ApplyRefund;
import com.google.gson.Gson;

@WebServlet("/selectApplyDetail.re")
public class SelectApplyDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SelectApplyDetailServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int num = Integer.parseInt(request.getParameter("num"));
		
		ApplyRefund arf = new ApplyRefundService().selectDetail(num);
		
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		new Gson().toJson(arf, response.getWriter());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

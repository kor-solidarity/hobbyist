package com.dh.hobbyist.refund.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dh.hobbyist.refund.model.service.RefundService;
import com.dh.hobbyist.refund.model.vo.Refund;

@WebServlet("/selectList.re")
public class SelectRefundListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SelectRefundListServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<Refund> refundList = new RefundService().selectList();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

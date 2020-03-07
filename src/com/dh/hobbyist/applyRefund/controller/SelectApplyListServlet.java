package com.dh.hobbyist.applyRefund.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dh.hobbyist.applyRefund.model.service.ApplyRefundService;
import com.dh.hobbyist.applyRefund.model.vo.ApplyRefund;
import com.google.gson.Gson;

@WebServlet("/selectApplyList.ad")
public class SelectApplyListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SelectApplyListServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<ApplyRefund> applyList = new ApplyRefundService().selectList();
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		new Gson().toJson(applyList, response.getWriter());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

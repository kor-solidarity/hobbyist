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

@WebServlet("/selectRefuseList.ad")
public class SelectRefuseListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SelectRefuseListServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<ApplyRefund> applyList = new ApplyRefundService().selectRefuseList();
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		new Gson().toJson(applyList, response.getWriter());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

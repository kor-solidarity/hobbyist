package com.dh.hobbyist.applyRefund.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dh.hobbyist.applyRefund.model.service.ApplyRefundService;

@WebServlet("/refuseRefund.re")
public class refuseRefundServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public refuseRefundServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int num = Integer.parseInt(request.getParameter("refundCode"));
		String reasonDetail = request.getParameter("reasonDetail");
		
		System.out.println(num);
		System.out.println(reasonDetail);
		
		int result = new ApplyRefundService().refuseRefund(num, reasonDetail);
		
		String page = "";
		if(result > 0) {
			page = "views/common/adminSuccessPage.jsp";
			request.setAttribute("successCode", "refuseRefund");
		}else {
			page = "views/common/adminErrorPage.jsp";
			request.setAttribute("msg", "반려가 정상적으로 이루어지지 않았습니다.");
		}
		
		request.getRequestDispatcher(page).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

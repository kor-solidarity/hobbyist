package com.dh.hobbyist.calculatePay.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dh.hobbyist.admin.model.vo.Admin;
import com.dh.hobbyist.calculatePay.model.service.CalculatePayService;
import com.dh.hobbyist.calculatePay.model.vo.SettlementInquiry;

/**
 * Servlet implementation class InsertAdminReplyServlet
 */
@WebServlet("/insertAdminReply.cp")
public class InsertAdminReplyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertAdminReplyServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int adminCode = ((Admin) request.getSession().getAttribute("loginAdmin")).getAdminCode();
		int settleCode = Integer.parseInt(request.getParameter("hideSetCode"));
		String content = request.getParameter("adminText");
				
		SettlementInquiry si = new SettlementInquiry();
		si.setAdminCode(adminCode);
		si.setSettlementCode(settleCode);
		si.setContent(content);
		
		int result = new CalculatePayService().insertAdminReply(si);
		
		if(result > 0) {
			response.sendRedirect("/hobbyist/calculate.cp");
		} else {
			request.setAttribute("msg", "수정 요청 실패");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

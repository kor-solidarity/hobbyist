package com.dh.hobbyist.calculatePay.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dh.hobbyist.calculatePay.model.service.CalculatePayService;

/**
 * Servlet implementation class UpdateConfirmStatusServlet
 */
@WebServlet("/updateConfirmStatus.cp")
public class UpdateConfirmStatusServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateConfirmStatusServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int settleCode = Integer.parseInt(request.getParameter("code"));
		
		System.out.println("settleCode : " + settleCode);
		
		int result = new CalculatePayService().updateConfirmStatus(settleCode);
		
		if(result > 0) {
			response.sendRedirect("/hobbyist/selectMycalculationList.cp");
		} else {
			request.setAttribute("msg", "정산 확정 실패");
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

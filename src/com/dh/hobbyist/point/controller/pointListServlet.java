package com.dh.hobbyist.point.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dh.hobbyist.member.model.vo.Member;
import com.dh.hobbyist.point.model.service.PointService;
import com.dh.hobbyist.point.model.vo.Point;

@WebServlet("/pointList.me")
public class pointListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public pointListServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int memberCode = ((Member) request.getSession().getAttribute("loginMember")).getMemberCode();
		
		ArrayList<Point> pointList = new PointService().PointList(memberCode);
		
		String page = "";
		if(pointList != null) {
			page = "views/member/myPage/myPayment/pointLesson.jsp";
			request.setAttribute("pointList", pointList);
			
			request.getRequestDispatcher(page).forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

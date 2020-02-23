package com.dh.hobbyist.artist.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dh.hobbyist.artist.model.service.ArtistAdminService;
import com.dh.hobbyist.artist.model.vo.ApplyArtist;

/**
 * Servlet implementation class ApprovalListServlet
 */
@WebServlet("/approvalList.ar")
public class ApprovalListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ApprovalListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<ApplyArtist> list = new ArtistAdminService().selectApplyList();
	
		//System.out.println(list);
		
		String page = "";
		if(list != null) {
			page = "views/admin/memberMgmt/artistApproval.jsp";
			request.setAttribute("applyList", list);
		} else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "아티스트신청내역 조회 실패");
		}
		
		request.getRequestDispatcher(page).forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

package com.dh.hobbyist.suggest.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dh.hobbyist.member.model.vo.Member;
import com.dh.hobbyist.suggest.model.service.SuggestService;
import com.dh.hobbyist.suggest.model.vo.PageInfo;
import com.dh.hobbyist.suggest.model.vo.PetitionWishList;

/**
 * Servlet implementation class SelectMyWishListServlet
 */
@WebServlet("/selectMyWishList.sg")
public class SelectMyWishListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectMyWishListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int memberCode = ((Member) request.getSession().getAttribute("loginMember")).getMemberCode();
		
		int currentPage;
		int limit;
		int maxPage;
		int startPage;
		int endPage;
		
		currentPage = 1;
		
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		limit = 12;
		
		SuggestService ss = new SuggestService();
		int listCount = ss.getMyWishListCount(memberCode);
		
		maxPage = (int) ((double) listCount / limit + 0.9);
		
		startPage = (((int) ((double) currentPage / 10 + 0.9)) - 1) * 10 + 1;
		
		endPage = startPage + 10 - 1;
		
		if(maxPage < endPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(currentPage, listCount, limit, maxPage, startPage, endPage);
		
		//ArrayList<PetitionWishList> list = ss.selectMyWishList(memberCode, pi);
		
//		String page = "";
//		if(list != null) {
//			page = "views/member/myPage/myLesson/likedSuggestion.jsp";
//			request.setAttribute("myWishList", list);
//			request.setAttribute("pi", pi);
//		} else {
//			page = "views/common/errorPage.jsp";
//			request.setAttribute("msg", "마이페이지 찜한 건의 조회 실패");
//		}
//		
//		request.getRequestDispatcher(page).forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

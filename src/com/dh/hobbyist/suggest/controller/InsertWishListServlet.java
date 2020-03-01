package com.dh.hobbyist.suggest.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import com.dh.hobbyist.member.model.service.MemberService;
import com.dh.hobbyist.member.model.vo.Member;
import com.dh.hobbyist.suggest.model.service.SuggestService;
import com.dh.hobbyist.suggest.model.vo.PetitionWishList;
import com.google.gson.Gson;

/**
 * Servlet implementation class InsertWishListServlet
 */
@WebServlet("/insertWishList.sg")
public class InsertWishListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertWishListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int petitionCode = Integer.parseInt(request.getParameter("pid"));
		int memberCode = ((Member) request.getSession().getAttribute("loginMember")).getMemberCode();
		int index = Integer.parseInt(request.getParameter("index"));
		
		int result = 0;
		
		if(index % 2 == 0) {
			result = new SuggestService().insertWishList(petitionCode, memberCode);
		} else {
			result = new SuggestService().deleteWishList(petitionCode, memberCode);
		}
		
		if(result > 0) {
			HttpSession session = request.getSession();
			session.removeAttribute("petitionWishList");
			
			ArrayList<PetitionWishList> list = new MemberService().selectPetitionWishList(memberCode); 
			session.setAttribute("petitionWishList", list);
		}
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		
		new Gson().toJson(result, response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

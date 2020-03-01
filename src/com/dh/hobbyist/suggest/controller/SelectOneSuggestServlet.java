package com.dh.hobbyist.suggest.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dh.hobbyist.member.model.vo.Member;
import com.dh.hobbyist.suggest.model.service.SuggestService;
import com.dh.hobbyist.suggest.model.vo.Petition;
import com.dh.hobbyist.suggest.model.vo.Reply;

/**
 * Servlet implementation class SelectOneSuggestServlet
 */
@WebServlet("/selectOne.sg")
public class SelectOneSuggestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectOneSuggestServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int num = Integer.parseInt(request.getParameter("num"));
		
		Petition p = new SuggestService().selectOne(num);
		
		//System.out.println("petition detail : " + p);
		List<Reply> replyList = new SuggestService().selectReplyList(num);
		
		String page = "";
		
		if(p != null) {
			page = "views/suggest/suggestDetail.jsp";
			request.setAttribute("petition", p);
			request.setAttribute("replyList", replyList);
		} else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "건의 게시판 상세 조회 실패");
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

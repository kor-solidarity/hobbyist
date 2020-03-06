package com.dh.hobbyist.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dh.hobbyist.artist.model.vo.ApplyArtist;
import com.dh.hobbyist.common.model.vo.Image;
import com.dh.hobbyist.member.model.service.MemberService;
import com.dh.hobbyist.member.model.vo.Member;

/**
 * Servlet implementation class MyPageServlet
 */
@WebServlet("/myPage.me")
public class MyPageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyPageServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getSession().getAttribute("loginMember") != null) {
			
			int memberCode = ((Member) request.getSession().getAttribute("loginMember")).getMemberCode();
			String nick = ((Member) request.getSession().getAttribute("loginMember")).getArtistNick();
			
			String imageRoot = new MemberService().selectImageRoot(memberCode);
			
			ApplyArtist aa = new ApplyArtist();
			if(nick != null) {
				aa = new MemberService().selectOneApplyArtist(memberCode);
			}
			
			
			String page = "";
			
			
			//page = "views/common/myPage.jsp";
			/*request.setAttribute("imageRoot", imageRoot);
		request.setAttribute("applyArtist", aa);
		
		request.getRequestDispatcher(page).forward(request, response);*/
			
			page = "selectMyRegi.le";
			
			HttpSession session = request.getSession();
			session.setAttribute("imageRoot", imageRoot);
			session.setAttribute("applyArtist", aa);
			response.sendRedirect(page);
		} else {
			//request.setAttribute("msg", "로그인이 필요합니다");
			//request.getRequestDispatcher("/views/common/errorPage.jsp").forward(request, response);
			String page = "views/common/successPage.jsp";
			request.setAttribute("successCode", "withoutLogin");
			request.getRequestDispatcher(page).forward(request, response);
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

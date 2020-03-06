package com.dh.hobbyist.memberUpdate.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dh.hobbyist.memberUpdate.model.service.MemberService;
import com.dh.hobbyist.memberUpdate.model.vo.Member;

/**
 * Servlet implementation class pwConfirmServlet
 */
@WebServlet("/pwConfirm.me")
public class pwConfirmServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public pwConfirmServlet() {
        super();
      
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	String memberPwd = request.getParameter("memberPwd");
	
	
	
	System.out.println("pwConfirm 서블릿" + memberPwd);
	
	
	int loginMember = new MemberService().pwCheck(memberPwd);
	
	System.out.println("pwCheck: "+ loginMember);
	
/*	if(memberPwd != null) {
		HttpSession session = request.getSession();
		System.out.println("세션후 로그인시" + memberPwd);
		
		
		session.setAttribute("pwCheck", loginMember);
		
		response.sendRedirect("views/member/myPage/configuration/memberPassword.jsp");
	}		*/
	
	
	if(loginMember >0) {
		response.sendRedirect("views/member/myPage/configuration/memberUpdate.jsp");
	
	}else {
		
		response.sendRedirect("views/member/myPage/configuration/memberPassword.jsp");
		
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

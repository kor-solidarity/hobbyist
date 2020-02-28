package com.dh.hobbyist.memberUpdate.controller;

import java.io.IOException;
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
		
	Member member = new Member();
	member.setMemberPwd(memberPwd);	
	
	Member loginMember = new MemberService().pwCheck(member);
	
	System.out.println("pwCheck: "+ loginMember);
	
	if(loginMember != null) {
		HttpSession session = request.getSession();
		session.setAttribute("pwCheck", loginMember);
		if(loginMember.getFirstLogin() ==0) {
		response.sendRedirect("/views/member/myPage/configuration/memberPassword.jsp");
		int result = new MemberService().pwCheck(loginMember);
	}else {
		response.sendRedirect("index.jsp");
	}
	}else {
		response.setContentType("text/hmtl; charset=UTF-8");
		PrtintWriter out = response.getWriter();
		
		out.println("<script>alert('아이디나 비밀번호를 확인 후 다시 시도해주세요.');location.href='views/member/myPage/configuration/memberPassword.jsp';</script>");
		out.flush();
		out.close();
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

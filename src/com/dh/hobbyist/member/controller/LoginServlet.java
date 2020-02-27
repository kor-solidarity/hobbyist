package com.dh.hobbyist.member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dh.hobbyist.member.model.service.MemberService;
import com.dh.hobbyist.member.model.vo.Member;


@WebServlet("/login.me")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public LoginServlet() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String memberId = request.getParameter("memberId");
		String memberPwd = request.getParameter("memberPwd");
		
		/*System.out.println("memberId : " + memberId);
		System.out.println("memberPwd : " + memberPwd);*/
		
		Member member = new Member();
		member.setMemberId(memberId);
		member.setMemberPwd(memberPwd);
		
		Member loginMember = new MemberService().loginCheck(member);
		
		System.out.println("loginMember : " + loginMember);
		
		System.out.println("first login : " + loginMember.getFirstLogin());
		
		if(loginMember != null) {
			HttpSession session = request.getSession();
			session.setAttribute("loginMember", loginMember);
			if(loginMember.getFirstLogin() == 0) {
				response.sendRedirect("views/member/firstLogin.jsp");
				int result = new MemberService().loginCount(member);
			}else {
				response.sendRedirect("index.jsp");
			}
			
			
		}else {
			
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			
			out.println("<script>alert('아이디나 비밀번호를 확인 후 다시 시도해주세요.');location.href='views/member/loginForm.jsp';</script>");
			out.flush();
			out.close();
		}
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

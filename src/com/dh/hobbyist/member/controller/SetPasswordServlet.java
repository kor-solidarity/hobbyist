package com.dh.hobbyist.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dh.hobbyist.member.model.service.MemberService;


@WebServlet("/setPwd.me")
public class SetPasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public SetPasswordServlet() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String memberPwd = request.getParameter("memberPwd");
		String memberId = request.getParameter("memberId");
		
		System.out.println("(setPwd) Id : " + memberId);
		
		int result = new MemberService().setPassword(memberPwd, memberId);
		
		String page = "";
		if(result > 0) {
			page = "views/member/successSetPwd.jsp";
			
		}else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "비밀번호 재설정에 실패하셨습니다.");
		}
		request.getRequestDispatcher(page).forward(request, response);
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

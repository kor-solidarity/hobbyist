package com.dh.hobbyist.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dh.hobbyist.member.model.service.MemberService;
import com.dh.hobbyist.member.model.vo.Member;


@WebServlet("/category.me")
public class MemberCategoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public MemberCategoryServlet() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int memberCode = ((Member) request.getSession().getAttribute("loginMember")).getMemberCode();
		int categoryCode = Integer.parseInt(request.getParameter("categoryCode"));
		
		System.out.println("membetCode : " + memberCode);
		System.out.println("memberCategory : " + categoryCode);
		
		int result = new MemberService().insertCategory(memberCode, categoryCode);
		
		Member member = new Member();
		member.setMemberCode(memberCode);
		
		String page = "";
		if(result > 0) {
			page = "views/common/successPage.jsp";
			request.setAttribute("successCode", "insertCategory");
			int result2 = new MemberService().loginCount(member);
			if(result2 > 0) {
				System.out.println("first login : " + member.getFirstLogin());
			}
			
		}else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "관심 카테고리 설정에 실패했습니다.");
		}
		request.getRequestDispatcher(page).forward(request, response);
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

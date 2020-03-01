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
public class InsertCategoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public InsertCategoryServlet() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int memberCode = ((Member) request.getSession().getAttribute("loginMember")).getMemberCode();
		
		String cateCode1 = request.getParameter("categoryCode1");
		String cateCode2 = request.getParameter("categoryCode2");
		String cateCode3 = request.getParameter("categoryCode3");
		
		int categoryCode1 = Integer.parseInt(cateCode1);
		int categoryCode2 = Integer.parseInt(cateCode2);
		int categoryCode3 = Integer.parseInt(cateCode3);
		
		int[] categoryCodes = {categoryCode1, categoryCode2, categoryCode3};
		
		System.out.println("membetCode : " + memberCode);
		/*System.out.println("categoryCode1 : " + categoryCode1);
		System.out.println("categoryCode2 : " + categoryCode2);
		System.out.println("categoryCode3 : " + categoryCode3);*/
		System.out.println("memberCategory : " + categoryCodes);
		
		int result = new MemberService().insertCategory(memberCode, categoryCodes);
		
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

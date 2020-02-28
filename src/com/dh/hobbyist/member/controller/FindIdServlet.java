package com.dh.hobbyist.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dh.hobbyist.member.model.service.MemberService;
import com.dh.hobbyist.member.model.vo.Member;


@WebServlet("/findId.me")
public class FindIdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public FindIdServlet() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String memberName = request.getParameter("memberName");
		String tel1 = request.getParameter("tel1");
		String tel2 = request.getParameter("tel2");
		String tel3 = request.getParameter("tel3");
		
		String phone = tel1 + "-" + tel2 + "-" + tel3;
		
		/*System.out.println("(find Id) name : " + name);
		System.out.println("(find Id) phone : " + phone);*/
		
		Member member = new Member();
		member.setMemberName(memberName);
		member.setPhone(phone);
		
		Member findMember = new MemberService().findId(member);
		
		
		if(findMember != null) {
			HttpSession session = request.getSession();
			session.setAttribute("findMember", findMember);
			response.sendRedirect("views/member/successFindId.jsp");
		}else {
			request.getRequestDispatcher("views/member/failedFindId.jsp").forward(request, response);
		}
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

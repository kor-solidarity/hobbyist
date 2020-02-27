package com.dh.hobbyist.memberUpdate.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dh.hobbyist.memberUpdate.model.service.MemberService;
import com.dh.hobbyist.memberUpdate.model.vo.Member;

/**
 * Servlet implementation class memberUpdateServletM
 */
@WebServlet("/UpdateMemberM.me")
public class memberUpdateServletM extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public memberUpdateServletM() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	String textId = request.getParameter("userId");
	String password1 = request.getParameter("password1");
	String password2 = request.getParameter("password2");
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	String email2 = request.getParameter("email2");
	String bank = request.getParameter("bank");
	String bankText = request.getParameter("bankText");

	System.out.println("userId" + textId);
	System.out.println("password1" + password1);
	System.out.println("password2"+ password2);
	System.out.println("name" + name);
	System.out.println("email" + email);
	System.out.println("email2" + email2);
	System.out.println("bank" + bank);
	System.out.println("bankText" + bankText);
	
	Member member = new Member();
	member.setMemberId(textId);
	member.setMemberPwd(password1);
	member.setMemberPwd(password2);
	member.setMemberName(name);
	member.setEmail(email);
	member.setEmail(email2);
	member.setBankName(bank);
	member.setBankNum(bankText);
	
	int result = new MemberService().memberUpdate(member);
	
	String page = "";
	if(result >0) {
		page = request.getContextPath() + "";
		response.sendRedirect(page);
	}else {
		request.setAttribute("msg", "게시판 작성 실패!");
		request.getRequestDispatcher("").forward(request, response);
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

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
	String userId = request.getParameter("userId");
	String userPwd = request.getParameter("userPwd");
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	String tel1 = request.getParameter("tel1");
	String tel2 = request.getParameter("tel2");
	String tel3 = request.getParameter("tel3");
	String phone = tel1 + "-" + tel2 + "-" + tel3;
	String bankName = request.getParameter("bankName");
	String bankNum = request.getParameter("bankNum");

	System.out.println("userId" + userId);
	System.out.println("password1" + userPwd);
	System.out.println("name" + name);
	System.out.println("email" + email);
	System.out.println("phone" + phone);
	System.out.println("bank" + bankName);
	System.out.println("bankText" + bankNum);
	
	Member member = new Member();
	member.setMemberId(userId);
	member.setMemberPwd(userPwd);
	member.setMemberName(name);
	member.setEmail(email);
	member.setPhone(phone);
	member.setBankName(bankName);
	member.setBankNum(bankNum);
	
	int result = new MemberService().memberUpdate(member);
	
	String page="";
	if(result >0) {
		page = "/views/common/successPage.jsp";
		request.setAttribute("successCode", "updateMember");
	}else {
		page = "/views/common/errorPage.jsp";
		request.setAttribute("msg", "회원정보 수정 실패!!");
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

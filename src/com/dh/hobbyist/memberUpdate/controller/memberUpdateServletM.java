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
	String nickName = request.getParameter("nickName");
	String email = request.getParameter("email");
	String tel1 = request.getParameter("tel1");
	String tel2 = request.getParameter("tel2");
	String tel3 = request.getParameter("tel3");
	String phone = tel1 + "-" + tel2 + "-" + tel3;
	String bankName = request.getParameter("bankName");
	String bankNum = request.getParameter("bankNum");

	System.out.println("서블릿 userId:" + userId);
	System.out.println("서블릿 password1:" + userPwd);
	System.out.println("서블릿 nickName:" + nickName);
	System.out.println("서블릿 email:" + email);
	System.out.println("서블릿 phone:" + phone);
	System.out.println("서블릿 bank:" + bankName);
	System.out.println("서블릿 bankText:" + bankNum);
	
	Member member = new Member();
	member.setMemberId(userId);
	member.setMemberPwd(userPwd);
	member.setMemberName(nickName);
	member.setEmail(email);
	member.setPhone(phone);
	member.setBankName(bankName);
	member.setBankNum(bankNum);
	
	int result = new MemberService().memberUpdate(member);
	
	System.out.println("set에 담고 userId" + userId);
	System.out.println("set에 담고 password1" + userPwd);
	System.out.println("set에 담고 ncikName" + nickName);
	System.out.println("set에 담고 email" + email);
	System.out.println("set에 담고 phone" + phone);
	System.out.println("set에 담고 bank" + bankName);
	System.out.println("set에 담고 bankText" + bankNum);
	
	String page="";
	if(result >0) {
		page = "/views/common/successPage.jsp";
		request.setAttribute("successCode", "updateMember");
		System.out.println("성공시 userId" + userId);
		System.out.println("성공시 password1" + userPwd);
		System.out.println("성공시 ncikName" + nickName);
		System.out.println("성공시 email" + email);
		System.out.println("성공시 phone" + phone);
		System.out.println("성공시 bank" + bankName);
		System.out.println("성공시 bankText" + bankNum);
	}else {
		page = "/views/common/errorPage.jsp";
		request.setAttribute("msg", "회원정보 수정 실패!!");
		System.out.println("실패시 userId:" + userId);
		System.out.println("실패시 password1:" + userPwd);
		System.out.println("실패시 nickName:" + nickName);
		System.out.println("실패시 email:" + email);
		System.out.println("실패시 phone:" + phone);
		System.out.println("실패시 bank:" + bankName);
		System.out.println("실패시 bankText:" + bankNum);
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

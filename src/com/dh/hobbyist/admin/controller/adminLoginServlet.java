package com.dh.hobbyist.admin.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dh.hobbyist.admin.model.service.AdminService;
import com.dh.hobbyist.admin.model.vo.Admin;
import com.dh.hobbyist.member.model.service.MemberService;
import com.dh.hobbyist.member.model.vo.Member;

@WebServlet("/login.ad")
public class adminLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public adminLoginServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String adminId = request.getParameter("adminId");
		String adminPwd = request.getParameter("adminPwd");
		
		Admin admin = new Admin();
		admin.setAdminId(adminId);
		admin.setAdminPwd(adminPwd);
		
		Admin loginAdmin = new AdminService().loginCheck(admin);
		
		String page = "";
		if(loginAdmin != null) {
			HttpSession session = request.getSession();
			session.setAttribute("loginAdmin", loginAdmin);
			
			List<Member> memberList = new MemberService().selectList();
			
			//회원리스트를 바로 가져오기 위한 메소드
			if(memberList != null) {
				page = "views/admin/memberMgmt/memberList.jsp";
				request.setAttribute("list", memberList);
				
			}else {
				page = "views/common/errorPage.jsp";
				request.setAttribute("msg", "회원정보를 로드 할 수 없습니다.");
			}
			
			
		}else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "로그인에 실패하셨습니다.");
		}
		request.getRequestDispatcher(page).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

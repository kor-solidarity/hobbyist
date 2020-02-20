package com.dh.hobbyist.admin.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dh.hobbyist.admin.model.service.AdminService;
import com.dh.hobbyist.admin.model.vo.Admin;
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
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

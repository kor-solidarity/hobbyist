package com.dh.hobbyist.member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dh.hobbyist.member.model.service.MemberService;


@WebServlet("/phoneCheck.me")
public class PhoneCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public PhoneCheckServlet() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String tel1 = request.getParameter("tel1");
		String tel2 = request.getParameter("tel2");
		String tel3 = request.getParameter("tel3");
		
		String phone = tel1 + "-" + tel2 + "-" + tel3;
		
		System.out.println("(Phone Check) phone : " + phone);
		
		int result = new MemberService().phoneCheck(phone);
		
		
		String text = "";
		if(result > 0) {
			text = "fail";
		}else {
			text = "success";
		}
		
		PrintWriter out = response.getWriter();
		out.print(text);
		out.flush();
		out.close();
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

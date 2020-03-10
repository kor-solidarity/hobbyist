package com.dh.hobbyist.review.controller;

import com.dh.hobbyist.member.model.vo.Member;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "ReviewInsertServlet", urlPatterns = "/mypage/insertReview.me")
public class ReviewInsertServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int lesson_pk = Integer.parseInt(request.getParameter("lesson_pk"));
		int stars = Integer.parseInt(request.getParameter("stars"));
		String rv_content = request.getParameter("rv_content");
		
		System.out.println("lesson_pk : " + lesson_pk);
		System.out.println("stars : " + stars);
		System.out.println("rv_content : " + rv_content);
		Member currentMember = (Member)(request.getSession().getAttribute("loginMember"));
		
		System.out.println("currentMember: " + currentMember);
	}
}

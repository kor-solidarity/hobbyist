package com.dh.hobbyist.lesson.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dh.hobbyist.common.model.vo.PageInfo;
import com.dh.hobbyist.lesson.model.service.LessonService;
import com.dh.hobbyist.member.model.vo.Member;
import com.google.gson.Gson;


@WebServlet("/selectInterest.le")
public class SelectInterestedLessonServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public SelectInterestedLessonServlet() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int memberCode = ((Member) request.getSession().getAttribute("loginMember")).getMemberCode();
		
		/*int currentPage;
		int limit;
		int maxPage;
		int startPage;
		int endPage;
		
		currentPage = 1;
		
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		limit = 9;
		
		LessonService ls = new LessonService();
		int listCount = ls.getListCount();
		
		System.out.println("list Count: " + listCount);
		
		maxPage = (int) ((double) listCount / limit + 0.9);
		
		startPage = (((int) ((double) currentPage / 10 + 0.9)) - 1) * 10 + 1;
		
		endPage = startPage + 10 - 1;
		
		if(maxPage < endPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(currentPage, listCount, limit, maxPage, startPage, endPage);*/
		
		ArrayList<HashMap<String, Object>> list = new LessonService().selectInterest(memberCode);
		
		System.out.println("list : " + list);
		
		
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		
		new Gson().toJson(list, response.getWriter());
		/*new Gson().toJson(pi, response.getWriter());*/
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

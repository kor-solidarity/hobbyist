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


@WebServlet("/selectLife.le")
public class SelectCategoryLifeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public SelectCategoryLifeServlet() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int parentCode = 20;
		
		int currentPage;
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
		int listCount = ls.getListCount(parentCode);
		
		System.out.println("list Count: " + listCount);
		
		maxPage = (int) ((double) listCount / limit + 0.9);
		
		startPage = (((int) ((double) currentPage / 10 + 0.9)) - 1) * 10 + 1;
		
		endPage = startPage + 10 - 1;
		
		if(maxPage < endPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(currentPage, listCount, limit, maxPage, startPage, endPage);
		
		ArrayList<HashMap<String, Object>> list = new LessonService().selectCategoryLife(pi);
		
		System.out.println("list : " + list);
		
		String page = "";
		if(list != null) {
			page = "views/lesson/categoryLifePage.jsp";
			request.setAttribute("list", list);
			request.setAttribute("pi", pi);
		} else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "라이프스타일 카테고리 페이지 조회 실패");
		}
		
		request.getRequestDispatcher(page).forward(request, response);
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

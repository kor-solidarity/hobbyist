package com.dh.hobbyist.lesson.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dh.hobbyist.lesson.model.service.LessonService;


@WebServlet("/selectSports.le")
public class SelectCategorySportsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public SelectCategorySportsServlet() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ArrayList<HashMap<String, Object>> list = new LessonService().selectCategorySports();
		
		/*System.out.println(list);*/
		
		String page = "";
		if(list != null) {
			page = "views/lesson/categorySportsPage.jsp";
			request.setAttribute("list", list);
		} else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "스포츠 카테고리 페이지 조회 실패");
		}
		
		request.getRequestDispatcher(page).forward(request, response);
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

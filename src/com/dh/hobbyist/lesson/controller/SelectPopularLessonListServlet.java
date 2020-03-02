package com.dh.hobbyist.lesson.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map.Entry;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dh.hobbyist.lesson.model.service.LessonService;
import com.dh.hobbyist.suggest.model.vo.Category;


@WebServlet("/selectPopular.le")
public class SelectPopularLessonListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public SelectPopularLessonListServlet() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ArrayList<HashMap<String, Object>> list = new LessonService().selectPopularLessonList();
		
		String page = "";
		if(list != null) {
			page = "/index.jsp";
		}else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "카테고리별 수업 리스트 조회 실패 ");
		}
		
		request.getRequestDispatcher(page).forward(request, response);
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

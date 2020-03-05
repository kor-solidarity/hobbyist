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
import javax.servlet.http.HttpSession;

import com.dh.hobbyist.common.model.vo.PageInfo;
import com.dh.hobbyist.lesson.model.service.LessonService;
import com.dh.hobbyist.suggest.model.vo.Category;
import com.google.gson.Gson;


@WebServlet("/selectPopular.le")
public class SelectPopularLessonListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public SelectPopularLessonListServlet() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		ArrayList<HashMap<String, Object>> list = new LessonService().selectMainPopular();
		
		
		
		String page = "";
		if(list != null) {
			page = "views/lesson/mainPage.jsp";
			request.setAttribute("list", list);
			
			
		}else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "메인 페이지 조회 실패");
		}
	
		request.getRequestDispatcher(page).forward(request, response);
		
		
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

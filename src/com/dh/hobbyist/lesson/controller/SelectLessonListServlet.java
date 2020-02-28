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


@WebServlet("/selectList.le")
public class SelectLessonListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public SelectLessonListServlet() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ArrayList<HashMap<String, Object>> list = new LessonService().selectCategoryList();
		
		System.out.println("category list: " + list);
		
		String page = "";
		if(list != null) {
			for(HashMap<String, Object> hmap : list)
				for(Entry<String, Object> hmapEntry : hmap.entrySet()) {
					String key = hmapEntry.getKey();
					Object value = hmapEntry.getValue();
					if(key.equals("categoryCode") && Integer.parseInt(value.toString()) == 25) {
						page = "views/lesson/categoryBeautyPage.jsp";
						request.setAttribute("list", list);
					}
			}	
		}else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "카테고리별 수업 리스트 조회 실패");
		}
		request.getRequestDispatcher(page).forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

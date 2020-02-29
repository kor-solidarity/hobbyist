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


@WebServlet("/selectCategory.le")
public class SelectCategoryLessonListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public SelectCategoryLessonListServlet() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String parentCode2 = request.getParameter("parentCode").trim();
		int parentCode = Integer.parseInt(parentCode2);
		
		System.out.println("parentCode : " + parentCode);
		
//		Category cat = new Category();
//		cat.setParentCode(parentCode);
//		
//		System.out.println("Parent Code : " + cat);
		
		ArrayList<HashMap<String, Object>> list = new LessonService().selectCategoryLessonList(parentCode);
		
		String page = "";
		if(list != null) {
			for(HashMap<String, Object> hmap : list)
				for(Entry<String, Object> hmapEntry : hmap.entrySet()) {
					String key = hmapEntry.getKey();
					Object value = hmapEntry.getValue();
					if(key.equals("parentCode") && Integer.parseInt(value.toString()) == 1) {
						page = "views/lesson/categoryMusicPage.jsp";
						request.setAttribute("list", list);
					}else if(key.equals("parentCode") && Integer.parseInt(value.toString()) == 9){
						page = "views/lesson/categoryDancePage.jsp";
						request.setAttribute("list", list);
					}else if(key.equals("parentCode") && Integer.parseInt(value.toString()) == 15) {
						page = "views/lesson/categoryVideoPage.jsp";
						request.setAttribute("list", list);
					}else if(key.equals("parentCode") && Integer.parseInt(value.toString()) == 20) {
						page = "views/lesson/categoryLifePage.jsp";
						request.setAttribute("list", list);
					}else if(key.equals("parentCode") && Integer.parseInt(value.toString()) == 25) {
						page = "views/lesson/categoryBeautyPage.jsp";
						request.setAttribute("list", list);
					}else if(key.equals("parentCode") && Integer.parseInt(value.toString()) == 33) {
						page = "views/lesson/categoryDesignPage.jsp";
						request.setAttribute("list", list);
					}else if(key.equals("parentCode") && Integer.parseInt(value.toString()) == 37) {
						page = "views/lesson/categorySportsPage.jsp";
						request.setAttribute("list", list);
					}
				}
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

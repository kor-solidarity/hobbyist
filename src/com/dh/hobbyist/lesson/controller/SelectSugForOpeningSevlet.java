package com.dh.hobbyist.lesson.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dh.hobbyist.suggest.model.service.CategoryService;
import com.dh.hobbyist.suggest.model.service.SuggestService;
import com.dh.hobbyist.suggest.model.vo.Category;
import com.dh.hobbyist.suggest.model.vo.Petition;

/**
 * Servlet implementation class InsertLessonWithSuggestionServlet
 */
@WebServlet("/selectSugFor.le")
public class SelectSugForOpeningSevlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectSugForOpeningSevlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//건의 상세에서 "수업 개설하기"버튼을 눌러서 수업코드를 불러온다.
		int petitionCode = Integer.parseInt(request.getParameter("petitionCode"));
		
		Petition p = new SuggestService().selectOne(petitionCode);
		
		System.out.println("p.getCategoryCode() : " + p.getCategoryCode());
		
		//카데고리의 코드를 넘겨야 하는데 상세카데고리의 코드를 넘겨서 return이 안됨
		
		//상세카데고리 코드로 부모 카데고리 코드를 구하기 위한 처리
		int parentCategoryCode = 0;
		
		if(p.getCategoryCode() < 9) {
			parentCategoryCode = 1;
		} else if(p.getCategoryCode() < 15) {
			parentCategoryCode = 9;
		} else if(p.getCategoryCode() < 20) {
			parentCategoryCode = 15;
		} else if(p.getCategoryCode() < 25) {
			parentCategoryCode = 20;
		} else if(p.getCategoryCode() < 33) {
			parentCategoryCode = 25;
		} else if(p.getCategoryCode() < 37) {
			parentCategoryCode = 33;
		} else {
			parentCategoryCode = 37;
		}
		
		List<Category> subCategoryList = new CategoryService().selectDetailCategory(parentCategoryCode);
		
		System.out.println("subCategoryList : " + subCategoryList);
		
		String page = "";
		
		if(p != null) {
			page = "views/lesson/openLessonBySugMain.jsp";
			request.setAttribute("petition", p);
			//request.setAttribute("subCategoryList", subCategoryList);
			request.setAttribute("parentCategoryCode", parentCategoryCode);
		} else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "건의 받아 수업 개설 실패");
		}
		
		request.getRequestDispatcher(page).forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}











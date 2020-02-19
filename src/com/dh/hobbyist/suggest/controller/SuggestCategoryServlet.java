package com.dh.hobbyist.suggest.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dh.hobbyist.suggest.model.service.CategoryService;
import com.dh.hobbyist.suggest.model.vo.Category;
import com.google.gson.Gson;

/**
 * Servlet implementation class SuggestCategoryServlet
 */
@WebServlet("/category.su")
public class SuggestCategoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SuggestCategoryServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String categoryName = request.getParameter("categoryName");
		int categoryCode = 0;
		
		//카테고리명을 통해서 DB에서 쓰이는 대분류의 categoryCode 설정
		switch(categoryName) {
		case "music": categoryCode = 1; break;
		case "dance": categoryCode = 9; break;
		case "picture" : categoryCode = 15; break;
		case "life" : categoryCode = 20; break;
		case "beauty" : categoryCode = 25; break;
		case "design" : categoryCode = 33; break;
		case "sports" : categoryCode = 37; break;
		default : break;
		}
		
		ArrayList<String> list = new CategoryService().selectDetailCategory(categoryCode);
		//System.out.println("category : " + categoryCode);
		//System.out.println("list : " + list);
		
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		
		new Gson().toJson(list, response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

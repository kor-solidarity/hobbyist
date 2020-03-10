package com.dh.hobbyist.suggest.controller;

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
		
		//System.out.println("p.getCategoryCode() : " + p.getCategoryCode());
		
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
		
		//System.out.println("subCategoryList : " + subCategoryList);
		
		//DB에 한글로 저장된 지역 정보대로 select-option의 default 설정을 위한 변수 설정
		String location[] = p.getLocation().split("/");
		int region = 0;
		
		switch(location[0]) {
		case "서울": region = 1; break;
		case "부산": region = 2; break;
		case "대구": region = 3; break;
		case "인천": region = 4; break;
		case "광주": region = 5; break;
		case "대전": region = 6; break;
		case "울산": region = 7; break;
		case "세종": region = 261; break;
		case "강원": region = 8; break;
		case "경기": region = 9; break;
		case "경남": region = 10; break;
		case "경북": region = 11; break;
		case "전남": region = 12; break;
		case "전북": region = 13; break;
		case "제주": region = 14; break;
		case "충남": region = 15; break;
		case "충북": region = 16; break;
		}
		
		System.out.println("region : " + region);
		
		//선호 요일 변수 설정
		String rd = p.getRequestedDays();
		String days = "";
		
		if(rd.equals("weekday")) {
			days = "평일";
		} else if(rd.equals("weekend")) {
			days = "주말";
		} else {
			days = "무관";
		}
		
		//System.out.println("선호 요일 : " + days);
		
		//선호 시간 변수 설절
		String rt = p.getRequestTime();
		String time = "";
		
		if(rt.equals("dawn")) {
			time = "새벽반";
		} else if(rt.equals("am")) {
			time = "오전반";
		} else if(rt.equals("pm")) {
			time = "오후반";
		} else if(rt.equals("evening")) {
			time = "저녁반";
		} else {
			time = "무관";
		}
		
		String page = "";
		
		if(p != null) {
			page = "views/lesson/openLessonBySugMain.jsp";
			request.setAttribute("petition", p);
			request.setAttribute("parentCategoryCode", parentCategoryCode);
			request.setAttribute("region", region);
			request.setAttribute("subRegion", location[1]);
			request.setAttribute("requestedDays", days);
			request.setAttribute("requestedTime", time);
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











package com.dh.hobbyist.suggest.controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dh.hobbyist.suggest.model.service.SuggestService;
import com.dh.hobbyist.suggest.model.vo.Petition;

/**
 * Servlet implementation class InsertSuggestServlet
 */
@WebServlet("/insert.sg")
public class InsertSuggestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertSuggestServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String detailCategory = request.getParameter("detailCategory");
		String maxNum = request.getParameter("maxNum");
		String classPay = request.getParameter("classPay");
		String classTimes = request.getParameter("classTimes");
		String area1 = request.getParameter("area1");
		String area2 = request.getParameter("area2");
		String wantDate = request.getParameter("wantDate");
		String day = request.getParameter("day");
		String time = request.getParameter("time");
		String sugTitle = request.getParameter("sugTitle");
		String sugContent = request.getParameter("sugContent");
		String loginMemberCode = request.getParameter("loginMemberCode");
		
		String[] cat_name = {"서울","부산","대구","인천","광주","대전","울산","강원","경기","경남","경북","전남","전북","제주","충남","충북"};
		
		String location = cat_name[Integer.parseInt(area1) - 1] + "/" + area2;
		
		Petition petition = new Petition();
		petition.setNumOfStudents(maxNum);
		petition.setCost(Integer.parseInt(classPay));
		
		if(classTimes.equals("일회차")) {
			petition.setNumOfLessons(0);
		} else if(classTimes.equals("다회차")) {
			petition.setNumOfLessons(1);
		}
		Date requestedDate = Date.valueOf(wantDate);
		
		petition.setLocation(location);
		petition.setRequestedDate(requestedDate);
		petition.setRequestedDays(day);
		petition.setRequestTime(time);
		petition.setTitle(sugTitle);
		petition.setContents(sugContent);
		petition.setPetitionedMember(Integer.parseInt(loginMemberCode));
		petition.setCategoryCode(Integer.parseInt(detailCategory));

		System.out.println(petition);
		
		int result = new SuggestService().insertSuggest(petition);
		
		
		if(result > 0) {
			//request.getRequestDispatcher("/selectList.sg").forward(request, response);;
			//String page = "/hobbyist/selectList.sg";
			response.sendRedirect("/hobbyist/selectList.sg");
		} else {
			request.setAttribute("msg", "게시판 작성 실패");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}

	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

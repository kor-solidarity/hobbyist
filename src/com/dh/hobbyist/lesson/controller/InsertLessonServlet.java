package com.dh.hobbyist.lesson.controller;

import java.io.IOException;
import java.sql.Date;
import java.sql.Time;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dh.hobbyist.lesson.model.service.LessonRelatedService;
import com.dh.hobbyist.lesson.model.vo.Lesson;
import com.dh.hobbyist.lesson.model.vo.LessonOrder;
import com.dh.hobbyist.lesson.model.vo.LessonSchedule;
import com.dh.hobbyist.member.model.vo.Member;

/**
 * Servlet implementation class InsertLessonServlet
 */
@WebServlet("/insert.le")
public class InsertLessonServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertLessonServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//수업 관련 사항
		String lessonName = request.getParameter("lessonTitle");
		int minStudents = Integer.parseInt(request.getParameter("min"));
		int maxStudents = Integer.parseInt(request.getParameter("max"));
		int totalOrders = Integer.parseInt(request.getParameter("inputOrder"));
		int costPerOrder = Integer.parseInt(request.getParameter("cost"));
		int totalCosts = totalOrders * costPerOrder;
		String artistIntro = request.getParameter("artIntro");
		String lessonIntro = request.getParameter("lessonIntro");
		int categoryCode = Integer.parseInt(request.getParameter("subCategory"));
		int artistCode = ((Member) (request.getSession().getAttribute("loginMember"))).getMemberCode();
		
		Lesson lesson = new Lesson();
		lesson.setLessonName(lessonName);
		lesson.setMinStudents(minStudents);
		lesson.setMaxStudents(maxStudents);
		lesson.setTotalOrders(totalOrders);
		lesson.setCostPerOrder(costPerOrder);
		lesson.setTotalCosts(totalCosts);
		lesson.setArtistIntro(artistIntro);
		lesson.setLessonIntro(lessonIntro);
		lesson.setCategoryCode(categoryCode);
		lesson.setArtistCode(artistCode);
		
		//수업일정 관련 사항
		int region = Integer.parseInt(request.getParameter("region"));
		System.out.println("region :  " + region);
		
		String[] cat_name = {"서울","부산","대구","인천","광주","대전","울산","강원","경기","경남","경북","전남","전북","제주","충남","충북"};
		String koreanRegion = "";
		String subRegion = "";
		
		if(region <= 16) {
			koreanRegion = cat_name[region - 1];
			subRegion = request.getParameter("subRegion");
		} else if(region == 261){
			koreanRegion = "세종";
			subRegion = "_";
		}
		System.out.println("subRegion :  " + subRegion);
		
		String address = "상세주소는 파악중입니다";
		
		LessonSchedule schedule = new LessonSchedule();
		schedule.setRegion(koreanRegion);
		schedule.setSubRegion(subRegion);
		schedule.setAddress(address);
		
		//수업회차 관련 사항
		int orderTime = 0;
		int orderStart = 0;
		int orderEnd = 0;
		
		ArrayList orderList = new ArrayList();
		for(int i = 1; i <= totalOrders; i++) {
			Long start = Long.parseLong(request.getParameter("start" + i));
			Long end = Long.parseLong(request.getParameter("end" + i));
			
			LessonOrder order = new LessonOrder();
			order.setOrderTime(i);
			order.setOrderStart(new Timestamp(start));
			order.setOrderEnd(new Timestamp(end));
			
			orderList.add(order);
		}
		
		//각 vo들을 하나로 담을 HashMap 선언
		HashMap lessonRelated = new HashMap();
		lessonRelated.put("lesson", lesson);
		lessonRelated.put("schedule", schedule);
		lessonRelated.put("orderList", orderList);
		
		int result = new LessonRelatedService().insertLessonRelated(lessonRelated);
		
		String page = "";
		if(result == totalOrders) {
			page = "views/common/successPage.jsp";
			request.setAttribute("successCode", "insertLesson");
		} else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "수업 등록에 실패하였습니다");
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

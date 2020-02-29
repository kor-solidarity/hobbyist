package com.dh.hobbyist.lesson.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dh.hobbyist.lesson.model.service.LessonRelatedService;
import com.dh.hobbyist.lesson.model.vo.Lesson;
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
		//수업 관련 변수
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
		
		/*System.out.println("Servlet Test : " + lessonName + ", " + minStudents + ", " + maxStudents + ", " + totalOrders + ", " + costPerOrder + ", " + artistIntro + ", " +
						lessonIntro + ", " + status + ", " + categoryCode + ", " + artistCode);*/
		
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
		
		//Lesson이 DB에 성공적으로 들어가면 lessonCode를 return
		int lessonCode = new LessonRelatedService().insertLesson(lesson);	
		
		//수업일정 관련 변수
		String region = request.getParameter("region");
		String subRegion = request.getParameter("subRegion");
		String address = "상세주소는 파악중입니다";
		
		LessonSchedule schedule = new LessonSchedule();
		schedule.setLessonCode(lessonCode);
		schedule.setRegion(region);
		schedule.setSubRegion(subRegion);
		schedule.setAddress(address);
		
		int scheduleResult = new LessonRelatedService().insertSchedule(schedule);
		
		String page = "";
		if(lessonCode > 0 && scheduleResult > 0) {
			
			//수업 DB에서 수업코드를 조회해와야 함. 그리고 수업일정 DB를 INSERT해야 함.
			//내 아티스트 코드로 검색한 것 중에 가장 최신 것
			
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

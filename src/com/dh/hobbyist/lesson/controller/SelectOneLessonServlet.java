package com.dh.hobbyist.lesson.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dh.hobbyist.artist.model.vo.ArtistCareer;
import com.dh.hobbyist.artist.model.vo.ArtistCerts;
import com.dh.hobbyist.artist.model.vo.ArtistEducation;
import com.dh.hobbyist.lesson.model.service.LessonRelatedService;
import com.dh.hobbyist.lesson.model.vo.Image;
import com.dh.hobbyist.lesson.model.vo.Lesson;
import com.dh.hobbyist.lesson.model.vo.LessonOrder;
import com.dh.hobbyist.lesson.model.vo.LessonSchedule;
import com.dh.hobbyist.member.model.vo.Member;

/**
 * Servlet implementation class SelectOneLessonServlet
 */
@WebServlet("/selectOne.le")
public class SelectOneLessonServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectOneLessonServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//view 페이지에서 넘겨준 lessonCode를 담는다.
		int lessonCode = Integer.parseInt(request.getParameter("lessonCode"));
		//int lessonCode = 53;		//유승이가 카데고리 페이지에서 수업코드를 넘겨주기 전 테스트를 위한 특정 값
		
		Lesson lesson = new LessonRelatedService().selectOneLesson(lessonCode);
		
		//해당 수업의 회원코드를 불러와 그 회원의 프로필 사진을 조회
		int artistCode = lesson.getArtistCode();
		
		Image profileImg = new LessonRelatedService().selectProfileImage(artistCode);
		Member artist = new LessonRelatedService().selectOneArtist(artistCode);
		
		ArrayList<LessonSchedule> scheduleList = new LessonRelatedService().selectScheduleList(lessonCode);
		ArrayList<Image> lessonImageList = new LessonRelatedService().selectLessonImageList(lessonCode);
	
		//수업 회차 정보를 조회
		ArrayList<LessonOrder> orderList = null;
		HashMap orderPerSchedule = new HashMap();
		
		for(int i = 0; i < scheduleList.size(); i++) {
			int scheduleCode = ((LessonSchedule) scheduleList.get(i)).getScheduleCode();
			System.out.println("scheduleCode : " + scheduleCode);
			
			orderList = new LessonRelatedService().selectOrderList(scheduleCode);
			
			orderPerSchedule.put(scheduleCode, orderList);
		}
		
		//System.out.println("oderPerSchedule : " + orderPerSchedule);
		
		//아티스트 자격 & 학력 & 경력
		ArrayList<ArtistCerts> certList = new LessonRelatedService().selectCertList(lessonCode);
		ArrayList<ArtistEducation> eduList = new LessonRelatedService().selectEdu(artistCode);
		ArrayList<ArtistCareer> careerList = new LessonRelatedService().selectCareer(lessonCode);
		
		String page = "";
		if(lesson != null && profileImg != null && artist != null && scheduleList != null) {
			page = "views/lesson/lessonDetail.jsp";
			request.setAttribute("lesson", lesson);
			request.setAttribute("profileImg", profileImg);
			request.setAttribute("artist", artist);
			request.setAttribute("scheduleList", scheduleList);
			request.setAttribute("lessonImageList", lessonImageList);
			request.setAttribute("orderPerSchedule", orderPerSchedule);
			request.setAttribute("certList", certList);
			request.setAttribute("eduList", eduList);
			request.setAttribute("careerList", careerList);
		} else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "수업 상세보기 실패");
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







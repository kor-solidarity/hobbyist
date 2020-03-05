package com.dh.hobbyist.lesson.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dh.hobbyist.lesson.model.service.LessonRelatedService;
import com.dh.hobbyist.lesson.model.vo.Image;
import com.dh.hobbyist.lesson.model.vo.Lesson;
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
		
		System.out.println("lessonImageList : " + lessonImageList);
		
		String page = "";
		if(lesson != null && profileImg != null && artist != null && scheduleList != null) {
			page = "views/lesson/lessonDetail.jsp";
			request.setAttribute("lesson", lesson);
			request.setAttribute("profileImg", profileImg);
			request.setAttribute("artist", artist);
			request.setAttribute("scheduleList", scheduleList);
			request.setAttribute("lessonImageList", lessonImageList);
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







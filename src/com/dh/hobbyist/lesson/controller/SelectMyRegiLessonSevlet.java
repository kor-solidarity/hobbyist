package com.dh.hobbyist.lesson.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dh.hobbyist.lesson.model.service.LessonRelatedService;
import com.dh.hobbyist.lesson.model.vo.Lesson;
import com.dh.hobbyist.lesson.model.vo.MyRegiLesson;
import com.dh.hobbyist.member.model.vo.Member;

/**
 * Servlet implementation class SelectMyRegisteredLessonListSevlet
 */
@WebServlet("/selectMyRegi.le")
public class SelectMyRegiLessonSevlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectMyRegiLessonSevlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int memberCode = ((Member) request.getSession().getAttribute("loginMember")).getMemberCode();
		
		
		ArrayList lessonCodeList = new LessonRelatedService().selectLessonCodeList(memberCode);
		ArrayList<MyRegiLesson> myList = new LessonRelatedService().selectRegisteredLesson(memberCode, lessonCodeList);
		
		String page = "";
		if(myList.size() == lessonCodeList.size()) {
			page = "views/member/myPage/myLesson/registeredLesson.jsp";
			request.setAttribute("myList", myList);
		} else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "등록한 수업 조회 실패");
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

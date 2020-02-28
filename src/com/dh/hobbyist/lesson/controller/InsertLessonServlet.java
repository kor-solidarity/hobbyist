package com.dh.hobbyist.lesson.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		String lessonName = request.getParameter("lessonTitle");
		int minStudents = Integer.parseInt(request.getParameter("min"));
		int maxStudents = Integer.parseInt(request.getParameter("max"));
		int totalLessons = Integer.parseInt(request.getParameter("inputOrder"));
		int totalCosts = Integer.parseInt(request.getParameter("cost"));
		String artistIntro = request.getParameter("artIntro");
		String lessonIntro = request.getParameter("lessonIntro");
		String status = "일정 진행중";
		int categoryCode = Integer.parseInt(request.getParameter("subCategory"));
		
		int artistCode = ((Member) (request.getSession().getAttribute("loginMember"))).getMemberCode();
		
		System.out.println("Servlet Test : " + lessonName + ", " + minStudents + ", " + maxStudents + ", " + totalLessons + ", " + totalCosts + ", " + artistIntro + ", " +
						lessonIntro + ", " + status + ", " + categoryCode + ", " + artistCode);
		
		
		
							
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
